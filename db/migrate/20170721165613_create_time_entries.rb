class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.integer :number_of_hours
      t.date :date
      t.string :description
      t.belongs_to :Project, foreign_key: true

      t.timestamps
    end
  end
end
