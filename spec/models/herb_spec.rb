require "rails_helper"

RSpec.describe Herb, type: :model do
  describe "バリデーション" do
    context "正しいパラメータが全て渡されたとき" do
      it "保存できる" do
        herb = Herb.new(name: "バジル",
                        alies: "メボウキ",
                        classification: 1,
                        image: "basil.jpg")
        expect(herb.valid?).to eq true
      end
    end

    context "alies が空のとき" do
      it "保存できる" do
        herb = Herb.new(name: "バジル",
                        alies: "",
                        classification: 1,
                        image: "basil.jpg")
        expect(herb.valid?).to eq true
      end
    end

    context "classification が空のとき" do
      it "保存できる" do
        herb = Herb.new(name: "バジル",
                        alies: "メボウキ",
                        image: "basil.jpg")
        expect(herb.valid?).to eq true
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
  end
end
