class FavoriteHerb < ApplicationRecord
  belongs_to :user
  belongs_to :herb, counter_cache: :favorite_count

  validates :user_id, uniqueness: {
                        scope: :herb_id,
                        message: "はお気に入り登録済みです",
                      }
end
