class UsersController < ApplicationController



  def show

    @user = User.find(current_user.id)
    @event = Event.all

  end


end
