class HerbsController < ApplicationController
  PER_PAGE = 20

  def index
    @q = Herb.includes([:herb_properties]).order(:name).ransack(params[:q])
    @herbs = @q.result.page(params[:page]).per(PER_PAGE)
  end

  def show
    @herb = Herb.find(params[:id])
    @description = @herb.herb_description
  end

  def new
  end

  def create
  end
end
