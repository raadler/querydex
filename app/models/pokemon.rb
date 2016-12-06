class Pokemon < ActiveRecord::Base
  validates :name, presence: true
  validates :species, presence: true
  validates :gen_id, presence: true, numericality: { only_integer: true }
  validates :ndex, presence: true, numericality: { only_integer: true }
  validates :height, presence: true, numericality: { only_float: true }
  validates :weight, presence: true, numericality: { only_float: true }
  validates :gender_rate, presence: true, numericality: { only_integer: true }, inclusion: {in: -1..8 }
  validates :catch_rate, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..255 }
  validates :exp_yield, presence: true, numericality: { only_integer: true }
  validates :base_happiness, presence: true, numericality: { only_integer: true }, inclusion: {in: 0..255 }
  validates :egg_group1, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..16 }
  validates :egg_group2, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..16 }
  validates :hatch_counter, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..255 }
  validates :lvl_100_exp, presence: true, numericality: { only_integer: true }, inclusion: {in: 1..1250000}
end
