class ExpenseController < ApplicationController
  def initialize
    # name and token add directly here just for demo purposes
    # you need to hide your name & token when you're implement it in your app
    @name = "dan"
    @token = "5efa35011ec60b30976db7256c54a506"

  end

  def run_request request
    request.run
    response = request.response
    data = response.response_body
  end
  
  def create_expense
    request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses", 
      method: :post, 
      headers: { name: @name,token: @token },
      params: {date: "2015-2-19", amount: "2"}
    )
    return run_request(request)
  end

  def get_all_expenses
     request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses",
      method: :get,
      headers: { name: @name, token: @token }
  )
      return run_request(request)
  end
    
  def get_expenses_date_range
     request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses",
      method: :get,
      headers: { name: @name, token: @token },
      params: {start_date: "2015-2-17", end_date: "2015-2-19"}
  )
      return run_request(request)
  end

   def get_expenses_start_date
     request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses",
      method: :get,
      headers: { name: @name, token: @token },
      params: {start_date: "2015-2-17"}
  )
      return run_request(request)
  end

   def get_expenses_end_date
     request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses",
      method: :get,
      headers: { name: @name, token: @token },
      params: {end_date: "2015-2-19"}
  )
      return run_request(request)
  end

   def get_expenses_no_date
     request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses",
      method: :get,
      headers: { name: @name, token: @token }
  )
      return run_request(request)
  end

end
