class Users::RegistrationsController < Devise::RegistrationsController

  prepend_before_filter :require_no_authentication, only: [:cancel]
  before_filter :update_sanitized_params, if: :devise_controller?

  def create
    # FIXME: Of course this is not nice, fix this when you have time. Move this into a Service?
    industries = params[:user].delete(:industries).reject {|i| i.blank?}.map {|i| i.downcase.parameterize.underscore}
    build_resource(sign_up_params)
    industries.each {|industry| resource.send("#{industry}=", true)}

    # Generate password token (with all these codes I probably need a service)
    password = Devise.friendly_token.first(20)
    resource.password = password
    resource.password_confirmation = password

    if resource.save
      EmailWorker.perform_async('ContactUsMailer', :new_user_one_time_password, {email: resource.email, password: password})
      yield resource if block_given?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        #NOTE: Hacky way to sign user out after signing up. Do not want to spend
        #too much time in devise documentation.
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)

        flash[:notice] = t(:'users.member_request_submitted')
        redirect_to root_url
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
       :username,
       :first_name,
       :last_name,
       :email,
       :password,
       :password_confirmation,
       :member_type,
       :company,
       :job_title,
       :biography,
       :avatar,
       :industries)
    end
  end
end
