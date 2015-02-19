class AddType < ActiveRecord::Migration
  def change
    add_column :expenses, :type_id, :integer
  end
end
