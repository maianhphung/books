class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :about
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
