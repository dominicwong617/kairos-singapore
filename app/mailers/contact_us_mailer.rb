class ContactUsMailer < ActionMailer::Base
  default from: "notification@kairossociety.com.sg"

  def contact_us(data)
    @message = data['message']
    mail(to: 'jian.sim@kairossociety.org', subject: data['subject'])
    mail(to: 'dominic.wong.617@gmail.com', subject: data['subject'])
  end

  def new_user_one_time_password(data)
    @email = data['email']
    @password = data['password']
    mail(to: 'jian.sim@kairossociety.org', subject: 'New User with one time password')
    mail(to: 'dominic.wong.617@gmail.com', subject: 'New User with one time password')
  end
end
