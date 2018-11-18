require "rails_helper"

RSpec.feature 'deleting photos' do
  scenario 'user can delete photos' do
    sign_up('testuser1@gmail.com')
    add_item("clueless.jpg", 'navy', 'top', 'formal')
    click_link 'Destroy'
    expect(page).not_to have_css("img[src*='clueless.jpg']")
  end

end
