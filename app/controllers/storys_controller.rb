class StorysController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @story = Story.new
  end

  def create

  end
end
