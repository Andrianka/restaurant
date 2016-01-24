//= require jquery.ui.totop.js

$(document).ready ->
  $('#notifications').find('button').click 'on', ->
    $('.modal#notifications').removeClass 'in'
    return
  $('.bt-menu-trigger').click ->
    $('.bt-menu').toggleClass 'bt-menu-open'
    return
  $('.block1').mouseover ->
    $(this).addClass 'blur'
    return
  $('.block1').mouseout ->
    $(this).removeClass 'blur'
    return
  $().UItoTop easingType: 'easeOutQuart'
  return
