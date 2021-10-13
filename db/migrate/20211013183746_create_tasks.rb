class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, unique: true
      t.date :due_date
      t.string :task_type
      t.string :image

      t.timestamps
    end
  end
end
