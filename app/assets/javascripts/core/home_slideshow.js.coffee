window.HomeSlideshow =
  slideWidth: 980,
  init: (options) ->
    options = {} if options == undefined
    if $('div.home-slideshow .home-slide').length > 1
      HomeSlideshow.slideWidth = $('div.home-slideshow .home-slide').outerWidth(true)
      $('div.home-slideshow div.home-slideshow-inner').css('width', HomeSlideshow.slideWidth * $('div.home-slideshow .home-slide').length)
      HomeSlideshow.showCaption()
      # for auto scrolling
      HomeSlideshow.intervalTime = options.interval
      HomeSlideshow.resetInterval()
      $('div.home-slideshow .home-slide-next').live 'click', (event) ->
        event.preventDefault()
        HomeSlideshow.nextSlide(1)
      $('div.home-slideshow .home-slide-prev').live 'click', (event) ->
        event.preventDefault()
        HomeSlideshow.prevSlide(1)
      $('div.dot').live 'click', (event) ->
        event.preventDefault()
        targetSlideNum = $(this).data('slide-num')
        activeSlideNum = $('.home-slide-active').data('slide-num')
        if targetSlideNum < activeSlideNum
          HomeSlideshow.prevSlide(activeSlideNum - targetSlideNum)
        else if targetSlideNum > activeSlideNum
          HomeSlideshow.nextSlide(targetSlideNum - activeSlideNum)
        
        
    $(window).resize ->
      HomeSlideshow.reAlign()
    HomeSlideshow.reAlign()
  reAlign: () ->
    leftPos = ($(window).width() - HomeSlideshow.slideWidth)/2
    leftPos = 0 if leftPos < 0
    $('.home-slideshow .home-slide').css('left', leftPos)
  resetInterval: () ->
    if HomeSlideshow.intervalTime != undefined
      if HomeSlideshow.interval != undefined
        window.clearInterval(HomeSlideshow.interval)
      HomeSlideshow.interval = window.setInterval("HomeSlideshow.nextSlide(1)", HomeSlideshow.intervalTime)
  nextSlide: (numTimes) ->
    duration = 500/numTimes
    HomeSlideshow.hideCaption()
    nextSlide = $('div.home-slideshow .home-slide-next')
    nextSlide.next().addClass('home-slide-next')
    activeSlide = $('div.home-slideshow .home-slide-active')
    activeSlide.animate {opacity: 0.4}, duration, ->
      $(this).removeClass('home-slide-active').addClass('home-slide-prev')
    nextSlide.animate {opacity: 1}, duration, ->
      $(this).removeClass('home-slide-next').addClass('home-slide-active')      
    if numTimes == 1
      easing = 'swing'
    else
      easing = 'linear'
    $('div.home-slideshow div.home-slideshow-inner').animate {left: "-=#{HomeSlideshow.slideWidth}"}, duration, easing, ->
      prevSlide = $('div.home-slideshow .home-slide:first').removeClass('home-slide-prev')
      $('div.home-slideshow div.home-slideshow-inner').css('left', HomeSlideshow.slideWidth*-1).append(prevSlide.detach())
      $($('div.home-slideshow .home-slide')[2]).addClass('home-slide-next')
      if numTimes == 1
        HomeSlideshow.showCaption()
        HomeSlideshow.resetInterval()
      else
        HomeSlideshow.nextSlide(numTimes - 1)
  prevSlide: (numTimes) ->
    duration = 500/numTimes
    HomeSlideshow.hideCaption()    
    prevSlide = $('div.home-slideshow .home-slide-prev')
    activeSlide = $('div.home-slideshow .home-slide-active')
    nextSlide = $('div.home-slideshow .home-slide-next')
    lastSlide = $('div.home-slideshow .home-slide:last').addClass('home-slide-prev')
    $('div.home-slideshow div.home-slideshow-inner').css('left', HomeSlideshow.slideWidth*-2).prepend(lastSlide.detach())
    prevSlide.animate {opacity: 1}, duration, ->     
      prevSlide.removeClass('home-slide-prev').addClass('home-slide-active')
    activeSlide.animate {opacity: 0.4}, duration, ->
      nextSlide.removeClass('home-slide-next')
      $(this).removeClass('home-slide-active').addClass('home-slide-next')
    if numTimes == 1
      easing = 'swing'
    else
      easing = 'linear'      
    $('div.home-slideshow div.home-slideshow-inner').animate {left: "+=#{HomeSlideshow.slideWidth}"}, duration, easing, ->
      if numTimes == 1
        HomeSlideshow.showCaption()      
        HomeSlideshow.resetInterval()
      else
        HomeSlideshow.prevSlide(numTimes - 1)
  hideCaption: () ->
    $('#home-slideshow-caption .home-slide-caption').fadeOut(200)
  showCaption: () ->
    caption_html = $('div.home-slideshow .home-slide-active .home-slide-caption').clone()
    $('#home-slideshow-caption').html(caption_html)
    $('#home-slideshow-caption .home-slide-caption').fadeIn(200)
#       
# init: (options) ->
#   options = {} if options == undefined
#   if $('div.home-slideshow .home-slide').length > 1
#     YmCms.Slideshow.slideWidth = $('div.slideshow .slide').outerWidth(true)
#     $('div.slideshow div.slideshow_inner').css('width', YmCms.Slideshow.slideWidth * $('div.slideshow .slide').length)
#     # for auto scrolling
#     YmCms.Slideshow.intervalTime = options.interval
#     YmCms.Slideshow.resetInterval()
#     $('.slide-nav').click (event) ->
#       event.preventDefault()
#       YmCms.Slideshow.nextSlide()
#     $('div.slideshow .slide').click (event) ->
#       event.preventDefault()
#       YmCms.Slideshow.nextSlide()
#     $('div.slideshow .slide img:first').load ->  
#       $('.slideshow_container').css('height', `$(this).height()`)
#   $(window).resize ->
#     YmCms.Slideshow.reAlign()
#   YmCms.Slideshow.reAlign()
# reAlign: () ->
#   leftPos = ($(window).width() - 940)/2
#   leftPos = 0 if leftPos < 0
#   $('.slideshow .slide_inner').css('left', leftPos)
# resetInterval: () ->
#   if YmCms.Slideshow.intervalTime != undefined
#     if YmCms.Slideshow.interval != undefined
#       window.clearInterval(YmCms.Slideshow.interval)
#     YmCms.Slideshow.interval = window.setInterval("YmCms.Slideshow.nextSlide()", YmCms.Slideshow.intervalTime)
# nextSlide: () ->
#   $('div.slideshow .slide').removeClass("next_slide")
#   if $('div.slideshow .slide').length > 2
#     $($('div.slideshow .slide')[2]).addClass("next_slide")
#   currentHeight = $('.slideshow_container').height()
#   nextSlideHeight = $($('div.slideshow .slide img')[1]).height();
#   if currentHeight < nextSlideHeight
#     $('.slideshow_container').animate {height: "+=#{nextSlideHeight-currentHeight}"}, 500
#   else
#     $('.slideshow_container').animate {height: "-=#{currentHeight-nextSlideHeight}"}, 500
#   $('div.slideshow div.slideshow_inner').animate {left: "-=#{YmCms.Slideshow.slideWidth}"}, 500, ->
#     currentSlide = $('div.slideshow .slide:first')
#     if $('div.slideshow .slide').length <= 2
#       currentSlide.addClass("next_slide")
#     $.scrollTo currentSlide, 500
#     $('div.slideshow div.slideshow_inner').append(currentSlide.detach()).css('left', 0)
#     YmCms.Slideshow.resetInterval()