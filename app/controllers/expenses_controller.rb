class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json

  # def initialize
  #   @name = ENV["exp_name"]
  #   @token = ENV["exp_token"]
  # end

  def home
  end

  def retrieve
  end

  def expenseriser

    # call paramaters 
    start_date = params[:start_date]
    end_date = params[:end_date]

    # retrieve data from expenseriser
    @data = Expense.retrieve(start_date, end_date)

  end

  def new
    @expense = Expense.new
  end 

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        # send to expenseriser
        Expense.submit(@expense.amount, @expense.cat, @expense.date)

        format.html { redirect_to root_path, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :date, :cat)
    end
end
