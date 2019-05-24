class CreateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.references :machine_id, foreign_key: true
      t.references :snack_id, foreign_key: true
    end
  end
end
