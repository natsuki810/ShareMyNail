# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: "111@sharemynail.com") do |admin|
  admin.password = "111111"
end

other = Color.find_or_create_by!(name: "その他") do |color|
  color.name = "その他"
end

pink = Color.find_or_create_by!(name: "ピンク") do |color|
  color.name = "ピンク"
end

bulue = Color.find_or_create_by!(name: "ブルー") do |color|
  color.name = "ブルー"
end

parple = Color.find_or_create_by!(name: "パープル") do |color|
  color.name = "パープル"
end

broun = Color.find_or_create_by!(name: "ブラウン") do |color|
  color.name = "ブラウン"
end

black_Withte = Color.find_or_create_by!(name: "ブラック・ホワイト") do |color|
  color.name = "ブラック・ホワイト"
end

gorld_sirver = Color.find_or_create_by!(name: "ゴールド・シルバー") do |color|
  color.name = "ゴールド・シルバー"
end

aska = User.find_or_create_by!(email: "aaa@sharemynail.com") do |user|
  user.name = "あすか"
  user.password = "password"
end

yui = User.find_or_create_by!(email: "yyy@sharemynail.com") do |user|
  user.name = "ゆい"
  user.password = "password"
  user.introduction = "セルフネイラーです"
end

hina = User.find_or_create_by!(email: "hhh@sharemynail.com") do |user|
  user.name = "ひな"
  user.password = "password"
end

Design.find_or_create_by!(name: "キラキラホログラムネイル") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design1.jpg"), filename: "sample-design1.jpg")
  design.introduction = "クリアベースにホログラムをたっぷり♪全部１００円均一アイテムです。"
  design.user = aska
  design.color = other
end

Design.find_or_create_by!(name: "ラメグラデーション") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design2.jpg"), filename: "sample-design2.jpg")
  design.introduction = "ナチュラルピンクをベースにゴールドグラデーションをアクセントでおきました✴︎全部１００円均一アイテムです。"
  design.user = aska
  design.color = pink
end

Design.find_or_create_by!(name: "フラワーネイル") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design3.jpg"), filename: "sample-design3.jpg")
  design.introduction = "ワンカラーベースにお花シールで仕上げました"
  design.user = aska
  design.color = other
end

Design.find_or_create_by!(name: "ピンクコーラル＊グラデーション") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design4.jpg"), filename: "sample-design4.jpg")
  design.introduction = "ピンクコーラルのシンプルグラデーション☆１００均のオークルピンク使用"
  design.user = hina
  design.color = pink
end

Design.find_or_create_by!(name: "Vカットストーンネイル") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design5.jpg"), filename: "sample-design5.jpg")
  design.introduction = "ピンクベースにシルバーラインとVカットストーン☆１００均のピンクベージュ使用"
  design.user = hina
  design.color = pink
end

Design.find_or_create_by!(name: "パヒュームネイル") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design6.jpg"), filename: "sample-design6.jpg")
  design.introduction = "ピンクとパープルをベースに香水をイメージ♪パープルはオーロラパウダーを重ねました"
  design.user = yui
  design.color = pink
end

Design.find_or_create_by!(name: "ミルクピンク✖️ミルクブルー") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design7.jpg"), filename: "sample-design7.jpg")
  design.introduction = "ミルクっぽいピンクとブルーでほんわかイメージホログラムとストーンでキラキラに"
  design.user = yui
  design.color = pink
end

Design.find_or_create_by!(name: "ブラック✖️ゴールドデザイン") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design8.jpg"), filename: "sample-design8.jpg")
  design.introduction = "ブラックをベースにポイントでピンクとゴールドラインのシールで仕上げました"
  design.user = yui
  design.color = black_Withte
end

Design.find_or_create_by!(name: "ミルクブルー✖️パープルグラデ") do |design|
  design.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-design9.jpg"), filename: "sample-design9.jpg")
  design.introduction = "ミルクブルーをベースにパープル・ピンク・ブルーラメをmixしてグラデをポイントに♪"
  design.user = yui
  design.color = bulue
end
