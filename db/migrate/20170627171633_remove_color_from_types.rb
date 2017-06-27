class RemoveColorFromTypes < ActiveRecord::Migration
  def up
    remove_column :types, :color, :string
  end

  def down
    add_column :types, :color, :string
  end
end
