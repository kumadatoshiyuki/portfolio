# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


# Affiliation.create!(
#   [
#     {
#       id: 1,
#       affiliation_name: "ひよこ組"
#     },

#     {
#       id: 2,
#       affiliation_name: "うさぎ組"
#     },

#     {
#       id: 3,
#       affiliation_name: "こあら組"
#     },

#     {
#       id: 4,
#       affiliation_name: "フリー"
#     }
#     ]
#   )

# # Meals.create!(
# #   [
# #     {
# #       id: 1,
# #       staple_food: "コーンご飯"
# #       main_dish: "焼売"
# #       side_dish: "枝豆"
# #       fruit:
# #       record:
# #     }





# #     ]


# #   )

# User.create!(
#   [
#     {
#       id: 1,
#       first_name: "太郎",
#       last_name: "熊田",
#       kana_first_name: "タロウ",
#       kana_last_name: "クマダ",
#       age: "２",
#       phone: "09011111111",
#       login_id: "123456",
#       affiliation_id: "3",
#       email: '1@1',
#       password: "123456"
#     },
#     {
#       id: 2,
#       first_name: "先生",
#       last_name: "保育士",
#       kana_first_name: "センセイ",
#       kana_last_name: "ホイクシ",
#       age: "25",
#       phone: "09011112222",
#       login_id: "00000000",
#       affiliation_id: "3",
#       email: '2@2',
#       password: "00000000"

#     },
#     {
#       id: 3,
#       first_name: "花子",
#       last_name: "うさぎ",
#       kana_first_name: "ハナコ",
#       kana_last_name: "ウサギ",
#       age: "1",
#       phone: "09022222222",
#       login_id: "22222222",
#       affiliation_id: "2",
#       email: '3@3',
#       password: "22222222"
#     },

#     {
#       id: 4,
#       first_name: "うさぎ",
#       last_name: "保育士",
#       kana_first_name: "ウサギ",
#       kana_last_name: "ホイクシ",
#       age: "20",
#       phone: "08011111111",
#       login_id: "44444444",
#       affiliation_id: "2",
#       email: '4@4',
#       password: "22222222"

#     }
#   ]
# )

# UserNote.create!(
#   [
#     {
#       user_id: 1,
#       body_temperature: "36.7",
#       number_toilet: "0",
#       sleep_start: "12",
#       sleep_end: "15",
#       breakfast: "ご飯・お味噌汁・シャケ",
#       dinner: "タラコスパゲッティー",
#       message: "体調変わりなく元気です！お休みの日はスカイツリーへ行きました！すごい高いと怖がりながらも気になっていた太郎でした。",
#       record_date: "2020/12/1"
#     }
#     # {
#     #   user_id: 2,
#     #   body_temperature: "37.1",
#     #   number_toilet: "1",
#     #   sleep_start: "11:45",
#     #   sleep_end: "15",
#     #   breakfast: "パン・コーンスープ・スクランブルエッグ",
#     #   dinner: "ハンバーグ・ご飯・中華スープ",
#     #   message: "昨日は公園で転びました。様子みてください。",
#     #   record: "2020/12/1"
#     # }
#     ]
#   )


  # News.create!(
  # [
  #   {
  #     id: 1,
  #     message: "明日は避難訓練がございますので9時までの登園nのご協力をお願い致します。",
  #     creation_date: "2020/12/1"
  #   }
  #   ]
  # )

  AffiliationNews.create!(
  [
    {
      id: 1,
      affiliation_id: 1,
      news_id: 1,
    }
    ]
  )
