class UsersController < ApplicationController

  def mypagemain
    @stories = Story.where(user_id: current_user.id)
  end
end
