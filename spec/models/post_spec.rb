require 'rails_helper'

RSpec.describe Post, type: :Model do
  subject do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    post_counter: 0)

    Post.new(user: user, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end

  it 'title should not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title shoud not exceed 250 character' do
    expect(subject).to be_valid
  end

  it 'post counter should be greatar or equal to 0' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'post counter should be greatar or equal to 0' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end
end
