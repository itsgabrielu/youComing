class AttendeesController < ApplicationController
  def create
    @event_id = params[:attendee][:event_id]

    Attendee.create(attendee_params)
    redirect_to event_path(@event_id)
  end

  def edit
    @attendee = Attendee.find_by(user_id: params[:attendee][:user_id], event_id: params[:attendee][:event_id])
    if !params[:attendee][:host_type].nil?
      @attendee.host_type = params[:attendee][:host_type]
    elsif !params[:attendee][:attendance].nil?
      @attendee.attendance = params[:attendee][:attendance]
    end
    @attendee.save

    @event_id = params[:attendee][:event_id]
    redirect_to event_path(@event_id)
  end
  private
    def attendee_params
      params.require(:attendee).permit(:host_type, :user_id, :event_id, :attendance)
    end
end
