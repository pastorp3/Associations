class ChangeNameCreator < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :creator, :creator_id
  end
end
