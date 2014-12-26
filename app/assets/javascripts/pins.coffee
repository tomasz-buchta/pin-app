# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# onScroll = ->
#   #winHeight = window.innerHeight ? window.innerHeight : $window.height()
#   closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100)
#   if closeToBottom
#     $items = $('#tiles td')

InitWookmark = ->
  $handler = $('#tiles .post')
  $handler.wookmark({
    autoResize: true,
    container: $('#main'),
    offset: 5,
    outerOffset: 10,
    itemWidth: 210,
  })

ready = ->

  $('nav.pagination').hide()

  $("#tiles").infinitescroll
    navSelector: "nav.pagination"
    nextSelector: "nav.pagination a[rel=next]"
    itemSelector: "#tiles .post"
    loading:
      finished: InitWookmark
      finishedMsg: "The end"

  $handler = $('#tiles .post')

  InitWookmark()

  $handler.click(() ->
    newHeight = $('img', this).height() + Math.round(Math.random() * 300 + 30)
    $(this).css('height', newHeight+'px')
    # Update the layout.
    $handler.wookmark()
  )
$(document).ready(ready)
$(document).on('page:load',ready)