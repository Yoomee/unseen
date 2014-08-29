/**
 * author Remy Sharp
 * url http://remysharp.com/2009/01/26/element-in-view-event-plugin/
 */
(function(a){function b(){var b=window.innerHeight,c=document.compatMode;if(c||!a.support.boxModel)b=c=="CSS1Compat"?document.documentElement.clientHeight:document.body.clientHeight;return b}a(window).scroll(function(){var c=b(),d=document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop,e=[];a.each(a.cache,function(){this.events&&this.events.inview&&e.push(this.handle.elem)}),e.length&&a(e).each(function(){var b=a(this),e=b.offset().top,f=b.height(),g=b.data("inview")||!1;d>e+f||d+c<e?g&&(b.data("inview",!1),b.trigger("inview",[!1])):d<e+f&&(g||(b.data("inview",!0),b.trigger("inview",[!0])))})}),a(function(){a(window).scroll()})})(jQuery);