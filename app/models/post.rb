class Post < ApplicationRecord
  has_one_attached :image
  has_many :likes
  belongs_to :user
  has_many :comments

end
