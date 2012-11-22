jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).outerHeight() - this.outerHeight()) / 2) + 
                                                $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).outerWidth() - this.outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    return this;
}


		
