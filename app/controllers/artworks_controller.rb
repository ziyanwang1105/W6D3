class ArtworksController < ApplicationController
    def index
        user_id = params[:user_id]
        if user_id
            artworks = Artwork.artworks_for_user_id(user_id)
        else
            artworks = Artwork.all
        end
        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        incoming_id = params[:id]
        artwork = Artwork.find_by(id: incoming_id)
        if artwork
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end

    end

    def update
        incoming_id = params[:id]
        artwork = Artwork.find_by(id: incoming_id)
        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        incoming_id= params[:id]
        artwork = Artwork.destroy(incoming_id)
        if artwork
            redirect_to artworks_url()
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end
    private
    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end
