class Ingredient < ApplicationRecord
  belongs_to :Recipe, optional: true
  validates :name, presence: true
end
