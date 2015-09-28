require 'rails_helper'

describe 'UserAuthentication' do
  let(:user) {FactoryGirl.create(:user)}

  context "Registration" do

    it 'allows user to register' do
      visit new_user_registration_path
      fill_in 'Email', :with => 'newuser@example.com'
      fill_in 'Password', :with => 'userpassword'
      fill_in 'Password confirmation', :with => 'userpassword'
      click_button 'Sign up'
      page.should have_content 'Welcome'
    end

    it 'should not allows user to register with invalid email' do 
      visit new_user_registration_path
      fill_in 'Email', :with => 'dfsfdsfsdf'
      fill_in 'Password', :with => 'userpassword'
      fill_in 'Password confirmation', :with => 'userpassword'
      click_button 'Sign up'
      page.should have_content('Email is invalid')
    end

    it "should not allows user to register with Password (8 characters minimum)" do 
      visit new_user_registration_path
      fill_in 'Email', :with => "newuser@example.com"
      fill_in 'Password', :with => 'oualid'
      fill_in 'Password confirmation', :with => 'oualid'
      click_button 'Sign up'
      page.should have_content('Password is too short (minimum is 8 characters)')
    end

    it "should not allows user to register without Password confirmation" do
      visit new_user_registration_path
      fill_in 'Email', :with => "newuser@example.com"
      fill_in 'Password', :with => 'userpassword'
      click_button 'Sign up'
      page.should have_content("Password confirmation doesn't match")
    end

    it "should not allows user to register when Password confirmation doesn't match" do 
      visit new_user_registration_path
      fill_in 'Email', :with => "newuser@example.com"
      fill_in 'Password', :with => 'userpassword'
      fill_in 'Password confirmation', :with => "oualid23"
      click_button 'Sign up'
      page.should have_content("Password confirmation doesn't match")
    end

  end

  context "Sign in" do
    it "should allow a registered user to sign in " do
      visit new_user_session_path
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Log in'
      page.should have_content 'Signed in successfully'
    end

    it "should not allow user to sign in with invalid password" do 
      visit new_user_session_path
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => "userpassword"
      click_button 'Log in'
      page.should have_content("Invalid email or password")
    end

    it "should not allow an unregistered user to sign in" do 
      visit new_user_session_path
      fill_in 'Email', :with => "newuser@example.com"
      fill_in 'Password', :with => "userpassword"
      click_button 'Log in'
      page.should have_content("Invalid email or password")
    end
  end


  context "Sign out" do 
    it "shold disconnect user" do
      visit new_user_session_path
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Log in'
      visit root_path
      click_link 'Logout'

      page.should have_content 'Signed out successfully'
    end
  end
end
