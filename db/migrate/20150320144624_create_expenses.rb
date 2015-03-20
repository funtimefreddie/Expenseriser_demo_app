class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.string :date
      t.string :cat

      t.timestamps null: false
    end
  end
end
