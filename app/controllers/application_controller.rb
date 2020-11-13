class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :authenticate_user
  def authenticate_user
    if current_user == nil
      redirect_to new_session_path, notice:'ログインしてください'
    end
  end
end
