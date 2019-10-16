class StorysController < ApplicationController
  def index
    @users = User.all
  end
end
