require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  it 'should rednder the correct template index' do
    render template: 'users/show'
    expect(rendered).to match(/this a given user page/)
  end
end
