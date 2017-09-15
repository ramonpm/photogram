require 'rails_helper'

RSpec.feature "Edit Posts", type: :feature do
  background do
    create(:post)
    visit('/')
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'user can edit posts' do
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'
    expect(page).to have_content('Post updated hombre.')
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  scenario 'user try to update something that is not an image' do
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'
    expect(page).to have_content('Something is wrong with your form!')
  end
end
