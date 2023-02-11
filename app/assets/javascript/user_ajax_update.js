function userAjaxUpdate(element, field) {
  $.ajax({
    url: '<%= ajax_update_user_path(@user) %>',
    type: 'PUT',
    data: {
      user: {
        [field]: $(element).val()
      }
    }
  });
}