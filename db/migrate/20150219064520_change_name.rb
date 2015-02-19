class ChangeName < ActiveRecord::Migration
  def change
    rename_column :expenses, :type_id, :ex_type_id
  end
end
