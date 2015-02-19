class DropName < ActiveRecord::Migration
  def change
    remove_column :expenses, :name
  end
end
