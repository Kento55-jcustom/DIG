class CreateIbanes < ActiveRecord::Migration[7.0]
  def change
    create_table :ibanes do |t|
      t.string :name
      t.string :artist
      t.string :link
      t.integer:overall
      t.integer:level
      t.integer:evaluation
      t.integer:assessment
      t.integer:valuation
      t.text :about

      t.timestamps
    end
  end
end
