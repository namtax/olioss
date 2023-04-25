class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.jsonb :current_avatar
      t.jsonb :roles
      t.jsonb :location
      t.jsonb :rating
      t.jsonb :verifications

      t.timestamps
    end
  end
end
