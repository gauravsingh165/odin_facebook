class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_photo

  has_many :sent_friend_requests, class_name: 'FriendRequest', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_friend_requests, class_name: 'FriendRequest', foreign_key: 'recipient_id', dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_many :accepted_friends, -> { where(friendships: { status: 'accepted' }) },
           through: :friendships, source: :friend

  has_many :posts
  has_many :comments, dependent: :destroy
  has_one  :profile, dependent: :destroy
  has_many :likes, dependent: :destroy
 
  attribute :first_name, :string

  def sent_friend_request_to?(user)
    sent_friend_requests.exists?(recipient_id: user.id)
  end
  def like?(post)
    likes.exists?(post_id: post.id)
  end
  def name 
    "#{first_name} #{last_name}"
  end
end
