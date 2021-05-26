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

    context "alies が nil のとき" do
      let(:herb) { build(:herb, alies: nil) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "image が空のとき" do
      it "保存できる" do
        herb = Herb.new(name: "バジル",
                        alies: "メボウキ",
                        classification: 1)
        expect(herb.valid?).to eq true
      end
    end

    context "name が空のとき" do
      it "保存できない" do
        herb = Herb.new(name: "",
                        alies: "",
                        classification: 1,
                        image: "basil.jpg")
        expect(herb.valid?).to eq false
      end
    end

    context "classification が nil のとき" do
      let(:herb) { build(:herb, classification: nil) }
      it "保存できない" do
        expect(subject).to eq false
        expect(herb.errors.messages[:classification]).to \
          include "を入力してください"
      end
    end
  end
end
