class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      like_params = { twoot_id: params[:twoot_id], user_id: current_user.id }
      @like = Like.new(like_params)
      unless Like.find_by(like_params)
        @like.save
        #flash[:notice] = "Successfuly liked twoot!"
      else
        #flash[:alert] = "You've already liked that twoot!"
      end

      #render partial:'likes/icon', locals: { twoot: Twoot.find(params[:twoot_id]) }
      #redirect_to root_path
    end

    def destroy
      like_params = { twoot_id: params[:twoot_id], user_id: current_user.id }
      @like = Like.find_by(like_params)
      @like.destroy

      #render partial:'likes/icon', locals: { twoot: Twoot.find(params[:twoot_id]) }
      #redirect_to root_path
    end
end
