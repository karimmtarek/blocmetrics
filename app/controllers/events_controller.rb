class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json

  before_action :require_signin, only: [:index]

  def index
    @events = Event.user_events(current_user).paginate(:page => params[:page], :per_page => 10)
    # @user_events = []
    # @events.each do |event|
    #   @user_events << event if domain_belongs_to_user?(current_user, event)
    # end
    respond_with(@events) do |format|
      format.json {render :json => @events}
    end
  end

  def new
    @event = Event.new
  end

  def create
    # binding.pry
    domain = Domain.where(url: params[:event][:source_url])
    user = User.find(domain[0].user_id)
    @event = user.events.new(event_params)
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
    params.require(:event).permit(:name, :source_url, :created_on)
  end

  def properties_params
    params.require(:properties).values
  end
end
