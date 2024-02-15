class ArtworkSharesController < ApplicationController
    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
            redirect_to artwork_url(artwork_share.artwork_id)
        else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        incoming_id= params[:id]
        artwork_share = ArtworkShare.destroy(incoming_id)
        if artwork_share
            redirect_to artwork_url(artwork_share.artwork_id)
        else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end
