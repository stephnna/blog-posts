class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :updates_posts_counter, lambda { |id_value|
                                  User.find(id_value).update(posts_counter: Post.where(user_id: id_value).count(:text))
                                }
  scope :five_recent_comments_for_post, lambda { |id_value|
                                          Comment.where(post_id: id_value).limit(5).order(created_at: :desc)
                                        }
end
