FactoryBot.define do
  factory :herb_description do
    herb_id { 1 }
    overview { "MyText" }
    how_to_use { "MyText" }
    how_to_grow { "MyText" }
    note { "MyText" }
  end
end
