
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
        left: 'prev,next',
        center: 'month',
        right: 'title'
    },

    buttonText: {
          prev: "先月",
          next: "翌月"
    },

    timezone: 'UTC',
    events: '/users/meals.json',
    navLinks: true,
    selectable: true,
    selectHelper: true,


    eventMouseover : function(event, jsEvent , view) {
        jsEvent.preventDefault();
    }
})
