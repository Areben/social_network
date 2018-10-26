class UsersController < ApplicationController
    def login
        render 'login'
    end

    def index
        @hevals = Heval.all
        @inv = Invite.where(user_id: session[:user_id])
        render 'index'
    end

    def show
        @users = User.all
        @inv = Invite.where(heval_id: session[:user_id])
        render 'show'
    end

    def their
        @user = User.find(params[:their_id])
        render 'them'
    end
end

# <% current_user.invites.each do |invite| %>
#     <% if invite.connected == nil %>
