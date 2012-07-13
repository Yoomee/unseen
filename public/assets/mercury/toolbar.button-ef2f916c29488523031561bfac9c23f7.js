((function(){var a=Object.prototype.hasOwnProperty;this.Mercury.Toolbar.Button=function(){function b(a,b,c,d,e){return this.name=a,this.title=b,this.summary=c!=null?c:null,this.types=d!=null?d:{},this.options=e!=null?e:{},this.title&&(this.title=Mercury.I18n(this.title)),this.summary&&(this.summary=Mercury.I18n(this.summary)),this.build(),this.bindEvents(),this.element}return b.prototype.build=function(){var b,c,d,e,f,g;this.element=jQuery("<div>",{title:(e=this.summary)!=null?e:this.title,"class":"mercury-button mercury-"+this.name+"-button"}).html("<em>"+this.title+"</em>"),this.element.data("expander",'<div class="mercury-expander-button" data-button="'+this.name+'"><em></em><span>'+this.title+"</span></div>"),this.handled={},f=this.types,g=[];for(c in f){if(!a.call(f,c))continue;b=f[c];switch(c){case"preload":g.push(!0);break;case"regions":this.element.addClass("disabled"),g.push(this.handled[c]=jQuery.isFunction(b)?b.call(this,this.name):b);break;case"toggle":g.push(this.handled[c]=!0);break;case"mode":g.push(this.handled[c]=b===!0?this.name:b);break;case"context":g.push(this.handled[c]=jQuery.isFunction(b)?b:Mercury.Toolbar.Button.contexts[this.name]);break;case"palette":this.element.addClass("mercury-button-palette"),d=jQuery.isFunction(b)?b.call(this,this.name):b,g.push(this.handled[c]=new Mercury.Palette(d,this.name,this.defaultDialogOptions()));break;case"select":this.element.addClass("mercury-button-select").find("em").html(this.title),d=jQuery.isFunction(b)?b.call(this,this.name):b,g.push(this.handled[c]=new Mercury.Select(d,this.name,this.defaultDialogOptions()));break;case"panel":this.element.addClass("mercury-button-panel"),d=jQuery.isFunction(b)?b.call(this,this.name):b,this.handled.toggle=!0,g.push(this.handled[c]=new Mercury.Panel(d,this.name,this.defaultDialogOptions()));break;case"modal":g.push(this.handled[c]=jQuery.isFunction(b)?b.apply(this,this.name):b);break;case"lightview":g.push(this.handled[c]=jQuery.isFunction(b)?b.apply(this,this.name):b);break;default:throw Mercury.I18n('Unknown button type "%s" used for the "%s" button.',c,this.name)}}return g},b.prototype.bindEvents=function(){var b=this;return Mercury.on("button",function(a,c){if(c.action===b.name)return b.element.click()}),Mercury.on("mode",function(a,c){if(b.handled.mode===c.mode&&b.handled.toggle)return b.togglePressed()}),Mercury.on("region:update",function(a,c){var d;return b.handled.context&&c.region&&jQuery.type(c.region.currentElement)==="function"?(d=c.region.currentElement(),d.length&&b.handled.context.call(b,d,c.region.element)?b.element.addClass("active"):b.element.removeClass("active")):b.element.removeClass("active")}),Mercury.on("region:focused",function(a,c){if(b.handled.regions&&c.region&&c.region.type)return b.handled.regions.indexOf(c.region.type)>-1?b.element.removeClass("disabled"):b.element.addClass("disabled")}),Mercury.on("region:blurred",function(){if(b.handled.regions)return b.element.addClass("disabled")}),this.element.on("mousedown",function(){return b.element.addClass("active")}),this.element.on("mouseup",function(){return b.element.removeClass("active")}),this.element.on("click",function(c){var d,e,f,g;if(b.element.closest(".disabled").length)return;d=!1,g=b.handled;for(f in g){if(!a.call(g,f))continue;e=g[f];switch(f){case"toggle":b.handled.mode||b.togglePressed();break;case"mode":d=!0,Mercury.trigger("mode",{mode:e});break;case"modal":d=!0,Mercury.modal(b.handled.modal,{title:b.summary||b.title,handler:b.name});break;case"lightview":d=!0,Mercury.lightview(b.handled.lightview,{title:b.summary||b.title,handler:b.name,closeButton:!0});break;case"palette":case"select":case"panel":c.stopPropagation(),d=!0,b.handled[f].toggle()}}d||Mercury.trigger("action",{action:b.name});if(b.options.regions&&b.options.regions.length)return Mercury.trigger("focus:frame")})},b.prototype.defaultDialogOptions=function(){return{title:this.summary||this.title,preload:this.types.preload,appendTo:this.options.appendDialogsTo||"body",closeButton:!0,"for":this.element}},b.prototype.togglePressed=function(){return this.element.toggleClass("pressed")},b}(),this.Mercury.Toolbar.Button.contexts={backColor:function(a){return this.element.css("background-color",a.css("background-color"))},foreColor:function(a){return this.element.css("background-color",a.css("color"))},bold:function(a){var b;return b=a.css("font-weight"),b==="bold"||b>400},italic:function(a){return a.css("font-style")==="italic"},overline:function(a){var b,c,d,e;if(a.css("text-decoration")==="overline")return!0;e=a.parentsUntil(this.element);for(c=0,d=e.length;c<d;c++){b=e[c];if(jQuery(b).css("text-decoration")==="overline")return!0}return!1},strikethrough:function(a,b){return a.css("text-decoration")==="line-through"||!!a.closest("strike",b).length},underline:function(a,b){return a.css("text-decoration")==="underline"||!!a.closest("u",b).length},subscript:function(a,b){return!!a.closest("sub",b).length},superscript:function(a,b){return!!a.closest("sup",b).length},justifyLeft:function(a){return a.css("text-align").indexOf("left")>-1},justifyCenter:function(a){return a.css("text-align").indexOf("center")>-1},justifyRight:function(a){return a.css("text-align").indexOf("right")>-1},justifyFull:function(a){return a.css("text-align").indexOf("justify")>-1},insertOrderedList:function(a,b){return!!a.closest("ol",b.element).length},insertUnorderedList:function(a,b){return!!a.closest("ul",b.element).length}}})).call(this);