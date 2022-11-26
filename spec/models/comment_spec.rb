require 'rails_helper'

RSpec.describe Comment, type: :Model do
  subject do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    post_counter: 0)

    post = Post.new(user: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
    Comment.new(post: post, user: user, text: 'Hi Tom!')
  end

  it 'text shoud not be nil' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
