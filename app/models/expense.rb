class Expense < ActiveRecord::Base

  belongs_to :type

  # action to send day's expenses to expenseriser
  def self.submit amount, category, date    

    # call expenseriser name and token
    name = ENV["exp_name"]
    token = ENV["exp_token"]

    byebug
    
    # build request
    request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses", 
      method: :post, 
      headers: { name: name,token: token },
      params: {date: date, amount: amount, category: category}
    )
  
    # send request
    return run_request request

  end

  

  # action to retrieve expenses for given data range
  def self.retrieve start_date, end_date

    # call expenseriser name and token
    name = ENV["exp_name"]
    token = ENV["exp_token"]

    request = Typhoeus::Request.new(
      "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses",
      method: :get,
      headers: { name: name, token: token },
      params: {start_date: start_date, end_date: end_date}
    )
      
    return run_request(request)
  end

  # action to calculate total expenses on given date
  def self.type_daily_total date, type
    Expense.where(date: date, ex_type_id: type.id).sum(:amount)
  end

  # action to run request
  def self.run_request request
    request.run
    response = request.response
    @data = response.response_body
  end
  
end