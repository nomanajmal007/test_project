class ChangeImageTypeToTextInTask < ActiveRecord::Migration[6.1]
  def change
    change_column(:tasks, :image, :text)
  end
end
