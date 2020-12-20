

$(function () {
    // 画面遷移を検知
        // lengthを呼び出すことで、#meal_calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
        if ($('#meal_calendar').length) {

            function clearCalendar() {
                $('#meal_calendar').html('');
            };



            $(document).on('turbolinks:before-cache', clearCalendar);

            $('#meal_calendar').fullCalendar({
                // ヘッダーのタイトルとボタン
                header: {
                    left: 'prev,next today',
                    center: 'month,listMonth',
                    right: 'title'
                },
                // jQuery UI theme
                theme: false,
                // 週モード (fixed, liquid, variable)
                weekMode: 'fixed',
                // 週数を表示
                weekNumbers: false,
                // 高さ(px)
                height: 'auto',
                // コンテンツの高さ(px)
                //contentHeight: 600,
                // カレンダーの縦横比(比率が大きくなると高さが縮む)
                //aspectRatio: 1.35,
                // ビュー表示イベント
                viewDisplay: function(view) {
                    //alert('ビュー表示イベント ' + view.title);
                },
                // ウィンドウリサイズイベント
                windowResize: function(view) {
                    //alert('ウィンドウリサイズイベント');
                },
                // 日付クリックイベント
                dayClick: function () {
                    //alert('日付クリックイベント');
                },
                // 初期表示ビュー
                defaultView: 'month',
                // 終日スロットを表示
                allDaySlot: true,
                // 終日スロットのタイトル
                allDayText: '終日',
                // スロットの時間の書式
                axisFormat: 'H(:mm)',
                // スロットの分
                slotMinutes: 15,
                // 選択する時間間隔
                snapMinutes: 15,
                // TODO よくわからない
                //defaultEventMinutes: 120,
                // スクロール開始時間
                firstHour: 9,
                // 最小時間
                minTime: 6,
                // 最大時間
                maxTime: 20,
                // 表示する年
                year: 2012,
                // 表示する月
                month: 12,
                // 表示する日
                day: 31,
                // 時間の書式
                timeFormat: 'H(:mm)',
                // 月名称
                monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                // 月略称
                monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
                // 曜日名称
                dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
                // 曜日略称
                dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
                // 選択可
                selectable: true,
                // 選択時にプレースホルダーを描画
                selectHelper: true,
                // 自動選択解除
                unselectAuto: true,
                // 自動選択解除対象外の要素
                unselectCancel: '',
                // タイトルの書式
                titleFormat: 'YYYY年 M月',
                locale: 'ja',
                lang: 'ja',
                // 最初の曜日
                firstDay: 1, // 1:月曜日
                // 土曜、日曜を表示
                weekends: false,
                //開始時間を非表示
                displayEventTime: false,
                //タイムゾーン
                timezone: 'ASIA/TOKYO',
                //日付クリック
                navLinks: true,
                events: '/events',
                defaultTimedEventDuration: '03:00:00',
                // ボタン文字列
                buttonText: {
                    prev: '前',
                    next: '次',
                    prevYear: '前年',
                    nextYear: '翌年',
                    today: '今日',
                    month: '月',
                    week: '週',
                    day: '日',
                    list: 'リスト',
                },
                //eventColor: '#eee',
                eventTextColor: '#555',
            });

        }
    
});
