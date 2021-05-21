class FollowsController < ApplicationController

    before_action :authenticate_user!

    def create
        followed_id = params[:followed_id]
        @follow = Follow.new(followed_id: followed_id, follower_id: current_user.id)
        if @follow.save
            followed_name = User.find_by(id: followed_id).name
            flash[:notice] = "Successfully followed #{followed_name}!"
        else
            flash[:alert] = "Unable to follow user."
        end

        redirect_to root_path
    end

    def destroy
        followed_id = params[:followed_id]
        @follow = Follow.find_by(followed_id: followed_id, follower_id: current_user.id)
        @follow.destroy
        redirect_to root_path
    end
end
