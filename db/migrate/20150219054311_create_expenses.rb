class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :date
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
