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
      it { expect @event.title.length >= 5 && 140 >= @event.title.length }
      # it { expect(@event).to validate_presence_of(:title) }
      # it { expect(@event).to validate_length_of(:title).
      # is_at_least(5).is_at_most(140).
      # on(:create) }
    end

    describe "#description" do
      it { expect @event.description.length >= 20 }
      it { expect @event.description.length <= 1000 }
      # it { should validate_presence_of(:description) }
      # it { expect(@event).to validate_presence_of(:description) }
      # it { expect(@event).to validate_length_of(:description).
      #   is_at_least(20).is_at_most(1000).
      #   on(:create) }
    end

    describe "#price" do 
    it { expect(@event).to validate_presence_of(:price).with_message("Put a price please") }
    it { expect(@event).to validate_numericality_of(:price).only_integer.with_message("Price should be an integer between 1 & 1000") }
    it { expect(@event).to validate_numericality_of(:price).
      is_greater_than_or_equal_to(1).is_less_than_or_equal_to(1000).with_message("Price should be an integer between 1 & 1000") }
    end
    
    describe "#location" do
      it { expect(@event).to validate_presence_of(:location).with_message("Put a location please") }
    end
    
    describe "#duration" do
      it { expect(@event).to validate_numericality_of(:duration).only_integer }
      it { expect(@event).to validate_numericality_of(:duration).is_greater_than(0) }
      it { expect(@event).to allow_values(5, 10, 15, 30, 60, 500).for(:duration) }
    end
    
    describe "#start_date" do
      it { expect(@event).to validate_presence_of(:start_date).with_message("Put a start date please") }
    end

  end

  # context "associations" do

  #   describe "attendances association" do
  #     it { expect(@event).to have_many(:attendances) }
  #   end

  # end



end
