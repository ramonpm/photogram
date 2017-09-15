require 'rails_helper'

RSpec.feature "Delete Posts", type: :feature do
  scenario 'user can delete post' do
    create(:post, caption: 'Abs for days')
    visit root_path
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content('Problem solved! Post Deleted.')
    expect(page).to_not have_content('Abs for days')
  end
end
