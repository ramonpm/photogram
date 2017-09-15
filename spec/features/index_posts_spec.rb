require 'rails_helper'

feature 'Listing Posts' do
  scenario 'User visit Index Page' do
    create(:post)
    create(:post, caption: 'second post')

    visit '/'
    expect(page).to have_content('nofilter')
    expect(page).to have_content('second post')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
end