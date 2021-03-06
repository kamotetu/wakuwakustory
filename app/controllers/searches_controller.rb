class SearchesController < ApplicationController

  before_action -> {set_search_action}, only: [:userindex]
  before_action -> {set_search_title_action}, only: [:maintitleindex] 
  before_action :set_search, only: [:genreindex,
                                    :order_popularity,
                                    :order_unpopular,
                                    :order_favorite,
                                    :order_unfavorite,
                                    :order_post,
                                    :order_unpost,
                                    :order_comment,
                                    :order_uncomment]

  def userindex
    @users = User.where(['nickname LIKE ? OR nickname LIKE ? OR nickname LIKE ? OR nickname LIKE ? OR nickname LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)

  end

  def maintitleindex
    @maintitles = Maintitle.where(['maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ?', "%#{@search_title}%", "%#{@search_title_kana}%", "%#{@search_title_hira}%", "%#{@search_title_zenhan}%", "%#{@search_title_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
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

  def order_post
    @maintitles = Maintitle.order(all_story: :DESC).page(params[:page]).per(10)
    render 'searches/order_popularity'
  end

  def order_unpost
    @maintitles = Maintitle.order(all_story: :ASC).page(params[:page]).per(10)
    render 'searches/order_popularity'
  end

  def order_comment
    @maintitles = Maintitle.order(all_comment: :DESC).page(params[:page]).per(10)
    render 'searches/order_popularity'
  end

  def order_uncomment
    @maintitles = Maintitle.order(all_comment: :ASC).page(params[:page]).per(10)
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

  def set_search_title_action
    @search_title = (params[:search_title])
    @search_title_kana = (params[:search_title]).tr('ぁ-ん','ァ-ン')
    @search_title_hira = (params[:search_title]).tr('ァ-ン','ぁ-ん')
    @search_title_zenhan = (params[:search_title]).tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
    @search_title_hanzen = (params[:search_title]).tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
  end

  def set_search
    @search = (params[:search])
  end
end

