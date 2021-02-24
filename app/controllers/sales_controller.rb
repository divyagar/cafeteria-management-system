class SalesController < ApplicationController
  def index
    @orders = Order.all
    @total_orders = @orders.count
    @page = "Sales"
    render "index"
  end

  def fetch_data
    @contains_data = true
    array = params["starting_date"].split("-", -1)
    start = Date.new(array[0].to_i, array[1].to_i, array[2].to_i)
    array = params["ending_date"].split("-", -1)
    ending = Date.new(array[0].to_i, array[1].to_i, array[2].to_i)
    @orders = Order.where("date > ? and date < ?", start, ending)
    @total_orders = @orders.count
    @page = "Sales"
    render "index"
  end
end