class CreateShuffles < ActiveRecord::Migration[6.1]
  def change
    create_table :shuffles do |t|
      t.references :deck, null: false, foreign_key: true
      t.integer :batch_size_min
      t.integer :batch_size_max
      t.string :start_seed
      t.string :type
      t.integer :repetitions
      t.integer :split_point
      t.integer :split_margin_max
      t.integer :split_margin_min

      t.timestamps
    end
  end
end
