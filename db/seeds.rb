# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# # #   Character.create(name: 'Luke', movie: movies.first)


Affiliation.create!(
  [
    {
      id: 1,
      affiliation_name: "ひよこ組"
    },

    {
      id: 2,
      affiliation_name: "うさぎ組"
    },

    {
      id: 3,
      affiliation_name: "こあら組"
    },

    {
      id: 4,
      affiliation_name: "フリー"
    }
    ]
  )

  Amount.create!(
  [
    {
      id: 1,
      amount_type: "全量"
    },

    {
      id: 2,
      amount_type: "4分3"
    },

    {
      id: 3,
      amount_type: "半分"
    },

    {
      id: 4,
      amount_type: "4分1"
    },

    {
      id: 5,
      amount_type: "残し"
    }
    ]
  )


      ToiletType.create!(
  [
    {
      id: 1,
      toilet_type: "コロコロ便"
    },

    {
      id: 2,
      toilet_type: "硬い便"
    },

    {
      id: 3,
      toilet_type: "やや硬い便"
    },

    {
      id: 4,
      toilet_type: "普通便"
    },

    {
      id: 5,
      toilet_type: "やや軟らかい便"
    },

    {
      id: 6,
      toilet_type: "泥状便"
    },

    {
      id: 7,
      toilet_type: "水様便"
    }
    ]
  )



User.create!(
  [
    {
      id: 1,
      first_name: "太郎",
      last_name: "熊田",
      kana_first_name: "タロウ",
      kana_last_name: "クマダ",
      age: 2,
      phone: "09011111111",
      login_id: "123456",
      affiliation_id: 3,
      email: '1@1',
      password: "123456",
      role: 1
    },
    {
      id: 2,
      first_name: "先生",
      last_name: "保育士",
      kana_first_name: "センセイ",
      kana_last_name: "ホイクシ",
      age: 25,
      phone: "09011112222",
      login_id: "00000000",
      affiliation_id: 3,
      email: '2@2',
      password: "00000000",
      role: 99

    },
    {
      id: 3,
      first_name: "花子",
      last_name: "うさぎ",
      kana_first_name: "ハナコ",
      kana_last_name: "ウサギ",
      age: 1,
      phone: "09022222222",
      login_id: "22222222",
      affiliation_id: 2,
      email: '3@3',
      password: "22222222",
      role: 1

    },

    {
      id: 4,
      first_name: "うさぎ",
      last_name: "保育士",
      kana_first_name: "ウサギ",
      kana_last_name: "ホイクシ",
      age: 20,
      phone: "08011111111",
      login_id: "44444444",
      affiliation_id: 2,
      email: '4@4',
      password: "22222222",
      role: 99
    }
  ]
)

UserNote.create!(
  [
    {
      user_id: 1,
      attendance_confirmation: true,
      body_temperature: 36.7,
      number_toilet: 0,
      sleep_start: 12,
      sleep_end: 15,
      breakfast: "ご飯・お味噌汁・シャケ",
      dinner: "タラコスパゲッティー",
      message: "体調変わりなく元気です！お休みの日はスカイツリーへ行きました！すごい高いと怖がりながらも気になっていた太郎でした。",
      record_date: "2020/12/18"
    },
    {
      user_id: 3,
      attendance_confirmation: true,
      body_temperature: 37.1,
      number_toilet: 1,
      sleep_start: 1145,
      sleep_end: 15,
      breakfast: "パン・コーンスープ・スクランブルエッグ",
      dinner: "ハンバーグ・ご飯・中華スープ",
      message: "昨日は公園で転びました。様子みてください。",
      record_date: "2020/12/18"
    }
    ]
  )

  AdminNote.create!(
  [
    {
      id:1,
      user_id: 1,
      body_temperature: 36.7,
      sleep_start: 12,
      sleep_end: 15,
      message: "今日は保育園で沢山遊びました！！",
      creator_id: 2,
      record_date: "2020/12/18",
      staple_food_amount_id: 1,
      main_dish_amount_id: 1,
      side_dish_amount_id: 2,
      fruit_amount_id: 2,
      soup_amount_id: 3
    },
    {
      id:2,
      user_id: 3,
      body_temperature: 36.7,
      sleep_start: 12,
      sleep_end: 15,
      message: "今日は公園にいきました",
      creator_id: 4,
      record_date: "2020/12/18",
      staple_food_amount_id: 1,
      main_dish_amount_id: 1,
      side_dish_amount_id: 2,
      fruit_amount_id: 4,
      soup_amount_id: 3
    },
    ]
  )


    ToiletTime.create!(
  [
    {
      id: 1,
      toilet_time: 12,
      toilet_type_id: 1,
      admin_note_id: 2
    },

    {
      id: 2,
      toilet_time: 11,
      toilet_type_id: 4,
      admin_note_id: 1
    },

    {
      id: 3,
      toilet_time: 4,
      toilet_type_id: 4,
      admin_note_id: 2
    },

    {
      id: 4,
      toilet_time: 2,
      toilet_type_id: 7,
      admin_note_id: 1
    }
    ]
  )



  News.create!(
  [
    {
      id: 1,
      message: "明日は避難訓練がございますので9時までの登園のご協力をお願い致します。",
      creation_date: "2020/12/1"
    }
    ]
  )

  AffiliationNews.create!(
  [
    {
      id: 1,
      affiliation_id: 1,
      news_id: 1,
    }
    ]
  )

Meal.create!(
  [
    {
      id: 1,
      staple_food: "コーンご飯",
      main_dish: "焼売",
      side_dish: "枝豆",
      soup: "味噌汁",
      fruit: "りんご",
      record_date: "2020/12/18"
    },
    {
      id: 2,
      staple_food: "ご飯",
      main_dish: "ハンバーグ",
      side_dish: "サラダ",
      soup: "味噌汁",
      fruit: "みかん",
      record_date: "2020/12/19"
    },
        {
      id: 3,
      staple_food: "餃子",
      main_dish: "焼売",
      side_dish: "バンバンジー",
      soup: "味噌汁",
      fruit: "桃",
      record_date: "2020/12/20"
    },
    {
      id: 4,
      staple_food: "ジャージャー麺",
      main_dish: "ラーメン",
      side_dish: "サラダ",
      soup: "味噌汁",
      fruit: "どんぐり",
      record_date: "2020/12/2"
    }
    ]
  )

