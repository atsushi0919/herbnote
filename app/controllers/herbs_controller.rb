class HerbsController < ApplicationController
  def index
    @herbs = Herb.order(:name)
  end

  def new
  end

  def create
  end
end
