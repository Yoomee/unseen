#  This is a manifest file that'll be compiled into including all the files listed below.
#  Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
#  be included in the compiled file accessible from http://example.com/assets/application.js
#  It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#  the compiled file.
# 
#= require jquery
#= require jquery_ujs
#= require ym_core
#= require ym_cms
#= require mercury
#= require_tree .

window.YmCms.Page.Form.showSlideshowTab = () ->
  if ($('#page_view_name').val() == "gallery")
    $('.tabbable .nav li').has("a[href='#slideshow']").show()
  else
    $('.tabbable .nav li').has("a[href='#slideshow']").hide()

FairPage =
  init: () ->
    $('.scroll_to_fair_box').click (event) ->
      event.preventDefault()
      fairBoxId = `$(this).data('fair-box-id')`
      $.scrollTo($("#fair_box_#{fairBoxId}"), 500)

$(document).ready ->
  YmCms.Page.Form.showSlideshowTab()
  FairPage.init()
  $('#page_view_name').change =>
    YmCms.Page.Form.showSlideshowTab()