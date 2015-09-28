require 'rails_helper'

# RSpec.describe UserController, type: :controller do

# end

describe CarController, type: :controller do 
  describe "GET #index" do
    it "populates an array of cars" do 
      car = FactoryGirl.create(:car)
      get :index 
      assigns(:cars).should eq([car])
    end

    it "rendres the :index view" do 
      get :index
      response.should render_template :index
    end
  end
end
