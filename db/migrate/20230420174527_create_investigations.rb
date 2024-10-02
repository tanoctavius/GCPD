class CreateInvestigations < ActiveRecord::Migration[7.0]
  def change
    create_table :investigations do |t|
      t.string :title
      t.text :description
      t.string :crime_location
      t.date :date_opened
      t.date :date_closed
      t.boolean :solved
      t.boolean :batman_involved

      # t.timestamps
    end
  end
end
