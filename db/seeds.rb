# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(username: 'bobby1')
User.create(username: 'bobby2')
User.create(username: 'bobby3')
Artwork.create(title: 'painting1', artist_id: 1, image_url: 'painting1.com')
Artwork.create(title: 'painting2', artist_id: 2, image_url: 'painting2.com')
Artwork.create(title: 'painting3', artist_id: 3, image_url: 'painting3.com')
Artwork.create(title: 'painting2', artist_id: 1, image_url: 'painting1-2.com')
ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 1, viewer_id: 3)
ArtworkShare.create(artwork_id: 2, viewer_id: 1)
ArtworkShare.create(artwork_id: 3, viewer_id: 1)
ArtworkShare.create(artwork_id: 4, viewer_id: 2)
