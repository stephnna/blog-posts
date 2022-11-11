require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:each) do
    @first_user = User.create(
      name: 'Stephen',
      photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg',
      bio: 'Teacher from Nigeria.',
      posts_counter: 1
    )

    User.create(
      name: 'Tracey',
      photo: 'https://i.im.ge/2022/10/30/2R6RqY.woman.jpg',
      bio: 'Teacher from Kenya.',
      posts_counter: 2
    )

    @users = User.all
  end

  describe 'integration' do
    before(:each) { visit users_path }

    scenario 'displays profile picture for each user' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    scenario 'shows the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    scenario 'displays post counter for each user' do
      @users.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end

    scenario 'displays some text' do
      @users.each do |_user|
        expect(page).to have_content 'Number of posts'
      end
    end

    scenario 'users directs to show page when clicked' do
      within all('.user')[0] do
        click_link @first_user.name
        expect(page).to have_current_path user_path(@first_user)
        visit users_path
      end
    end
  end
end
