require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  it 'should rednder the correct template' do
    render template: 'posts/show'
    expect(rendered).to match(/here is posts for a given user/)
  end
end
