class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
      if @event.save
        redirect_to events_path
      else
        render :edit
      end
  end

  private

  def event_params
    params.require(:event).permit(
    :date,
    :description,
    :requires_id,
    :capacity,
    :directions,
    )
  end

  # def set_event
  #   @event = Event.find(params[:id])
  # end

end
