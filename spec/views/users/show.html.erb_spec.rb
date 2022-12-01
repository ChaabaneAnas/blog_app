require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  it 'should rednder the correct template show' do
    render template: 'users/show'
    expect(rendered).to match(/this a given user page /)
  end
end
