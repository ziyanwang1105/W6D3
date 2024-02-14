class UsersController < ApplicationController
    def index
        render plain: "Hello! I'm in the index action! :)"
    end
end
