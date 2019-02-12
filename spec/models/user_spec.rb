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

    describe "#names" do
      it { expect(@user).to validate_presence_of(:first_name).with_message("Please type your first name") }
      it { expect(@user).to validate_presence_of(:last_name).with_message("Please type your last name") }
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
