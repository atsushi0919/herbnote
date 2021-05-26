require "rails_helper"

RSpec.describe HerbProperty, type: :model do
  describe "バリデーション" do
    subject { herb_property.valid? }

    context "全て正しいパラメータが渡されたとき" do
      # factory_bot_rails を使用 => build(:herb_property)
      let(:herb_property) { build(:herb_property) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "feature が空のとき" do
      let(:herb_property) { build(:herb_property, feature: " ") }
      it "保存出来ない" do
        expect(subject).to eq false
        expect(herb_property.errors.messages[:feature]).to \
          include "を入力してください"
      end
    end

    context "feature が21文字以上のとき" do
      let(:herb_property) { build(:herb_property, feature: "a" * 21) }
      it "保存出来ない" do
        expect(subject).to eq false
        expect(herb_property.errors.messages[:feature]).to \
          include "は20文字以内で入力してください"
      end
    end
  end
end
