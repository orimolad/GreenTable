class Api::UsersController < ApplicationController
    def index
        @users = User.all 
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render: show 
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.save
            render: show 
        else
            render json: @user.errors.full_messages, status: 422
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end
    
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :password)
    end
end
