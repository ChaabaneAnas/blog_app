require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  it 'renders the correct template' do
    render template: '/posts/index'
    expect(rendered).to match(/this where all the posts/)
  end
end
