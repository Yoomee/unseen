/*!
 * jQuery.LocalScroll
 * Copyright (c) 2007-2013 Ariel Flesler - aflesler<a>gmail<d>com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * http://flesler.blogspot.com/2007/10/jquerylocalscroll-10.html
 * @author Ariel Flesler
 * @version 1.2.9
 */
(function(a){function d(b,c,d){var e=c.hash.slice(1),f=document.getElementById(e)||document.getElementsByName(e)[0];if(!f)return;b&&b.preventDefault();var g=a(d.target);if(d.lock&&g.is(":animated")||d.onBefore&&d.onBefore(b,f,g)===!1)return;d.stop&&g._scrollable().stop(!0);if(d.hash){var h=d.offset;h=h&&h.top||h||0;var i=f.id==e?"id":"name",j=a("<a> </a>").attr(i,e).css({position:"absolute",top:a(window).scrollTop()+h,left:a(window).scrollLeft()});f[i]="",a("body").prepend(j),location=c.hash,j.remove(),f[i]=e}g.scrollTo(f,d).trigger("notify.serialScroll",[f])}var b=location.href.replace(/#.*/,""),c=a.localScroll=function(b){a("body").localScroll(b)};c.defaults={duration:1e3,axis:"y",event:"click",stop:!0,target:window},a.fn.localScroll=function(e){function f(){return!!this.href&&!!this.hash&&this.href.replace(this.hash,"")==b&&(!e.filter||a(this).is(e.filter))}return e=a.extend({},c.defaults,e),e.hash&&location.hash&&(e.target&&window.scrollTo(0,0),d(0,location,e)),e.lazy?this.bind(e.event,function(b){var c=a([b.target,b.target.parentNode]).filter(f)[0];c&&d(b,c,e)}):this.find("a,area").filter(f).bind(e.event,function(a){d(a,this,e)}).end().end()},c.hash=function(){}})(jQuery);