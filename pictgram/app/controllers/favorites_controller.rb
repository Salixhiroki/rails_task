class FavoritesController < ApplicationController


  def index
    @favorite_topics=current_user.favorite_topics
    # binding.pry
  end

  def create
  
    @favorite=Favorite.new
    # お気に入りを登録するuser_id
    @favorite.user_id=current_user.id
    # お気に入りを登録されるtopic_id
    @favorite.topic_id=params[:topic_id]
    if @favorite.save
      redirect_to topics_path, success: 'お気に入りを登録しました'
    else
      # redirect_to topics_path, danger: 'お気に入りの登録に失敗しました'
      flash.now[:danger]='お気に入りの登録に失敗しました'
    end
  end
  
  
  def cancel
    @favorite=Favorite.find_by(user_id: current_user.id,topic_id: params[:topic_id])
    @favorite.destroy
    redirect_to topics_path, success: 'お気に入りを解除しました'
  end
  
end
