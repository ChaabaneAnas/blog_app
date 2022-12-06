require 'rails_helper'

RSpec.describe "Posts", type: :system do

  context 'User index page' do

    before(:each) do
      @user = User.create(name: 'mouhamed', photo: 'https://tunisia88.com/wp-content/uploads/2022/11/IMG-20211028-WA0010-e1667749608247.jpg', bio: 'Profissional Musician')
    end 

      it'I can see the username of all other users' do
        visit root_path
        page.has_content?('Users')
        page.has_content?(@user.name)
      end

    it'I can see the profile picture for each user.' do
      visit root_path
      page.has_css?('.img-fluid')
    end 

    it'I can see the number of posts each user has written.' do
      post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
      visit root_path
      page.has_content?("Number of posts: #{@user.post_counter}")
    end   

    it' When I click on a user, I am redirected to that users show page.' do
      visit root_path
      sleep(2)
      click_on 'mouhamed'
      sleep(1)
      page.has_current_path?(user_path(@user))
      sleep(5)
    end 

 end

  context 'User show page' do
    it'I can see the users profile picture.' do

    end

    it'I can see the users username.' do
    end

    it'I can see the number of posts the user has written.' do
    end

    it'I can see the users bio.' do
    end

    it'I can see the users first 3 posts.' do
    end

    it'I can see a button that lets me view all of a users posts.' do
    end

    it'When I click a users post, it redirects me to that posts show page.' do
    end

    it'When I click to see all posts, it redirects me to the users posts index page.' do
    end
  end  

end
