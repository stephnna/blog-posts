require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @first_user = User.create(
      name: 'Stepehn',
      photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg',
      bio: 'Teacher from Nigeria.',
      posts_counter: 2
    )

    User.create(
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
    before(:each) { visit user_post_path(@first_post, @first_user) }

    scenario 'displays post\'s title' do
      expect(page).to have_content @first_post.title
    end
    scenario 'displays post\'s author' do
      expect(page).to have_content @first_post.author.name
    end
    scenario 'displays post\'s comments count' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end
    scenario 'displays post\'s likes count' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end
    scenario 'displays post\'s body' do
      expect(page).to have_content @first_post.text
    end
    scenario 'displays post\'s commenters name' do
      @first_post.comments.each do |comment|
        expect(page).to have_content comment.author
      end
    end
    scenario 'displays post\'s commenters text' do
      @first_post.comments.each do |comment|
        expect(page).to have_content comment.text
      end
    end
  end
end