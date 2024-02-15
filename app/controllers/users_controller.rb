class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        incoming_id = params[:id]
        user = User.find_by(id: incoming_id)
        if user
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end

    end

    def update
        incoming_id = params[:id]
        user = User.find_by(id: incoming_id)
        if user.update(user_params)
            redirect_to user_url(user.id)
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        incoming_id= params[:id]
        user = User.destroy(incoming_id)
        if user
            redirect_to users_url()
        else
            render json: user.errors.full_messages, status: 422
        end
    end
    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
