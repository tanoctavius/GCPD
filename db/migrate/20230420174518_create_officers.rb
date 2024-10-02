class CreateOfficers < ActiveRecord::Migration[7.0]
  def change
    create_table :officers do |t|
      t.string :first_name
      t.string :last_name
      t.references :unit, foreign_key: true
      t.string :rank
      t.string :ssn
      t.integer :role
      t.string :username
      t.string :password_digest
      t.boolean :active, default: true

      # t.timestamps
    end
  end
end
