class FavoriteHerbsController < ApplicationController
  def create
    current_user.favorite_herbs.create!(herb_id: params[:herb_id])
    @herb = Herb.find(params[:herb_id])
  end

  def destroy
    current_user.favorite_herbs.find_by(herb_id: params[:herb_id]).destroy!
    @herb = Herb.find(params[:herb_id])
  end
end
