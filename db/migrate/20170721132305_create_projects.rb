class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :total_hours_to_finish
      t.integer :worked_hours
      t.belongs_to :User, foreign_key: true

      t.timestamps
    end
  end
end
