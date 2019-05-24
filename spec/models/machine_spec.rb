require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snacks}

    end

    it ".average_price" do
      @owner = Owner.create!(name: "Tom")
      @machine = @owner.machines.create!(location: "Mall")
      @candy = @machine.snacks.create!(name: "Twix", price: 1.25)
      @chips = @machine.snacks.create!(name: "Lays", price: 1.75)
      @chipers = @machine.snacks.create!(name: "Pringles", price: 1.5)
      expect(@machine.average_snack_price).to eq(1.5)
    end
  end
