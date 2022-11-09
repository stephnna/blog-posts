require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @first_user = User.create(
      id: 1,
      name: 'Stephen',
      photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg',
      bio: 'Teacher from Nigeria.',
      posts_counter: 2
    )

    User.create(
      id: 2,
      name: 'Tracey',
      photo: 'https://i.im.ge/2022/10/30/2R6RqY.woman.jpg',
      bio: 'Teacher from Kenya.',
      posts_counter: 5
    )

    @first_post = Post.create(
      author: @first_user,
      title: 'Hello',
      text: 'This is my first test post',
      comments_counter: 0,
      likes_counter: 0
    )

    Post.create(
      author: @first_user,
      title: 'Hello',
      text: 'This is my second test post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.new(author: @first_user, post: @first_post, text: 'Hey whats going on... just testing')
    Comment.new(author: @first_user, post: @first_post, text: 'Hey whats going on... just another test')

    @users = User.all
  end

  describe 'integration' do
    before(:each) { visit user_posts_path(@first_user) }

    scenario 'displays user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    scenario 'displays user\'s username' do
      expect(page).to have_content @first_user.name
    end

    scenario 'displays user\'s number of posts' do
      expect(page).to have_content "Number of posts: #{@first_user.posts_counter}"
    end

    scenario 'displays a post title' do      
      within all('.post')[0] do
        expect(page).to have_content @first_post.title
      end
    end

    scenario 'displays a post body' do
      within all('.post')[0] do
        expect(page).to have_content @first_post.text
      end
    end

    scenario 'displays a post first comments' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    scenario 'displays number of comments for each post' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    scenario 'displays number of likes for each post' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end  
  end
end