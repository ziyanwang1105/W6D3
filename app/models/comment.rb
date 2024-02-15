class Comment < ApplicationRecord
    validates :author_id, :artwork_id, :body, presence: true

    belongs_to :artwork

    belongs_to :author,
        class_name: :User

    def self.find_by_user_or_artwork(user_id, artwork_id)
        if user_id
            return Comment.find_by(author_id: user_id)
        end

        if artwork_id
            return Comment.find_by(artwork_id: artwork_id)
        end

        Comment.all

    end
end
