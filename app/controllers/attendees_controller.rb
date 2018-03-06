class AttendeesController < ApplicationController
  def create
    if Attendee.exists?(user_id: current_user.id)
      p 'exists'
    else
      @event_id = params[:attendee][:event_id]
      Attendee.create(attendee_params)
      redirect_to event_path(@event_id)
    end
  end
  private
    def attendee_params
      params.require(:attendee).permit(:host_type, :user_id, :event_id, :attendance)
    end
end
