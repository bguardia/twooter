class RepliesController < ApplicationController
    before_action :authenticate_user!

    def new
        @reply_to = Twoot.find(params[:reply_id])
        @reply_user_handle = User.find(@reply_to.user_id).handle
        @reply = current_user.twoots.build()
    end

    def create
        @reply_to = Twoot.find(reply_params[:reply_id])
        @reply = current_user.twoots.build(reply_params)
        if @reply.save
            flash[:notice] = "Successfully replied to twoot"
            redirect_to twoot_path(@reply_to)
        else
            flash[:alert] = "Unable to create reply"
            redirect_to root_path
        end
    end

    private
    def reply_params
        params.require(:twoot).permit(:body, :reply_id)
    end
end