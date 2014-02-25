class EventsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to event_url(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])

    @user_registration_id = UserEventRegistration.find_by_user_id_and_event_id(current_user.id, params[:id]).try(:id) || 0
    #FIXME:user's project
    @project_registration_id = ProjectEventRegistration.find_by_project_id_and_event_id(1, params[:id]).try(:id) || 0
  end
end
