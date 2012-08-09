#  This is a manifest file that'll be compiled into including all the files listed below.
#  Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
#  be included in the compiled file accessible from http://example.com/assets/application.js
#  It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#  the compiled file.
# 
#= require jquery
#= require jquery_ujs
#= require ym_core
#= require ym_cms_override
#= require ym_posts
#= require ym_tags
#= require ym_links
#= require cocoon
#= require maps
#= require_tree ./core

window.YmCms.Page.Form.showSlideshowTab = () ->
  if ($.inArray($('#page_view_name').val(), ["gallery", "persona_page"]) > -1) || $('#page_slug').val() == "amsterdam"
    $('.tabbable .nav li').has("a[href='#slideshow']").show()
  else
    $('.tabbable .nav li').has("a[href='#slideshow']").hide()

FairPage =
  init: () ->
    $('.scroll_to_fair_box').click (event) ->
      event.preventDefault()
      fairBoxId = `$(this).data('fair-box-id')`
      $.scrollTo($("#fair_box_#{fairBoxId}"), 500)

ToggleViewLinks = 
  init: () ->
    $('.toggle-view-links a').tooltip
      placement: 'right',
      delay: {show: 1000, hide: 0}

$(document).ready ->
  YmCms.Page.Form.showSlideshowTab()
  FairPage.init()
  $('#page_view_name').change =>
    YmCms.Page.Form.showSlideshowTab()
  $('#email').focus =>
    $('#email').val('') if $('#email').val() is 'email'
  $("select[multiple='multiple']:not(.no-chosen)").chosen(
    persistent_create_option: false,
    create_option_text: "Add",
    create_option: (term) ->
      this.append_option(
        value: term,
        text: term
      )
  )
  $('a.add-to-program, #meet-people a').tooltip({placement:'bottom'})
  $('a.add-to-program').live 'ajax:beforeSend', (event) =>
    $(event.target).tooltip('hide')
    $(".add-to-program[data-event-id='#{$(event.target).data('event-id')}']").addClass('loading')
  $('a.favourite-btn, a.add-to-collection').live 'ajax:beforeSend', (event) =>
    $(event.target).tooltip('hide').addClass('loading')
  $('a.people-tag').live 'ajax:beforeSend', (event) =>
    $(this).addClass('active')
    $('#people').addClass('loading')
  $('.tooltip-bottom').tooltip({placement:'bottom'})
  $('.tooltip-bottom-white').tooltip({placement:'bottom'}).live 'mouseenter', (event) =>
    $('.tooltip').addClass('tooltip-white')
  # ToggleViewLinks.init()
