class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, length: { in: 0..1000 }, numericality: { only_integer: true }
  validates :likes_counter, length: { in: 0..1000 }, numericality: { only_integer: true }

  scope :updates_posts_counter, lambda { |id_value|
                                  User.find(id_value).update(posts_counter: Post.where(author_id: id_value).count(:text))
                                }
  
  def recent_comments
    comments.last(5)    
  end
end
