class HerbsController < ApplicationController
  def index
    @herbs = Herb.order(:name)
  end

  def show
    @herb = Herb.find(params[:id])
  end

  def new
  end

  def create
  end
end
