class Herb < ApplicationRecord
  validates :name, presence: true
  validates :classification, presence: true
  validates :image, presence: true

  enum classification: {
    others: 0,
    epemeral: 1,
    perennial: 2,
    shurub: 3,
    tree: 4,
  }
end
