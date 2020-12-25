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


  #     ToiletType.create!(
  # [
  #   {
  #     id: 1,
  #     toilet_type: "コロコロ便"
  #   },

  #   {
  #     id: 2,
  #     toilet_type: "硬い便"
  #   },

  #   {
  #     id: 3,
  #     toilet_type: "やや硬い便"
  #   },

  #   {
  #     id: 4,
  #     toilet_type: "普通便"
  #   },

  #   {
  #     id: 5,
  #     toilet_type: "やや軟らかい便"
  #   },

  #   {
  #     id: 6,
  #     toilet_type: "泥状便"
  #   },

  #   {
  #     id: 7,
  #     toilet_type: "水様便"
  #   }
  #   ]
  # )

  # admin作成
User.create!(
  [
    {
      id: 1,
      first_name: "太郎",
      last_name: "熊田",
      kana_first_name: "タロウ",
      kana_last_name: "クマダ",
      age: 26,
      phone: "09000000001",
      login_id: "123456",
      affiliation_id: 1,
      email: 'kumakuma@kuma.com',
      password: "123456",
      role: 99
    },
    {
      id: 2,
      first_name: "葉月",
      last_name: "大塚",
      kana_first_name: "ハズキ",
      kana_last_name: "オオツカ",
      age: 25,
      phone: "09000000002",
      login_id: "100000",
      affiliation_id: 1,
      email: 'hadu@hadu.com',
      password: "100000",
      role: 99

    },
    {
      id: 3,
      first_name: "りの",
      last_name: "今井",
      kana_first_name: "リノ",
      kana_last_name: "イマイ",
      age: 24,
      phone: "09000000003",
      login_id: "100001",
      affiliation_id: 2,
      email: 'rinorino@rino.com',
      password: "100001",
      role: 99

    },

    {
      id: 4,
      first_name: "あゆみ",
      last_name: "林",
      kana_first_name: "アユミ",
      kana_last_name: "ハヤシ",
      age: 24,
      phone: "09000000004",
      login_id: "100002",
      affiliation_id: 2,
      email: 'ayuu@ayu.com',
      password: "100002",
      role: 99
    },

    {
      id: 5,
      first_name: "かおる",
      last_name: "溝口",
      kana_first_name: "カオル",
      kana_last_name: "ミゾグチ",
      age: 29,
      phone: "09000000005",
      login_id: "100003",
      affiliation_id: 3,
      email: 'kaorunn@kaorunn.com',
      password: "100003",
      role: 99

    },

    {
      id: 6,
      first_name: "みさ",
      last_name: "水野",
      kana_first_name: "ミサ",
      kana_last_name: "ミズノ",
      age: 29,
      phone: "09000000006",
      login_id: "100004",
      affiliation_id: 3,
      email: 'misamisa@misa.com',
      password: "100004",
      role: 99

    },

    {
      id: 7,
      first_name: "双葉",
      last_name: "小林",
      kana_first_name: "フタバ",
      kana_last_name: "コバヤシ",
      age: 26,
      phone: "09000000007",
      login_id: "100005",
      affiliation_id: 3,
      email: 'bachi@bachcath.com',
      password: "100005",
      role: 99

    },



  ]
)
# id: 1,
# affiliation_name: "ひよこ組"

# id: 2,
# affiliation_name: "うさぎ組"

# id: 3,
# affiliation_name: "こあら組"

