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
      respond_to do |format|
        format.json { render :json => @event }
      end
    end
  end

private

  def event_params
    params.require(:event).permit(:name, :tag_name, :action, :referrer)
  end
end
