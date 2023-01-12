class StocksController < ApplicationController
    def search
        @stock = Stock.demo_lookup(params[:stock])
        render 'users/my_portfolio'
    end
end