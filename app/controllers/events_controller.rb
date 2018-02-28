class EventsController < ApplicationController
  def index
    @attending = Attendee.where('user_id = ?', current_user).includes(:event)
  end
  def new
  end
  def show
    @event=Event.find(params[:id])
    @attendees = Attendee.where(event_id: @event, host_type: true).includes(:user)
  end
  def create
    @event = Event.new(event_params)
    @event.save
    @attendee = Attendee.create(host_type: true, attendance: true, event_id: @event.id, user_id: current_user.id)
    redirect_to event_path(@event)
  end
  private
    def event_params
      params.require(:event).permit(:name, :location, :date_start, :date_end, :description)
    end
    def findUsers(item)
      item.each do |i|
        return User.find(i.user_id)
      end
    end
end
