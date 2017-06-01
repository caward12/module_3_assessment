class SearchController < ApplicationController

  def index

    @stores = Store.nearby_stores(params[:q])

  end
end