$(document).ready(function(){
  // add navigation element
  var $nav = $('\
    <ul><li><a href="index.html">Now</a></li>\
    <li><a href="button.html">Button</a></li>\
    <li><a href="g18.html">Next</a></li></ul>');
  $('#nav').append($nav);

  $('#bio').accordion();

  // hightlighting nav elements
  $('#nav').find('a').on('mouseenter', function(){
    $(this).toggleClass('navHighlight');
  })
  $('#nav').find('a').on('mouseleave', function(){
    $(this).toggleClass('navHighlight');
  })

  // hightlighting header elements
  $('h3').on('mouseenter', function(){
    $(this).toggleClass('highlight');
  })
  $('h3').on('mouseleave', function(){
    $(this).toggleClass('highlight');
  })

  // button pushing
  $('button').on('click', function(){
    $(this).toggle("explode");
    $('h3').text('There was a button');
  })
});
