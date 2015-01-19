class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json

  def index
    @events = Event.all
    respond_with(@events) do |format|
      format.json {render :json => @events}
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    # @event.created_on = Date.today
    properties = properties_params.map {|props| Property.new(props)}
    @event.properties = properties

    if @event.save
      head :created
      # render :json => @event, :status => :created
    else
      render :json => @event.errors, :status => :bad_request
    end
  end

private

  def event_params
    params.require(:event).permit(:name, :created_on)
  end

  def properties_params
    params.require(:properties).values
  end
end
