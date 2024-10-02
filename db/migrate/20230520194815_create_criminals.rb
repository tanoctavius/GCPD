class CreateCriminals < ActiveRecord::Migration[7.0]
  def change
    create_table :criminals do |t|
      t.string :first_name
      t.string :last_name
      t.string :aka
      t.boolean :convicted_felon
      t.boolean :enhanced_powers
      t.text :notes

      t.timestamps
    end
  end
end
