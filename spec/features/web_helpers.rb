# frozen_string_literal: true

def sign_up(user_email)
  visit('/')
  click_link('Sign up')
  fill_in('user_email', with: user_email)
  fill_in('user_user_name' , with: "antonio")
  fill_in('user_password', with: 'password1234')
  fill_in('user_password_confirmation', with: 'password1234')
  click_button('Sign up')
end

def add_item(image, color, type, occasion)
  click_link 'New Item'
  attach_file('item[image]', File.join(Rails.root + 'spec/fixtures' + image))
  select color, from: 'item[colour]'
  select type, from: 'item[clothes_type]'
  select occasion, from: 'item[clothes_occasion]'
  click_button 'Create Item'
end
