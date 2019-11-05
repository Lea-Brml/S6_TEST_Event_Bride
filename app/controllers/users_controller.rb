class UsersController < ApplicationController



  def show

    @user = User.find(current_user.id)
    @event = Event.where(administrator: current_user.id)

  end


end
