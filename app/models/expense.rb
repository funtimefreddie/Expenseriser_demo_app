class Expense < ActiveRecord::Base

  belongs_to :type

  # action to send day's expenses to expenseriser
  def self.archive date

    name = "Freddie"
    token = "c4eea863bac1c9e3c0d953db3320d2bb"

    ExType.all.each do |t|

      type_name = t.name
      type_total = Expense.type_daily_total(date, t)

      request = Typhoeus::Request.new(
        "https://guarded-caverns-1459.herokuapp.com/api/v1/expenses", 
        method: :post, 
        headers: { name: name,token: token },
        params: {date: date, amount: type_total}
      )
    
      run_request request

    end

  end

  # action to calculate total expenses on given date
  def self.type_daily_total date, type
    Expense.where(date: date, ex_type_id: type.id).sum(:amount)
  end

  # action to run request
  def self.run_request request
    request.run
    response = request.response
    data = response.response_body
  end
  
end
