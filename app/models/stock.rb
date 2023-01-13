class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    validates :name, :ticker, presence: true

    def self.new_lookup(ticker_symbol)
        rand(300)
    end

    def self.demo_lookup(ticker_symbol)
        require 'open-uri'
        require 'json'
        begin
            info = JSON.parse(URI.open("https://data.nasdaq.com/api/v3/datasets/WIKI/#{ticker_symbol}.json").read)
            return new(ticker: ticker_symbol, name: info["dataset"]["name"][0...-52], last_price: info["dataset"]["data"][0][1]) 
        rescue => exception
            return nil
        end
    end

end
