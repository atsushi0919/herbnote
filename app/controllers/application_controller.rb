class ApplicationController < ActionController::Base
  ITEMS_PER_PAGE = 20

  # sessions_helper モジュールを読み込む
  include SessionsHelper

  private

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
