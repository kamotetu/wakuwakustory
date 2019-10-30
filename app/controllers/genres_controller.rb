class GenresController < ApplicationController

  def blog
    @maintitles = Maintitle.where(genre: "ブログ")
    @m = []
    @m.push(@maintitles.ids)
    @stories = Story.where(maintitle_id: @m).order("created_at DESC").page(params[:page]).per(10)
    @user = current_user
    # @user = User.find(id:)
  end

end
