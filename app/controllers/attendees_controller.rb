class AttendeesController < ApplicationController
  def create
    @event_id = params[:attendee][:event_id]
    if Attendee.exists?(user_id: current_user.id, event_id: @event_id)
      p 'exists'
    else
      Attendee.create(attendee_params)

      @event_id = params[:attendee][:event_id]
      redirect_to event_path(@event_id)
    end
  end

  def edit
    @attendee = Attendee.find_by(user_id: params[:attendee][:user_id], event_id: params[:attendee][:event_id])
    @attendee.attendance = params[:attendee][:attendance]
    @attendee.save

    @event_id = params[:attendee][:event_id]
    redirect_to event_path(@event_id)
  end
  private
    def attendee_params
      params.require(:attendee).permit(:host_type, :user_id, :event_id, :attendance)
    end
end
