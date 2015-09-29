require 'rails_helper'

describe "UserCreateMoneyBoost" do 
  let(:user) {FactoryGirl.create(:user)}
  let(:car) {FactoryGirl.create(:car)}

  context "user is login" do 
    before(:each) do
      visit root_path
      click_link 'Login'
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Log in"
      page.should have_content "Signed in successfully"
    end

    # it "should allow user to do a money boost" do 
    #   click_button 'Pay with Card'
    #   fill_in "card_number", :with => "4242424242424242"
    #   fill_in "cvc", :with => "999"
    #   fill_in "exp-month", :with => "9"
    #   fill_in "exp-year", :with => "2018"
    #   click_button "Payer #{car.price},00"
    # end
  end

end
