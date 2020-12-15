$(function() {

  // button
  const btn_clone = $('#btn-clone');  // 追加ボタン
  const btn_remove = $('#btn-remove');  // 削除ボタン

  // clone
  btn_clone.click(function() {

    var text = $('.toilet_time').last();  // 最後尾にあるinput

		text.clone().val('').insertAfter(text);


    if ($('.toilet_time').length >= 2) {
      $(btn_remove).show();  // inputが2つ以上あるときに削除ボタンを表示
    }

  });

  // remove
	btn_remove.click(function() {

    $('.toilet_time')
      .last()
      .remove();

    if ($('.toilet_time').length < 2) {
      btn_remove.hide();  // inputが2つ未満のときに削除ボタンを非表示
    }

  });
});
