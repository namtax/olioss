class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :donation_description
      t.references :collection
      t.string :section
      t.json :location
      t.string :collection_notes
      t.json :value
      t.string :status
      t.datetime :expiry
      t.json :reactions
      t.boolean :is_owner
      t.json :conversations
      t.json :photos
      t.references :user


      t.timestamps
    end
  end
end
