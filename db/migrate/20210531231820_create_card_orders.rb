class CreateCardOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :card_orders do |t|
      t.references :deck_card, null: false, foreign_key: true
      t.references :shuffle, null: false, foreign_key: true
      t.integer :position
      t.integer :pile
      t.integer :batch
      t.integer :repetition

      t.timestamps
    end
  end
end
