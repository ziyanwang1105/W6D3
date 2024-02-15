class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness:{scope: :artist_id}

    belongs_to :artist,
        class_name: :User

    has_many :artwork_shares,
        inverse_of: :artwork

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer


end
