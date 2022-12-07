require 'rails_helper'

RSpec.describe 'User show', type: :feature do
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

    @users = User.all
  end

  describe 'integration' do
    before(:each) { visit user_path @first_user }

    scenario 'displays user\'s profile picture' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    scenario 'displays user\'s username' do
      expect(page).to have_content @first_user.name
    end

    scenario 'displays user\'s number of posts' do
      expect(page).to have_content "Number of posts: #{@first_user.posts_counter}"
    end

    scenario 'displays user\'s bio' do
      expect(page).to have_content @first_user.bio
    end

    scenario 'displays user\'s first three posts' do
      @posts = User.three_recent_posts_for_user(@first_user)
      @posts.each do |post|
        expect(page).to have_content post.text
      end
    end

    scenario 'displays button to see all user posts' do
      within '.see-posts-btn' do
        expect(page).to have_content 'See all posts'
      end
    end
    scenario 'button redirects to posts index page' do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)
    end
  end

  scenario 'redirects to posts show page when clicked' do
    within all('.post')[0] do
      find('a').click
      expect(page).to have_current_path user_post_path(@first_user, @first_post)
    end
  end
end
