(function($) {
    // Remove no-js class from <html>
    $("html").removeClass("no-js");

    // Smooth scroll on header links
    $("header a").click(function(e) {
        if (!$(this).hasClass("no-scroll")) {
            e.preventDefault();
            var target = $(this).attr("href");
            var scrollTarget = $(target).offset().top;

            // Change this to set fixed scroll speed (700ms for example)
            $("html, body").animate({ scrollTop: scrollTarget + "px" }, 700);

            if ($("header").hasClass("active")) {
                $("header, body").removeClass("active");
            }
        }
    });

    // Scroll to top
    $("#to-top").click(function() {
        $("html, body").animate({ scrollTop: 0 }, 500);
    });

    // Scroll to next section from lead
    $("#lead-down span").click(function() {
        var nextSection = $("#lead").next().offset().top;
        $("html, body").animate({ scrollTop: nextSection + "px" }, 500);
    });

    // Experience Timeline
    $("#experience-timeline").each(function() {
        $this = $(this);
        $userContent = $this.children("div");

        $userContent.each(function() {
            $(this)
                .addClass("vtimeline-content")
                .wrap('<div class="vtimeline-point"><div class="vtimeline-block"></div></div>');
        });

        $this.find(".vtimeline-point").each(function() {
            $(this).prepend('<div class="vtimeline-icon"><i class="fa fa-map-marker"></i></div>');
        });

        $this.find(".vtimeline-content").each(function() {
            var date = $(this).data("date");
            if (date) {
                $(this).parent().prepend('<span class="vtimeline-date">' + date + "</span>");
            }
        });
    });

    // Mobile menu open
    $("#mobile-menu-open").click(function() {
        $("header, body").addClass("active");
    });

    // Mobile menu close
    $("#mobile-menu-close").click(function() {
        $("header, body").removeClass("active");
    });

    // View more projects
    $("#view-more-projects").click(function(e) {
        e.preventDefault();
        $(this).fadeOut(300, function() {
            $("#more-projects").fadeIn(300);
        });
    });

})(jQuery);
