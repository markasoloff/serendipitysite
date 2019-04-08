class EventController < ApplicationController
  def index
    @events = Event.all 
    render 'event/index.html.erb'
  end
end
