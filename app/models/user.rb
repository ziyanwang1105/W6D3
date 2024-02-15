class User < ApplicationRecord
    validates :username, presence:true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        inverse_of: :artist

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        inverse_of: :viewer

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork
end
