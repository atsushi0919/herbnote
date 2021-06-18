class PostedTopic < ApplicationRecord
  belongs_to :post
  belongs_to :herb_property

  validates :post_id, uniqueness: {
                        scope: :herb_property_id,
                        message: "トピックの重複は出来ません",
                      }
end
