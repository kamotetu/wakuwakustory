class SearchesController < ApplicationController

  def titleindex
    @search = (params[:search])
    @search_kana = (params[:search]).tr('ぁ-ん','ァ-ン')
    @search_hira = (params[:search]).tr('ァ-ン','ぁ-ん')
    @search_zenhan = (params[:search]).tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
    @search_hanzen = (params[:search]).tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
    @stories = Story.where(['title LIKE ? OR title LIKE ? OR title LIKE ? OR title LIKE ? OR title LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
  end

  def maintitleindex
    @search = (params[:search])
    @search_kana = (params[:search]).tr('ぁ-ん','ァ-ン')
    @search_hira = (params[:search]).tr('ァ-ン','ぁ-ん')
    @search_zenhan = (params[:search]).tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
    @search_hanzen = (params[:search]).tr('0-9a-zA-Z','０-９ａ-ｚＡ-Ｚ')
    @maintitles = Maintitle.where(['maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ? OR maintitle LIKE ?', "%#{@search}%", "%#{@search_kana}%", "%#{@search_hira}%", "%#{@search_zenhan}%", "%#{@search_hanzen}%"]).order("created_at DESC").page(params[:page]).per(10)
  end
end

