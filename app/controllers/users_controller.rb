class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "You are signed up successfully."
            redirect_to user_posts_path(@user.id)
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:id, :name, :password, :email)
    end
end