class CreateGameTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :game_types do |t|
      t.string :name
      t.integer :max_deck_size
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
