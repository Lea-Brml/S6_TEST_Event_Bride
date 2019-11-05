class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def index

    @event = Event.all

  end

  def new

    @event = current_user    #pour les alertes mais il y a un bugg inexpliquable, affaire a suivre
    @event = Event.new

  end

  def show

    @event = Event.find(params[:id])

  end

  def create

    @event = Event.new(title: params[:title], location: params[:location], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price], administrator_id: current_user.id )

    if @event.save
      flash[:success] = "Ton Evenement a été créé !"
      redirect_to events_path
    else
      flash.now[:danger] = "Ton evenement n'a pas été créé"
      render :new
    end

  end

end
