class CreateSuspects < ActiveRecord::Migration[7.0]
  def change
    create_table :suspects do |t|
      t.references :investigation, null: false, foreign_key: true
      t.references :criminal, null: false, foreign_key: true
      t.date :added_on
      t.date :dropped_on

      t.timestamps
    end
  end
end
