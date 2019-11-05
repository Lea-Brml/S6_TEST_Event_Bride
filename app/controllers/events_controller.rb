class EventsController < ApplicationController

  before_action :authenticate_user, only: [:show]

  def index

    @event = Event.all

  end

  def new

  end

  def show

    @event = Event.find(params[:id])

  end

  def create

  end

end
