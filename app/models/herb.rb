class Herb < ApplicationRecord
  validates :name, presence: true
  validates :plant_type, presence: true
  validates :image, presence: true

  enum plant_type: {
    others: 0,
    epemeral: 1,
    perennial: 2,
    shurub: 3,
    tree: 4,
  }
end
