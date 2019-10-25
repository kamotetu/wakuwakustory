class UsersController < ApplicationController

  def mypagemain
    @stories = Story.where(user_id: current_user.id).page(params[:page]).per(5)
  end
end
