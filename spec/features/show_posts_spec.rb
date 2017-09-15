require 'rails_helper'

RSpec.feature 'Show Post', type: :feature do
  scenario 'user clicks photo on index page' do
    post = create(:post)
    visit('/')
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
