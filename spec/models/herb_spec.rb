require "rails_helper"

RSpec.describe Herb, type: :model do
  describe "バリデーション" do
    subject { herb.valid? }

    context "正しいパラメータが渡されたとき" do
      let(:herb) { build(:herb) }
      it "保存できる" do
        expect(subject).to eq true
        expect(herb.alies).to eq nil
        expect(herb.classification).to eq "others"
        expect(herb.image).to eq "noimage.jpg"
      end
    end

    context "name が空のとき" do
      let(:herb) { build(:herb, name: " ") }
      it "保存できない" do
        expect(herb.valid?).to eq false
        expect(herb.errors.messages[:name]).to \
          include "を入力してください"
      end
    end

    context "classification が空のとき" do
      let(:herb) { build(:herb, classification: " ") }
      it "保存できない" do
        expect(subject).to eq false
        expect(herb.errors.messages[:classification]).to \
          include "を入力してください"
      end
    end
  end
end
