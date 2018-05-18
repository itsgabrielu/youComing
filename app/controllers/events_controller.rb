class EventsController < ApplicationController
  def index
    @attending = Attendee.where('user_id = ?', current_user).includes(:event)
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
    if user_signed_in?
      @guestnothost = Attendee.find_by(user_id: current_user.id, event_id: @event.id, host_type: false)
    end
    @participants = Attendee.where(event_id: @event).where().not(attendance: nil).includes(:user)
    @going = Attendee.where(event_id: @event, attendance: true).includes(:user)
    @notgoing = Attendee.where(event_id: @event, attendance: false).includes(:user)
    @hosts = Attendee.where(event_id: @event, host_type: true).includes(:user)
    @guests = Attendee.where(event_id: @event, host_type: false).includes(:user)
    @url = request.original_url
  end

  def create
    @event = Event.create(event_params)
    @attendee = Attendee.create(host_type: true, attendance: true, event_id: @event.id, user_id: current_user.id)
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    # render plain: params.inspect
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end
  private
    def event_params
      params.require(:event).permit(:name, :location, :date_start, :date_end, :description)
    end
end
