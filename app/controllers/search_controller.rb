class SearchController < ApplicationController

  def index
    @stores = Store.stores(params[:q])
  end
end