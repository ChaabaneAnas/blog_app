require 'rails_helper'

RSpec.describe "Posts", type: :system do
  context 'Post index page' do

    before(:each) do
      @user = User.create(name: 'mouhamed', photo: 'https://tunisia88.com/wp-content/uploads/2022/11/IMG-20211028-WA0010-e1667749608247.jpg', bio: 'Profissional Musician')
      @post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
    end 

    it'I can see the users profile picture.' do
      visit user_posts_path(@user)
      page.has_css?('.img-fluid')
    end

    it'I can see the users username.' do
      visit user_posts_path(@user)
      page.has_content?(@user.name)
    end 

    it'I can see the number of posts the user has written.' do
      visit user_posts_path(@user)
      page.has_content?("Number of posts: #{@user.post_counter}")
    end   

    it' I can see some of the posts body.' do
      visit user_posts_path(@user)
      page.has_content?(@post.text)
    end 

    it' I can see the first comments on a post.' do
      @comment = Comment.create(post: @post, user: @user, text: 'Hi Tom!' )
      visit user_posts_path(@user)
      page.has_content?(@comment.text)
    end 

    it' I can see how many comments a post has.' do
      visit user_posts_path(@user)
      page.has_content?("Commentos: #{@post.comments_counter}")
    end 

    it' I can see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(@user)
      page.has_content?('Pagination')
    end 

    it' When I click on a post, it redirects me to that posts show page.' do
      visit user_posts_path(@user)
      click_on 'Hello'
      page.has_current_path?(user_post_path(@user, @post))
    end 

  end

  context 'Post show page' do


    before(:each) do
      @user = User.create(name: 'mouhamed', photo: 'https://tunisia88.com/wp-content/uploads/2022/11/IMG-20211028-WA0010-e1667749608247.jpg', bio: 'Profissional Musician')
      @post = Post.create(user: @user, title: 'Hello', text: 'This is my first post')
    end 

    it'I can see the posts title.' do
      visit user_post_path(@user, @post)
      page.has_content?(@post.title)
    end

    it'I can see who wrote the post.' do
      visit user_post_path(@user, @post)
      page.has_content?('mouhamed')
    end

    it'I can see how many comments it has.' do
      visit user_post_path(@user, @post)
      page.has_content?("Comments: #{@post.comments_counter}")
    end

    it'I can see how many likes it has.' do
      visit user_post_path(@user, @post)
      page.has_content?("Likes: #{@post.likes_counter}")

    end

    it'I can see the post body.' do
      visit user_post_path(@user, @post)
      page.has_content?(@post.text)
    end

    it'I can see the username of each commentor.' do
      @comment = Comment.create(post: @post, user: @user, text: 'Hi Tom!' )
      visit user_post_path(@user, @post)
      page.has_content?(@comment.user.name)
    end

    it'I can see the comment each commentor left.' do
      @comment = Comment.create(post: @post, user: @user, text: 'Hi Tom!' )
      visit user_post_path(@user, @post)
      page.has_content?(@comment.text)
    end


  end 

end
