class CreateBusinessUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :business_users do |t|
      t.integer :user_id
      t.integer :business_id
      t.timestamps
    end
  end
end
