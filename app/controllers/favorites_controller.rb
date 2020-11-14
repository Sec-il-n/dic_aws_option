class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorite_feeds
  end
  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id] )
    redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんの写真をお気に入りに追加しました。"
  end
  def destroy
    @favorite = current_user.favorites.find_by(feed_id: params[:feed_id]).destroy

    redirect_to feeds_path, notice: "#{@favorite.user.name}さんの写真をお気に入りから削除しました。"
  end
end
