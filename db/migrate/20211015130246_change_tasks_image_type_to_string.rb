class ChangeTasksImageTypeToString < ActiveRecord::Migration[6.1]
  def change
    change_column(:tasks, :image, :string)
  end
end
