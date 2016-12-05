class CreatePokemon < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.integer :gen_id, null: false
      t.integer :ndex, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      t.integer :gender_rate, null: false
      t.integer :catch_rate, null: false
      t.integer :exp_yield, null: false
      t.integer :base_happiness, null: false
      t.integer :egg_group1, null: false
      t.integer :egg_group2
      t.boolean :is_baby, null: false, default: false
      t.integer :hatch_counter, null: false
      t.integer :lvl_100_exp, null: false
    end
  end
end
