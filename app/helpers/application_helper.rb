module ApplicationHelper
    # %Y  年4桁
    # %m  月2桁
    # %d  日2桁
    # %H  時2桁
    # %M  分2桁
    # %S  秒2桁
    # %X  時:分:秒 (%H:%M:%S と同じ)
    # %w  曜日番号。0(日曜日) 〜 6(土曜日)

    def get_today
     # 今日の日付を取得
     date = DateTime.now()
     # 日付のフォーマットの変更
     today = date.strftime("%Y-%m-%d")
    return today
    end

    # @user_note.sleep_start
    def get_time(date)
       # 日付のフォーマットの変更
      time = date.strftime("%H:%M")
      return time
    end

    def get_date(date)
       # 日付のフォーマットの変更
      time = date.strftime("%Y-%m-%d")
      return time
    end

    # item <= @admin_note
    # column <=
    # staple_food_amount
    # main_dish_amount
    # side_dish_amount
    # soup_amount
    # fruit_amount
    def get_amount(item, amount_id)

      if item
        return nil
      end

      # @admin_noteがあるかチェック
      if amount_id.nil?
        return 0
      end

      case amount_id
      when 1 then
        return "100"
      when 2 then
        return "75"
      when 3 then
        return "50"
      when 4 then
        return "25"
      when 5 then
        return "10"
      end
    end

    def get_amount_color(item, amount_id)

      if item
        return nil
      end

      if amount_id.nil?
        return nil
      end


      case amount_id
      when 1 then
        return nil
      when 2 then
        return "progress-bar-info"
      when 3 then
        return "progress-bar-success"
      when 4 then
        return "progress-bar-warning"
      when 5 then
        return "progress-bar-danger"
      end

    end





end
