class ParticipantsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @participant = @event.participants.new(params.require(:participant).permit(:name))
    if @participant.save
      redirect_to event_url(@event)
    else
      redirect_to event_url(@event)
    end
  end

  def add_guest
    @event = Event.find(params[:event_id])
    @participant = Participant.find(params[:id])
    @participant.guests += 1
    @participant.save
    redirect_to event_url(@event)
  end
end
