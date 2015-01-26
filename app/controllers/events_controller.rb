class EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json

  before_action :require_signin, only: [:index]

  def index
    @events = current_user.events
    @event_names = current_user.events.select(:name).group(:name)
    event_name = params[:event_name]
    @init_date_from = 7.days.ago
    @init_date_to = Date.today
    # binding.pry

    unless params[:date_start].nil? && params[:date_end].nil?
      @date_from = Date.new(params[:date_start][:year].to_i, params[:date_start][:month].to_i, params[:date_start][:day].to_i)
      @date_to = Date.new(params[:date_end][:year].to_i, params[:date_end][:month].to_i, params[:date_end][:day].to_i)
    end

    unless params[:event_name].nil?
      @chart = @events.select(:created_on).group(:created_on)
                      .where(name: event_name)
                      .where('created_on >= ?', @date_from)
                      .where('created_on <= ?', @date_to)
                      .count
    end
  end

  def new
    @event = Event.new
  end

  def create
    # binding.pry
    domain = Domain.find_by(url: params[:event][:source_url])

    if domain.nil?
      # return render text: "This domain name dose't exist!", status: :bad_request
      # return head :no_content, :status => :bad_request
      return render text: 'Invalid hostname!', content_type: 'text/plain', status: 400

    end

    user = User.find(domain.user_id)
    @event = user.events.new(event_params)
    properties = params[:event][:properties].map { |k,v| Property.new(key: k, value: v) }
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
    params.require(:event).permit(:properties)
  end
end
