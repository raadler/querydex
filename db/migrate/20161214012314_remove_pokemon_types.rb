class RemovePokemonTypes < ActiveRecord::Migration
  def change
    drop_table :pokemon_types do |t|
      t.belongs_to :pokemon, null: false
      t.belongs_to :type, null: false
    end
  end
end
