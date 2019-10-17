class StoriesController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @stories = Story.new
    # @stories_tag = story.tag_list.add('Ruby', 'Rails', 'Rspec', 'Sinatra')
  end

  def create
    @story = current_user.stories.create(stories_params)
    category_list = params[:category_list].split(",")
    if @story.save
      @story.save_categories(category_list)

      # flash[:success] = "記事を作成しました"
      # redirect_to articles_url
    else
      # render 'articles/new'
    end
  end

  private

  def stories_params
    params.require(:story).permit(
      :title, 
      :story, 
      :category_list).merge(user_id: current_user.id)

  end

end
