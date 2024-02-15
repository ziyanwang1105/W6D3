class User < ApplicationRecord
    validates :username, presence:true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        inverse_of: :artist
end
