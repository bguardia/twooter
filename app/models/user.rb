class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :twoots
  has_many :likes
  
  def followers
    Follow.all.where("followed_id=#{self.id}")
  end

  def follows
    Follow.all.where("follower_id=#{self.id}")
  end

  def handle
    "@#{self.username}"
  end
end
