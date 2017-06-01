class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all, :status => 200
  end

  def show
    render json: Item.find(params[:id]), :status => 200
  end

  def create
    item = Item.create(item_params)
  end

  def destroy

  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end