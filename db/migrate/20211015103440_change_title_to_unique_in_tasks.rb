class ChangeTitleToUniqueInTasks < ActiveRecord::Migration[6.1]
    def change
      change_column :tasks, :title, :text, unique: true
    end
end
