class SessionsController < ApplicationController
    before_action :set_user, only: [:login]

    def destroy
        session[:user_id] = nil
        redirect_to "/main", notice: "User logged out"
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            Heval.create(id: @user.id, user_id: @user.id)
            redirect_to "/professional_profile", notice: "User and session succesfully created."
        else
            redirect_to "/main", notice: "User could not be created."
        end
    end

    def login
        if @user = set_user
            session[:user_id] = @user.id
            redirect_to "/professional_profile", notice: "User was signed in succesfully."
        else
            redirect_to "/main", notice: "User name or password incorrect"
        end
    end

    private
        def set_user
            User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
        end

        def user_params
            params.require(:user).permit(:name, :email, :description, :password, :password_confirmation)
        end
end
