if Rails.env.development?
  #メインのサンプルユーザーを1人作成する
  User.create!(name: "atsushi_0919_",
               email: "hatake0919@yahoo.co.jp",
               password: "password",
               password_confirmation: "password",
               admin: true,
               activated: true,
               activated_at: Time.zone.now)

  # 追加のユーザーをまとめて生成する
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n + 1}@railstutorial.org"
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 activated: true,
                 activated_at: Time.zone.now)
  end

  # 管理者ユーザーを作成する
  AdminUser.create!(email: "hatake0919@yahoo.co.jp",
                    password: "password",
                    password_confirmation: "password")
end
