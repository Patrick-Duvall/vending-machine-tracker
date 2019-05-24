
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.

  require "rails_helper"

  describe "as a visitor" do
    describe "when I visit a snacks show" do

      it "shows me that snack and info for it" do
        @owner = Owner.create!(name: "Tom")

        @machine_1 = @owner.machines.create!(location: "Mall")

        @machine_2 = @owner.machines.create!(location: "Gym")
        @candy = Snack.create!(name: "Twix", price: 1.25)
        @gum = Snack.create!(name: "Gum", price: 0.5)
        @chips = Snack.create!(name: "Lays", price: 1.75)

        @machine_snack_1 = MachineSnack.create(machine_id: @machine_1, snack_id: @candy)
        @machine_snack_2 = MachineSnack.create(machine_id: @machine_1, snack_id: @gum)
        @machine_snack_3 = MachineSnack.create(machine_id: @machine_2, snack_id: @candy)
        @machine_snack_4 = MachineSnack.create(machine_id: @machine_2, snack_id: @chips)

        visit snack_path(@candy)
        expect(page).to have_content(1.25)
        expect(page).to have_content(@machine_1.location)
        expect(page).to have_content(@machine_1.average_snack_price)
        expect(page).to have_content(@machine_1.number_of_snack_types)

        expect(page).to have_content(@machine_2.location)
        expect(page).to have_content(@machine_2.average_snack_price)
        expect(page).to have_content(@machine_2.number_of_snack_types)
      end

    end

  end
