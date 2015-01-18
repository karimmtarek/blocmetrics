class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      head :created
      # render :json => @event, :status => :created
    else
      render :json => @event.errors, :status => :bad_request
    end

  end

private

  def event_params
    params.require(:event).permit(:name)
  end
end
