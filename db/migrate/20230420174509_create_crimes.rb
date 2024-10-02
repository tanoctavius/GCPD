class CreateCrimes < ActiveRecord::Migration[7.0]
  def change
    create_table :crimes do |t|
      t.string :name
      t.boolean :felony
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
