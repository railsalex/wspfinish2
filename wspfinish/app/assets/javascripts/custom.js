$(function(){
  $(".images-button").click(function(){
    var all_images = $("#all-images");//选择包含所有图片的ul
    var width = 963;//图片单位移动距离
    var num = $(this).text() - 1;//移动多少个单位

    all_images.animate({ left : -num*width },"slow");
  });
});