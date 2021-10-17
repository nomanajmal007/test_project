class AddBusinessIdToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :business_id, :integer
  end
end
