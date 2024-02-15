class User < ApplicationRecord
    validates :username, presence:true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        inverse_of: :artist,
        dependent: :destroy

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        inverse_of: :viewer,
        dependent: :destroy

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
        foreign_key: :author_id,
        inverse_of: :author,
        dependent: :destroy

    has_many :commented_artworks,#all the artworks that user comments
        through: :comments,
        source: :artwork

    has_many :artworks_comments,#all the comments from artworks user creates
        through: :artworks,
        source: :comments
end
