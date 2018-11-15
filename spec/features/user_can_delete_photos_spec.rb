require "rails_helper"

RSpec.feature 'deleting photos' do
  scenario 'user can delete photos' do
    sign_up_helper
    add_item
    click_link 'Back'
    click_link 'Destroy'
    expect(page).not_to have_css("img[src*='clueless.jpg']")
  end

end
