class BestbuyService
  
  def initialize(zip)
    @zip = zip
    @key = ENV['BEST_BUY_KEY']
    @connection = Faraday.new('https://api.bestbuy.com')
  end

  def nearby_stores
    parser(@connection.get("/v1/stores(area(#{@zip},25))?format=json&show=longName,city,distance,phone,storeType&pageSize=10&apiKey=#{@key}"))[:stores]
  end

  private

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end