class Twoot < ApplicationRecord

  belongs_to :user
  has_many :likes

  def liked_by?(user_id = nil)
    if user_id && self.likes.find_by(user_id: user_id)
        return true
    end
  end

  def replies
    Twoot.where("reply_id=#{self.id}")
  end

  def reply?
    !self.reply_id.nil? && Twoot.exists?(id: self.reply_id)
  end

  def replying_to
    Twoot.find_by(id: self.reply_id) if self.reply?
  end
end
