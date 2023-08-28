class Friendship < ApplicationRecord
  attr_accessor :sender_name

  belongs_to :user
  belongs_to :friend, class_name: 'User'
  scope :between_users, ->(user1, user2) { where('(user_id = ? AND friend_id = ?) OR (user_id = ? AND friend_id = ?)', user1.id, user2.id, user2.id, user1.id) }

end
