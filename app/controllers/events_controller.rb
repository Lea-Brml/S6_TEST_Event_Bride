class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :new, :edit]

  def index

    @event = Event.all
    @attendance = Attendance.all

  end

  def new

    @event = current_user    #pour les alertes mais il y a un bugg inexpliquable, affaire a suivre
    @event = Event.new

  end

  def show

    @event = Event.find(params[:id])
    @attendance = Attendance

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


  def edit

    @user = User.all
    @event = Event.find(params[:id])

  end


  def update

    @event = Event.find(params[:id])

      if @event.update(title: params[:title], location: params[:location], start_date: params[:start_date], duration: params[:duration], description: params[:description], price: params[:price], administrator_id: current_user.id )
        flash[:success] = "Ton event a été mis à jour"
        redirect_to user_path(current_user)
      else
        flash.now[:danger] = "Il y a eu un pb."
        render :edit
      end

  end


  def destroy

    @event = Event.find(params[:id])

    if @event.destroy
      flash[:success] = "Ton event a été supprimé"
      redirect_to user_path(current_user)
    else
      render :show
    end


  end

end
