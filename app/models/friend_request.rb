class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :notifications, as: :notifiable, dependent: :destroy

  def accept
    update(status: 'accepted')
  end
end
