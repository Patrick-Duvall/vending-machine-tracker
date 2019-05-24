# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price

require "rails_helper"

describe "as a visitor" do
  describe "when I visit a vending machine show" do

    before :each do

      @owner = Owner.create!(name: "Tom")

      @machine_1 = @owner.machines.create!(location: "Mall")

      @candy = Snack.create!(name: "Twix", price: 1.25)
      @chips = Snack.create!(name: "Lays", price: 1.75)

      @machine_snack_1 = MachineSnack.create(machine_id: @machine_1, snack_id: @candy)
      @machine_snack_2 = MachineSnack.create(machine_id: @machine_1, snack_id: @chips)
    end


    it "shows all snack names and prices" do

      expect(page).to have_content("Lays")
      expect(page).to have_content("1.75")
      expect(page).to have_content("Twix")
      expect(page).to have_content("1.25")
    end

    it "Shows an average snack price" do
      expect(page).to have_content("Average Price: $1.50")

    end

  end

end
