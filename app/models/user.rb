class User < ApplicationRecord
  has_many :posts
  has_many :comments
  def three_recent_posts
    
  end  
end

