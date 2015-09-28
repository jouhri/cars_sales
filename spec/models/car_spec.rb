require 'rails_helper'

# RSpec.describe Car, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Car do 
  before(:each) do
    @car = FactoryGirl.create(:car)
  end

  subject {@car}

  it { should  respond_to(:name)}
  it { should validate_presence_of(:name)}

  it { should  respond_to(:price)}
  it { should validate_presence_of(:price)}

  it { should  respond_to(:brand)}
  it { should validate_presence_of(:brand)}

  it { should  respond_to(:year)}
  it { should  respond_to(:engine)}
  it { should  respond_to(:color)}

end
