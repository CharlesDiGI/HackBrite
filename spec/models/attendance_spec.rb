require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do
    @attendance = FactoryBot.create(:attendance)
  end

  it "has a valid factory" do
    expect(build(:attendance)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(@attendance).to be_a(Attendance)
  end
  
  describe "#stripe_customer_id" do
    it { expect(@attendance).to validate_presence_of(:stripe_customer_id) }
  end

end
