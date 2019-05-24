# As a user
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price

require "rails_helper"

describe "as a visitor" do
  describe "when I visit a vending machine show" do

    it "shows all snack names and prices" do
      owner = Owner.create!(name: "Tom")
      machine = owner.machines.create!(location: "Mall")
      candy = machine.snacks.create!(name: "Twix", price: 1.25)
      chips = machine.snacks.create!(name: "Lays", price: 1.75)
      visit machine_path(machine)
      expect(page).to have_content("Lays")
      expect(page).to have_content("1.75")
      expect(page).to have_content("Twix")
      expect(page).to have_content("1.25")
    end

  end

end
