require 'httparty'

def fetch_cryptocurrency_data
  url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
  response = HTTParty.get(url)
  return JSON.parse(response.body)
end

def top_5_cryptocurrencies(data)
  sorted_cryptocurrencies = data.sort_by { |crypto| -crypto['market_cap'] }

  top_5 = sorted_cryptocurrencies[0..4]
  return top_5
end

def display_top_5_cryptocurrencies(top_5)
  puts "Top 5 Cryptocurrencies by Market Capitalization:"
  puts

  top_5.each do |crypto|
    name = crypto['name']
    price = crypto['current_price']
    market_cap = crypto['market_cap']
    market_cap_formatted = "$#{market_cap.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
    puts "#{name}: $#{price} (Market Cap: #{market_cap_formatted})"
  end
end

cryptocurrency_data = fetch_cryptocurrency_data
top_5 = top_5_cryptocurrencies(cryptocurrency_data)

display_top_5_cryptocurrencies(top_5)
