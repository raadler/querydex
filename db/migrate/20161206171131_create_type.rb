class CreateType < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name, null: false
      t.string :color, null: false
    end
  end
end
