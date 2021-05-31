class ChangeTypeToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :shuffles, :type, 'integer USING CAST(type AS integer)'
  end
end
