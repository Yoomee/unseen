((function(){this.Mercury.Toolbar.ButtonGroup=function(){function a(a,b){return this.name=a,this.options=b!=null?b:{},this.build(),this.bindEvents(),this.regions=this.options._regions,this.element}return a.prototype.build=function(){this.element=jQuery("<div>",{"class":"mercury-button-group mercury-"+this.name+"-group"});if(this.options._context||this.options._regions)return this.element.addClass("disabled")},a.prototype.bindEvents=function(){var a=this;return Mercury.on("region:update",function(b,c){var d,e;d=Mercury.Toolbar.ButtonGroup.contexts[a.name];if(d&&c.region&&jQuery.type(c.region.currentElement)==="function")return e=c.region.currentElement(),e.length&&d.call(a,e,c.region.element)?a.element.removeClass("disabled"):a.element.addClass("disabled")}),Mercury.on("region:focused",function(b,c){if(a.regions&&c.region&&c.region.type){if(!(a.regions.indexOf(c.region.type)>-1))return a.element.addClass("disabled");if(!a.options._context)return a.element.removeClass("disabled")}}),Mercury.on("region:blurred",function(b,c){if(a.options.regions)return a.element.addClass("disabled")})},a}(),this.Mercury.Toolbar.ButtonGroup.contexts={table:function(a,b){return!!a.closest("table",b).length}}})).call(this);