afs = Affiliation.all
afs.each do |affiliation|
  if affiliation.id == 1
    age = 0
    cnt = 6
  elsif affiliation.id == 2
    age = 1
    cnt = 10
  elsif affiliation.id == 3
    age = 2
    cnt = 14
  else
    age = 0
    cnt = 0
  end
  # 1回目のループではひよこ組を作成

  cnt.times do |index|
    gimei = Gimei.new

    user = User.create!(
      first_name: gimei.first.kanji,
      last_name: gimei.last.kanji,
      kana_first_name: gimei.first.katakana,
      kana_last_name: gimei.last.katakana,
      age: age,
      phone: Faker::PhoneNumber.subscriber_number(length: 2) + Faker::PhoneNumber.subscriber_number(length: 4) + Faker::PhoneNumber.subscriber_number(length: 4) ,
      login_id: "0000" + "#{affiliation.id}" + "#{index}",
      affiliation_id: affiliation.id,
      email: Faker::Internet.email,
      password: "000000",
      role: 1
    )


    # 30日分
    30.times do |index2|
      # 今日の日付を
      d = Date.today
      date = d-index2

      items = [true, false, true, true, true, true, true, true, true, true, true, true]
      bool = items.sample


      nums = [*("36.1".."36.9").to_a]
      num = nums.sample

      toilets = [*("1".."5").to_a]
      toilet = toilets.sample
      
      
      usernotes = ["今日も元気です。",
      "昨日は保育園の帰りにレストランでご飯を食べました！",
      "昨日は保育園の帰りに近所のお友達と公園に行きました！優しく関わる姿を見て#{user.first_name}も大きくなったんだなと感じました！",
      "保育園の出来事をたくさんお話ししてくれて聞いていて楽しいです！",
      "早く起きたので眠いかもしれません。",
      "最近すごくお話しをしてくれる#{user.first_name}。保育園での楽しい様子が知ることができ嬉しいです！",
      "体調は変わらず元気です！！お姉ちゃんの真似をして人形にお世話して楽しんでいる#{user.first_name}です！笑",
      "寝る前にお菓子を食べ、私に叱られてションボリする#{user.first_name}。ちゃんと時間を決めて食べることを約束しました！笑",
      "今日は用事がある為、16:00時迎えでお願いします。",
      "今日は仕事のため19:00迎えになります。"
      ]
      usernote = usernotes.sample
      
      # usernote作成
      UserNote.create!(
        user_id: user.id,
        attendance_confirmation: bool,
        body_temperature: num,
        number_toilet: toilet,
        sleep_start: "22",
        sleep_end: "7",
        breakfast: "ご飯・お味噌汁・シャケ",
        dinner: "シチュー・パン・ハンバーグ",
        message: usernote,
        record_date: date
      )

      nums = [*("36.1".."36.9").to_a]
      num = nums.sample

      toilets = [*("1".."5").to_a]
      toilet = toilets.sample


      staple_food_amounts = [*(1..5)]
      staple_food_amount_cnt = staple_food_amounts.sample

      main_dish_amounts = [*(1..5)]
      main_dish_amount_cnt = main_dish_amounts.sample

      side_dish_amounts = [*(1..5)]
      side_dish_amount_cnt = side_dish_amounts.sample

      fruit_amounts = [*(1..5)]
      fruit_amount_cnt = fruit_amounts.sample

      soup_amounts = [*(1..5)]
      soup_amount_cnt = soup_amounts.sample


      admin_ids = User.get_admin.where(affiliation_id: affiliation.id).pluck(:id)
      admin_id = admin_ids.sample
      
      adminnotes = ["今日はクレヨン公園へ行きました！滑り台を気に入り何度も滑って楽しく遊んでいました！！",
      "今日は雨の為、室内で体操をしました！元気いっぱいに保育士の真似をしていました！！",
      "今日は園庭で遊びました！待て待て〜と追いかけると『きゃー！』と嬉しそうに逃げて楽しんでいました！",
      "今日は雨の為、ホールでサーキットを作り遊びました！滑り台やマットを楽しんで行っていました！",
      "今日は室内で絵具遊びをしました！色ん色に興味を持ち手形スタンプ！！色彩や感触を楽しんでいました！",
      "今日はクレヨン公園へ行きました！砂場ではバケツにいっぱい砂を入れて一緒にケーキを作ると上手に食べる真似をしていました！",
      "ご飯いっぱい食べたんですね！今日は室内でボールプール遊び！「わー！！」と楽しそうにボールを投げて遊んでいました！",
      "今日は室内で製作をしました！集中しながらシールをたくさん貼っていると・・あれ・・可愛いお顔にもシールが！！笑。一緒に笑いながら制作をしました！",
      "今日はクレヨン公園に行きました！真っ先に滑り台へ行く#{user.first_name}ちゃん！シーソでも一緒に遊びました！",
      "今日は朝泣いて登園してきましたが、保育園では絵本を読むとすぐに笑顔になった#{user.first_name}ちゃん！公園では一緒に滑り台をすると、何度もリクエストしてたくさん滑りました！"
      ]
      adminnote = adminnotes.sample
      
      
      
      # adminnote作成
      AdminNote.create!(
          user_id: user.id,
          body_temperature: num,
          number_toilet: toilet,
          sleep_start: "12",
          sleep_end: "15",
          message: adminnote,
          creator_id: admin_id,
          record_date: date,
          staple_food_amount_id: staple_food_amount_cnt,
          main_dish_amount_id: main_dish_amount_cnt,
          side_dish_amount_id: side_dish_amount_cnt,
          fruit_amount_id: fruit_amount_cnt,
          soup_amount_id: soup_amount_cnt
      )
    end
  end
end





  News.create!(
  [
    {
      id: 1,
      message: "明日は避難訓練がございますので9時までの登園のご協力をお願い致します。",
      creation_date: "2020/12/1"
    }
    ]
  )
  
  


30.times do |index3|
  
    d = Date.today
    date = d-index3
    
    staple_foods = [
      "ご飯",
      "ロールパン",
      "焼肉丼",
      "中華丼",
      "コーンご飯",
      "ビビンバ丼",
      "ジャージャー麺",
      "カレーライス",
      "カレーうどん",
      "あんかけ焼きそば"
      ]
    staple = staple_foods.sample
    
    main_dishes = [
      "酢豚",
      "ハンバーグ",
      "肉味噌大根",
      "唐揚げ",
      "豆腐ステーキ",
      "生姜焼き",
      "南蛮漬け",
      "ゴーヤチャンプル",
      "鮭の塩焼き",
      "すき焼き風煮物"
      ]
    maind = main_dishes.sample
    
    side_dishes = [
      "小松菜と油揚げの煮浸し",
      "ほうれん草のお浸し",
      "大根のベッコウ煮",
      "椎茸の味噌マヨ焼き",
      "人参シリシリ",
      "きんぴらごぼう",
      "切り干し大根",
      "オニオントマトサラダ",
      "れんこんと鶏肉の煮物",
      "白菜とわかめの胡麻酢あえ"
      ]
    side = side_dishes.sample
    
    soups = [
      "オニオンスープ",
      "なめこの味噌汁",
      "コーンスープ",
      "かぶの味噌汁",
      "豚汁",
      "南瓜スープ",
      "中華スープ",
      "ミネストローネ",
      "ABCスープ",
      "小松菜の味噌汁"
      ]
    souptype = soups.sample
    
    fruits = [
      "りんご",
      "みかん",
      "イチゴ",
      "オレンジ",
      "バナナ",
      "なし",
      "桃",
      "柿",
      "スイカ",
      "メロン"
      ]
    fruittype = fruits.sample

      Meal.create!(
      staple_food: staple,
      main_dish: maind,
      side_dish: side,
      soup: souptype,
      fruit: fruittype,
      record_date: date

    )
  end

