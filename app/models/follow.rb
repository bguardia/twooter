class Follow < ApplicationRecord

    def self.suggestions_for(user_id, options = {})
      lim = options.fetch(:limit, 5)
      User.where("users.id NOT IN 
                  (SELECT follows.followed_id 
                  FROM follows 
                  WHERE follows.follower_id = :user_id) AND users.id != :user_id", user_id: user_id).limit(lim)
    end
end
