class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            log_in(@user)
            redirect_to user_url(@user.id)
        else
            render :new
        end
    end

    def destroy
        log_out
        redirect_to new_session_url
    end
end