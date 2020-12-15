// CRUDを行う際にCSRF対策のtokenを発行
$(document).ready(function() {
var prepare = function(options, originalOptions, jqXHR) {
  var token;
  if (!options.crossDomain) {
    token = $('meta[name="csrf-token"]').attr('content');
    if (token) {
      return jqXHR.setRequestHeader('X-CSRF-Token', token);
    }
  }
};
}
)

 // カレンダー表示
        $('#calendar').fullCalendar ({
            header: {
                left: 'prev,next today',
                center: 'month,agendaWeek,agendaDay',
                right: 'title'
            },

            buttonText: {
                  prev: "<",
                  next: ">"
            },

            timezone: 'UTC',
            events: '/users/top.json',
            navLinks: true,
            selectable: true,
            selectHelper: true,
            // 日付クリック
            dayClick : function ( date , jsEvent , view ) {
                $('#inputScheduleForm').modal('show');
                },

            // event クリックで編集、削除
            eventClick : function(event, jsEvent , view) {
                jsEvent.preventDefault();
                $(`#inputScheduleEditForm${event.id}`).modal('show');
            },

            eventMouseover : function(event, jsEvent , view) {
                jsEvent.preventDefault();
            }
        })
