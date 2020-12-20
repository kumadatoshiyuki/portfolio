module ApplicationHelper
    def get_today
     # 今日の日付を取得
     date = DateTime.now()
     # 日付のフォーマットの変更
     today = date.strftime("%Y-%m-%d")
    return today    
    end
    
    
    
    
end
