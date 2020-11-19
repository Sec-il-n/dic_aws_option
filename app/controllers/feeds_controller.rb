class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @feed.save
        redirect_to feeds_path, notice:'写真が投稿されました。'
        begin
          ConfirmMailer.confirm_mail(current_user).deliver
        rescue => e
          puts e.class
          puts e.message
        end
      else
        render :new
      end
    end
  end
  def update
      if @feed.update(feed_params)
        redirect_to feed_path, notice: '編集が完了しました。'
      else
        flash.now[:danger] = '編集は失敗しました。'
        render :edit
      end
  end
  def confirm
    @feed = Feed.new(feed_params)
  end
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: '投稿を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:image, :image_cache, :comment)
  end
end
