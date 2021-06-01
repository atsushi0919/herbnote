class HerbsController < ApplicationController
  def index
    @herbs = Herb.order(:name)
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
