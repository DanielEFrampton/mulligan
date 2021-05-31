class AddPreviousShuffleIdToShuffle < ActiveRecord::Migration[6.1]
  def change
    add_reference :shuffles, :previous_shuffle, foreign_key: { to_table: :shuffles }
  end
end
