class SearchesController < ApplicationController

  before_action -> {
                    set_search_action
  }, only: [:userindex, 
            :maintitleindex]
  before_action :set_search, only: [:genreindex,
                                    :order_popularity,
                                    :order_unpopular,
                                    :order_favorite,
                                    :order_unfavorite]

  def userindex
    @users = User.where(['nickname LIKE ? OR nickname LIKE ? OR nickname LIKE ? OR nickname LIKE ? OR nickname LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
  end

  def maintitleindex
    @maintitles = Maintitle.where(['maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
  end

  def genreindex
    if @search == "青春"
      @genre = 1
    elsif @search == "恋愛"
      @genre = 2
    elsif @search == "時代,歴史"
      @genre = 3
    elsif @search == "ホラー"
      @genre = 4
    elsif @search == "ファンタジー"
      @genre = 5
    elsif @search == "推理"
      @genre = 6
    elsif @search == "ライトノベル"
      @genre = 7
    elsif @search == "自伝"
      @genre = 8
    elsif @search == "その他"
      @genre = 9
    end
    @maintitles = Maintitle.where(genre: @genre).order("created_at DESC").page(params[:page]).per(10)
  end

  def order_popularity
    
    @maintitles = Maintitle.order(all_review: :DESC).page(params[:page]).per(10)
    
  end

  def order_unpopular
    @maintitles = Maintitle.order(all_review: :ASC).page(params[:page]).per(10)
    render 'searches/order_popularity'
  end

  def order_favorite 
    @maintitles = Maintitle.order(all_favorite: :DESC).page(params[:page]).per(10)
    render 'searches/order_popularity'
  end

  def order_unfavorite
    @maintitles = Maintitle.order(all_favorite: :ASC).page(params[:page]).per(10)
    render 'searches/order_popularity'
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

