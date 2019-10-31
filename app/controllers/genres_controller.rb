class GenresController < ApplicationController

  

  def novel
    @maintitles = Maintitle.where(genre: "小説")
    @m = []
    @m.push(@maintitles.ids)
    @stories = Story.where(maintitle_id: @m).order("created_at DESC").page(params[:page]).per(10)
  end

  def blog
    @maintitles = Maintitle.where(genre: "ブログ")
    @m = []
    @m.push(@maintitles.ids)
    @stories = Story.where(maintitle_id: @m).order("created_at DESC").page(params[:page]).per(10)
  end

  def share
    @maintitles = Maintitle.where(genre: "情報共有")
    @m = []
    @m.push(@maintitles.ids)
    @stories = Story.where(maintitle_id: @m).order("created_at DESC").page(params[:page]).per(10)
  end

  def essay
    @maintitles = Maintitle.where(genre: "エッセイ")
    @m = []
    @m.push(@maintitles.ids)
    @stories = Story.where(maintitle_id: @m).order("created_at DESC").page(params[:page]).per(10)
  end

  def columu
    @maintitles = Maintitle.where(genre: "コラム")
    @m = []
    @m.push(@maintitles.ids)
    @stories = Story.where(maintitle_id: @m).order("created_at DESC").page(params[:page]).per(10)
  end


end
