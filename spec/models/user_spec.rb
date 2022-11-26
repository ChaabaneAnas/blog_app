require 'rails_helper'

RSpec.describe User, type: :Model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0) }

  it 'user should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter to be greater or equal to 0 ' do
    subject.post_counter = nil
    expect(subject).to_not be_valid
  end
end
