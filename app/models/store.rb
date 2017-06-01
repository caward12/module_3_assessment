class Store

  attr_reader :name, :city, :distance, :phone, :store_type

  def initialize(data)
    @name = data[:longName]
    @city = data[:city]
    @distance = data[:distance]
    @phone = data[:phone]
    @store_type = data[:storeType]
  end

  def self.nearby_stores(zip)
    BestbuyService.new(zip).nearby_stores.map do |data|
      new(data)
    end
  end
end