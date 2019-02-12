require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do
    @attendance = FactoryBot.build(:attendance)
  end

  it "has a valid factory" do
    expect(build(:attendance)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(@attendance).to be_a(Attendance)
  end
  
  it "has a customer_strip_id" do 
    it { should allow_value('ENVLKNAZDds').for(:customer_strip_id) }
  end

end
