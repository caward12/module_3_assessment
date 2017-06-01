class Api::V1::ItemsController < ApplicationController
   skip_before_action :verify_authenticity_token
  def index
    render json: Item.all, :status => 200
  end

  def show
    render json: Item.find(params[:id]), :status => 200
  end

  def create
    render json: Item.create(item_params), :status => 201
  end

  def destroy
    item = Item.find(params[:id])
    render json: item.destroy, :status => 204
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end