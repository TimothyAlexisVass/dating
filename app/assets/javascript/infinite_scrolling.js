$(document).ready(function() {
  if($('#infinite-scrolling').size() > 0) {
    $(window).scroll(function() {
      more_items_url = $('.pagination .next_page').attr('href');
      if(more_items_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100){
        $('.pagination').html('<img src="/assets/ajax-loading.gif" alt="Loading..." title="Loading..." />');
        $.getScript(more_items_url);
      }
    });
  }
});