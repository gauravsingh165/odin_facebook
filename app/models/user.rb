class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one_attached :profile_photo

  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id', dependent: :destroy
  has_many :notifications
  has_many :posts
  has_many :comments
  has_one :profile
  has_many :likes
  has_many :comments

  def like?(post)
    likes.exists?(post_id: post.id)
  end
  def name 
    "#{first_name} #{last_name}"
  end
end
