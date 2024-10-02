class CreateInvestigationNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :investigation_notes do |t|
      t.references :investigation, foreign_key: true
      t.references :officer, foreign_key: true
      t.text :content
      t.date :date

      # t.timestamps
    end
  end
end
