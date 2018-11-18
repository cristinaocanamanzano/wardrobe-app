def sign_up(user_email)
  visit('/')
  click_link('Sign up')
  fill_in('user_email', with: user_email)
  fill_in('user_password', with: 'password1234')
  fill_in('user_password_confirmation', with: 'password1234')
  click_button('Sign up')
end

def add_item(image, color, type)
  click_link 'New Item'
  attach_file('item[image]', File.join(Rails.root + 'spec/fixtures' + image))
  select color, from: 'item[colour]'
  select type, from: 'item[clothes_type]'
  click_button 'Create Item'
  click_link 'Back'
end
