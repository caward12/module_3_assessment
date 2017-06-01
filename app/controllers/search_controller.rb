class SearchController < ApplicationController

  def index
    @stores = Store.stores(params[:q]).paginate(:page => params[:page], :per_page =>10)

  end
end