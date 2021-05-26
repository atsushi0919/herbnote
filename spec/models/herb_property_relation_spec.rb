require "rails_helper"

RSpec.describe HerbPropertyRelation, type: :model do
  describe "バリデーション" do
    subject { herb_property_relation.valid? }

    let(:herb) { Herb.create(name: "バジル") }
    let(:herb_property) { create(:herb_property) }

    context "データが条件を満たすとき" do
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: herb.id,
              herb_property_id: herb_property.id)
      }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "herb_id が nil のとき" do
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: nil,
              herb_property_id: herb_property.id)
      }
      it "保存できない" do
        expect(subject).to eq false
        expect(herb_property_relation.errors.messages[:herb]).to \
          include "を入力してください"
      end
    end

    context "herb_id が 正しくないとき" do
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: herb.id + 1,
              herb_property_id: herb_property.id)
      }
      it "保存できない" do
        expect(subject).to eq false
        expect(herb_property_relation.errors.messages[:herb]).to \
          include "を入力してください"
      end
    end

    context "herb_property_id が nil のとき" do
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: herb.id,
              herb_property_id: nil)
      }
      it "保存できない" do
        expect(subject).to eq false
        expect(herb_property_relation.errors.messages[:herb_property]).to \
          include "を入力してください"
      end
    end

    context "herb_property_id が 正しくないとき" do
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: herb.id,
              herb_property_id: herb_property.id + 1)
      }
      it "保存できない" do
        expect(subject).to eq false
        expect(herb_property_relation.errors.messages[:herb_property]).to \
          include "を入力してください"
      end
    end

    context "herb_id と herb_property_id の組み合わせが既に存在するとき" do
      before {
        create(:herb_property_relation,
               herb_id: herb.id,
               herb_property_id: herb_property.id)
      }
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: herb.id,
              herb_property_id: herb_property.id)
      }
      it "保存できない" do
        expect(subject).to eq false
        herb_property_relation.errors.messages
        expect(herb_property_relation.errors.messages[:herb_id]).to \
          include "はすでに存在します"
      end
    end

    context "herbを削除したとき" do
      let(:herb_property_relation) {
        build(:herb_property_relation,
              herb_id: herb.id,
              herb_property_id: herb_property.id)
      }
      it "herb_property_relation も削除される" do
        expect(subject).to eq true
        herb_property_relation.save
        expect(HerbPropertyRelation.all.size).to eq 1
        herb.destroy
        expect(HerbPropertyRelation.all.size).to eq 0
      end
    end
  end
end
