class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def index

    @event = Event.all

  end

  def new

    @evenement = current_user
    @evenement = Event.new

  end

  def show

    @event = Event.find(params[:id])

  end

  def create

    @evenement = Event.new(title: params[:title], location: params[:location], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price], administrator_id: current_user.id )

    if @evenement.save
      flash[:success] = ""
      redirect_to events_path
    else
      render :new
    end

  end

end
