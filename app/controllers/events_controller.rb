class EventsController < ApplicationController
  def index
    @attending = Attendee.where('user_id = ?', current_user).includes(:event)
  end

  def new
  end

  def show
    @event = Event.find(params[:id])
    @attendees = Attendee.where(event_id: @event, host_type: true).includes(:user)
    @url = request.original_url
    p 'original url'
    p @url
  end

  def create
    @event = Event.create(event_params)
    @attendee = Attendee.create(host_type: true, attendance: true, event_id: @event.id, user_id: current_user.id)
    redirect_to event_path(@event)
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :date_start, :date_end, :description)
    end
end
