class UsersController < ApplicationController
    def new
        @user = User.new 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to cats_url(@user)
        else 
            render json: @user.errors.full_messages, status: 422
        end
    end

    private

    def user_params
        params.require(:user).permit(:username,:password)
    end
end
