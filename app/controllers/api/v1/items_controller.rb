class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all, :status => 200
  end

  def show
  end

  def create

  end

  def destroy

  end

end