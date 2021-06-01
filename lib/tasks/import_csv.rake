require "csv"

namespace :import_csv do
  # タスクの説明
  desc "herb_data.csv をインポートするタスク"

  # タスク名 => herbs
  task herbs: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/herb_data.csv"
    # インポートするデータを格納するための配列

    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      row = row.to_h
      row["classification"] = row["classification"].to_i
      list << row
    end
    puts "インポート処理を開始"
    begin
      Herb.create!(list)
      puts "インポート完了!!"
    rescue StandardError => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポート失敗"
    end
  end
end

namespace :import_csv do
  # タスクの説明
  desc "herb_property_data.csv をインポートするタスク"

  # タスク名 => herb_properties
  task herb_properties: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/herb_property_data.csv"
    # インポートするデータを格納するための配列

    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row
    end
    puts "インポート処理を開始"
    begin
      HerbProperty.create!(list)
      puts "インポート完了!!"
    rescue StandardError => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポート失敗"
      a
    end
  end
end

namespace :import_csv do
  # タスクの説明
  desc "herb_property_relation_data.csv をインポートするタスク"

  # タスク名 => herb_property_relations
  task herb_property_relations: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/herb_property_relation_data.csv"
    # インポートするデータを格納するための配列

    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      row = row.to_h.map { |key, value| [key, value.to_i] }.to_h
      list << row
    end
    puts "インポート処理を開始"
    begin
      HerbPropertyRelation.create!(list)
      puts "インポート完了!!"
    rescue StandardError => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポート失敗"
    end
  end
end

namespace :import_csv do
  # タスクの説明
  desc "herb_description_data.csv をインポートするタスク"

  # タスク名 => herb_descriptions
  task herb_descriptions: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/herb_description_data.csv"

    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      row = row.to_h
      row["herb_id"] = row["herb_id"].to_i
      list << row
    end
    puts "インポート処理を開始"
    begin
      HerbDescription.create!(list)
      puts "インポート完了!!"
    rescue StandardError => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポート失敗"
    end
  end
end
