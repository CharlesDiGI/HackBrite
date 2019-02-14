require 'rails_helper'

RSpec.describe User, type: :model do


  before(:each) do 
    @user = FactoryBot.create(:user)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    it "is a string for first_name" do
      expect @user.first_name.class == String
    end

    it "is a string for last_name" do
      expect @user.last_name.class == String
    end
    
    describe "#email" do
      it { expect(@user).to validate_presence_of(:email).with_message("Please insert your email adress") }
    end

  end

  # context "associations" do

  #   describe "Event" do
  #     it { expect(@user).to have_many(:events) }
  #     it { expect(@user).to have_many(:attendances) }
  #   end

  # end



end
