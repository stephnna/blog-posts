class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, length: { in: 0..1000 }, numericality: { only_integer: true }

  scope :three_recent_posts_for_user, lambda { |id_value|
                                        Post.where(author_id: id_value).limit(3).order(created_at: :desc)
                                      }
end
