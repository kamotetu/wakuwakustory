class StoriesController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @stories = Story.new
  end

  def create
  end

end
