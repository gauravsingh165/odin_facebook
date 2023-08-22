class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id'
  # has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'receiver_id'
  has_many :notifications
  has_many :posts
  has_many :likes
  has_many :comments
  has_one :profile
  has_many :sent_friend_requests, class_name: 'User', foreign_key: 'sender_id'
  has_many :received_friend_requests, class_name: 'User', foreign_key: 'receiver_id'

  def send_friend_request_to(user)
    sent_friend_requests << user unless sent_friend_requests.include?(user)
  end

  def accept_friend_request_from(user)
    received_friend_requests.delete(user)
    friends << user
    user.friends << self
  end

  def decline_friend_request_from(user)
    received_friend_requests.delete(user)
  end
end
