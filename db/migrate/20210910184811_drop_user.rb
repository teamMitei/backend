class DropUser < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :rank, :integer

  end
end
