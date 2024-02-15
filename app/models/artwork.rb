class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates [:artist_id, :title], uniqueness:true

    belongs_to :artist,
        class_name: :User
end
