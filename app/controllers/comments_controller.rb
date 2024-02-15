class CommentsController < ApplicationController

    def index
        user_id = params[:user_id]
        artwork_id = params[:artwork_id]
        render json: Comment.find_by_user_or_artwork(user_id, artwork_id)
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            redirect_to artwork_url(comment.artwork_id)
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        incoming_id= params[:id]
        comment = Comment.destroy(incoming_id)
        if comment
            redirect_to artwork_url(comment.artwork_id)
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end
