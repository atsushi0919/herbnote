class HerbsController < ApplicationController
  PER_PAGE = 5

  def index
    @herbs = Herb.order(:name).page(params[:page]).per(PER_PAGE)
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
