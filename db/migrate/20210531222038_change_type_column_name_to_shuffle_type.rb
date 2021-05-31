class ChangeTypeColumnNameToShuffleType < ActiveRecord::Migration[6.1]
  def change
    rename_column :shuffles, :type, :shuffle_type
  end
end
