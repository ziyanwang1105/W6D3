class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :title, uniqueness:{scope: :artist_id}

    belongs_to :artist,
        class_name: :User

    has_many :artwork_shares,
        inverse_of: :artwork,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        dependent: :destroy,
        inverse_of: :artwork

    has_many :comment_authors,
        through: :comments,
        source: :author


    def self.artworks_for_user_id(user_id) #owned AND shared artworks for user_id
       Artwork
        .joins(:artwork_shares)
        .where("artworks.artist_id = #{user_id} OR artwork_shares.viewer_id = #{user_id}")
        .distinct
    end
end
