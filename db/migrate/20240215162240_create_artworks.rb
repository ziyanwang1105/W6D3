class CreateArtworks < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title, null:false
      t.references :artist, null:false, foreign_key: {to_table: :users}, index: true
      t.string :image_url, null:false
      t.index [:artist_id, :title], unique:true
      t.timestamps
    end
  end
end
