class Twoot < ApplicationRecord

  belongs_to :user
  has_many :likes

  def liked_by?(user_id = nil)
    if user_id && self.likes.find_by(user_id: user_id)
        return true
    end
  end

end
