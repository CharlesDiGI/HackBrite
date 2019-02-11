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

  end

  context "associations" do

    describe "Event" do
      it { expect(@user).to have_many(:events).class_name('Event') }
    end

  end



end