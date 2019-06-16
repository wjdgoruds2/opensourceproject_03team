$( document ).ready(function() {
  
  const changeText = function (el, text, color) {
    el.text(text).css('color', color);
  };
  
  $('.input-1').keyup(function(){
    let len = this.value.length;
    const pbText = $('.form-1 .progress-bar_text');

    if (len === 0) {
      $('.form-1 .progress-bar_item').each(function() {
        $(this).removeClass('active')
      });
      $('.form-1 .active').css('background-color', 'transparent');
      changeText(pbText, 'ID is blank', '#aaa');
    } else {
      $('.form-1 .progress-bar_item').each(function() {
        $(this).addClass('active');
      });
      $('.form-1 .active').css('background-color', '#2DAF7D');
      changeText(pbText, '');
    } 
  });
  
  $('.input-2').keyup(function(){
    let len = this.value.length;
    const pbText = $('.form-2 .progress-bar_text');

    if (len === 0) {
      $('.form-2 .progress-bar_item').each(function() {
        $(this).removeClass('active')
      });
      changeText(pbText, 'Password is blank');
    } else if (len > 0 && len <= 4) {
      $('.form-2 .progress-bar_item-1').addClass('active');
      $('.form-2 .progress-bar_item-2').removeClass('active');
      $('.form-2 .progress-bar_item-3').removeClass('active');
      changeText(pbText, 'Too weak');
    } else if (len > 4 && len <= 8) {
      $('.form-2 .progress-bar_item-2').addClass('active');
      $('.form-2 .progress-bar_item-3').removeClass('active');
      changeText(pbText, 'Could be stronger');
    } else {
      $('.form-2 .progress-bar_item').each(function() {
        $(this).addClass('active');
      });
      changeText(pbText, 'Strong password');
    } 
  });
  
  $('.input-3').keyup(function(){
    let len = this.value.length;
    

    if (len === 0) {
      $(this).css('border-color', '#2F96EF');
      changeText(pbText, 'NAME is blank', '#aaa');
    } else {
      $(this).css('border-color', '#2F96EF');
      changeText(pbText, '');
    } 
  });
  
  $('.input-4').keyup(function(){
    let len = this.value.length;


    if (len === 0) {
      $(this).css('border-color', '#2F96EF');
      changeText(pbText, 'Email is blank', '#aaa');
    } else {
      $(this).css('border-color', '#2F96EF');
      changeText(pbText, '');
    } 
  });
  
});
  


