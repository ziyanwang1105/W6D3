class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :artwork, foreign_key: true, null: false, index: true
      t.references :author, foreign_key:{to_table: :users}, null: false, index:true
      t.text :body, null: false
      t.timestamps
    end
  end
end
