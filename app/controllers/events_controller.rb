class EventsController < ApplicationController
  def index
    
  end
  def new
  end
  def show
    @event=Event.find(params[:id])
  end
  def create
    @event = Event.new(event_params)
    @event.save

    redirect_to user_event_path(current_user,@event)
  end
  private
    def event_params
      params.require(:event).permit(:name, :location, :date_start, :date_end, :description)
    end
end
