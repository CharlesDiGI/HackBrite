require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do 
    @event = FactoryBot.build(:event)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(build(:event)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end

    describe "#title" do
      it { expect(@event).to validate_presence_of(:title) }
      it { expect(@event).to validate_length_of(:title).
      is_at_least(5).is_at_most(140).
      on(:create) }
    end

    describe "#description" do
      it { expect(@event).to validate_presence_of(:description) }
      it { expect(@event).to validate_length_of(:description).
      is_at_least(20).is_at_most(1000).
      on(:create) }
    end

    describe "#price" do 
    it { expect(@event).to validate_presence_of(:price) }
    it { expect(@event).to validate_numericality_of(:price).only_integer }
    it { expect(@event).to validate_numericality_of(:price).
    is_greater_than_or_equal_to(1).is_less_than_or_equal_to(1000) }
    end

  end

  context "associations" do

    describe "attendances association" do
      it { expect(@event).to have_many(:attendances) }
    end

  end



end
