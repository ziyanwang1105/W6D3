class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :liker, null: false, foreign_key: {to_table: :users}
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
