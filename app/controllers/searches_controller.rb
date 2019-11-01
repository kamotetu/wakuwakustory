class SearchesController < ApplicationController

  before_action -> {
                    set_search_action
  }, only: [:titleindex, 
            :maintitleindex]
  before_action :set_search, only: [:genreindex]

  def titleindex
    @stories = Story.where(['title LIKE ? OR title LIKE ? OR title LIKE ? OR title LIKE ? OR title LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
  end

  def maintitleindex
    @maintitles = Maintitle.where(['maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
  end

  def genreindex
    if @search == "小説"
      @genre = 1
    elsif @search == "ブログ"
      @genre = 2
    elsif @search == "情報共有"
      @genre = 3
    elsif @search == "エッセイ"
      @genre = 4
    elsif @search == "コラム"
      @genre = 5
    end
    @maintitles = Maintitle.where(genre: @genre).order("created_at DESC").page(params[:page]).per(10)
  end

  private

  def set_search_action
    @search = (params[:search])
    @search_kana = (params[:search]).tr('ぁ-ん','ァ-ン')
    @search_hira = (params[:search]).tr('ァ-ン','ぁ-ん')
    @search_zenhan = (params[:search]).tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
    @search_hanzen = (params[:search]).tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  end

  def set_search
    @search = (params[:search])
  end
end

