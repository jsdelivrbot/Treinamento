!function(e){"use strict";e(["jquery"],function(e){function t(t){return e.isFunction(t)||e.isPlainObject(t)?t:{top:t,left:t}}var n=e.scrollTo=function(t,n,o){return e(window).scrollTo(t,n,o)};return n.defaults={axis:"xy",duration:0,limit:!0},n.window=function(){return e(window)._scrollable()},e.fn._scrollable=function(){return this.map(function(){var t=this,n=!t.nodeName||-1!=e.inArray(t.nodeName.toLowerCase(),["iframe","#document","html","body"]);if(!n)return t;var o=(t.contentWindow||t).document||t.ownerDocument||t;return/webkit/i.test(navigator.userAgent)||"BackCompat"==o.compatMode?o.body:o.documentElement})},e.fn.scrollTo=function(o,i,r){return"object"==typeof i&&(r=i,i=0),"function"==typeof r&&(r={onAfter:r}),"max"==o&&(o=9e9),r=e.extend({},n.defaults,r),i=i||r.duration,r.queue=r.queue&&r.axis.length>1,r.queue&&(i/=2),r.offset=t(r.offset),r.over=t(r.over),this._scrollable().each(function(){function s(e){f.animate(l,i,r.easing,e&&function(){e.call(this,c,r)})}if(null!=o){var u,a=this,f=e(a),c=o,l={},d=f.is("html,body");switch(typeof c){case"number":case"string":if(/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(c)){c=t(c);break}if(c=d?e(c):e(c,this),!c.length)return;case"object":(c.is||c.style)&&(u=(c=e(c)).offset())}var m=e.isFunction(r.offset)&&r.offset(a,c)||r.offset;e.each(r.axis.split(""),function(e,t){var o="x"==t?"Left":"Top",i=o.toLowerCase(),h="scroll"+o,p=a[h],w=n.max(a,t);if(u)l[h]=u[i]+(d?0:p-f.offset()[i]),r.margin&&(l[h]-=parseInt(c.css("margin"+o))||0,l[h]-=parseInt(c.css("border"+o+"Width"))||0),l[h]+=m[i]||0,r.over[i]&&(l[h]+=c["x"==t?"width":"height"]()*r.over[i]);else{var y=c[i];l[h]=y.slice&&"%"==y.slice(-1)?parseFloat(y)/100*w:y}r.limit&&/^\d+$/.test(l[h])&&(l[h]=l[h]<=0?0:Math.min(l[h],w)),!e&&r.queue&&(p!=l[h]&&s(r.onAfterFirst),delete l[h])}),s(r.onAfter)}}).end()},n.max=function(t,n){var o="x"==n?"Width":"Height",i="scroll"+o;if(!e(t).is("html,body"))return t[i]-e(t)[o.toLowerCase()]();var r="client"+o,s=t.ownerDocument.documentElement,u=t.ownerDocument.body;return Math.max(s[i],u[i])-Math.min(s[r],u[r])},n})}("function"==typeof define&&define.amd?define:function(e,t){"undefined"!=typeof module&&module.exports?module.exports=t(require("jquery")):t(jQuery)});