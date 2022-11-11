class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, length: { in: 0..1000 }, numericality: { only_integer: true }

  scope :three_recent_posts_for_user, lambda { |id_value|
                                        Post.where(author_id: id_value).limit(3).order(created_at: :desc)
                                      }
end
