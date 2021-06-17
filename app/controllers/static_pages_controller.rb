class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
      @topics = HerbProperty.all
      @feed_items = current_user.feed.page(params[:page]).per(ITEMS_PER_PAGE)
    end
  end

  def about
  end
end
