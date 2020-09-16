namespace :dev do
  task :fetch_ticker => :environment do
    puts "Fetch ticker data..."
    # response = RestClient.get "https://testnet.binance.vision/api/v3/ticker/24hr"
    # response = RestClient.get "https://api.binance.com/api/v3/ticker/24hr"
    response = RestClient.get "https://api.binance.com/api/v3/ticker/24hr?symbol=BTCUSDT"

    data.each do |t|
      existing_symbol = Ticker.find_by_symbol( t["symbol"] )
      if existing_symbol.nil?
        Ticker.create!( :symbol => t["symbol"], :openPrice => t["openPrice"],
                      :openTime => t["openTime"], :closeTime => t["closeTime"],
                      :created_at => t["created_at"] )
      end
    end

    puts "Total: #{Ticker.count} symbols"
  end
end
