
function makeTabActive() {
    var url = window.location.href;
    var indexof = url.indexOf("#");

    if (indexof > 0) {
        var activeTab = url.substring(indexof + 1);
        if (typeof activeTab != 'undefined' && activeTab != '' && activeTab != '#') {
            // to dispaly give tab content
            jQuery(".tab-pane").removeClass("active in show");
            jQuery("#" + activeTab).addClass("active in show")
            // to make active given tab
            jQuery(".nav-tabs li a").removeClass("active");
            jQuery(".nav-tabs li a[href='#" + activeTab + "']").addClass("active");
        }
    }
}

AOS.init({
    duration: 1000,
    offset: 120,
    easing: 'ease-in-out'
});

$(document).ready(function() {
    var owl = $('.choose_us_section .owl-carousel');
    owl.owlCarousel({
        margin: 30,
        nav: true,
        loop: true,
        dots: false,
        autoplay: true,
        autoplayTimeout: 4500,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            }
        }
    });

    var owl = $('.team_member_section .owl-carousel');
    owl.owlCarousel({
        margin: 30,
        nav: true,
        loop: true,
        dots: false,
        autoplay: true,
        autoplayTimeout: 4500,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 3
            }
        }
    });

    var owl = $('.our_news_section .owl-carousel');
    owl.owlCarousel({
        margin: 30,
        nav: true,
        loop: true,
        dots: false,
        autoplay: true,
        autoplayTimeout: 4500,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            992: {
                items: 3
            }
        }
    });

    var owl = $('.testimonials_section .owl-carousel');
    owl.owlCarousel({
        margin: 30,
        nav: true,
        loop: true,
        dots: false,
        autoplay: true,
        autoplayTimeout: 4500,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });

    var owl = $('.provide_section .owl-carousel');
    owl.owlCarousel({
        margin: 30,
        nav: true,
        loop: true,
        dots: false,
        autoplay: true,
        autoplayTimeout: 4500,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            }
        }
    });

    $('.counter').each(function () {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 4000,
            easing: 'swing',
            
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });

    var form = "#contact-form";
    $(form).on('submit', function(e) {
        e.preventDefault();
        var recaptcha_response = grecaptcha.getResponse();
        if (!recaptcha_response) {
            $.notify(
                'El captcha es requerido', 
                { className: 'error' }
            );
        } else {
            jQuery(form+' [name="btnsubmit"]').prop('disabled', true);
            jQuery.ajax({
                url: e.currentTarget.action,
                type: 'post',
                data: $(form).serialize() + '&recaptcha_response=' + recaptcha_response,
                dataType: 'json',
                timeout: 60000,
                success: function(response) {
                    jQuery(form+' [name="btnsubmit"]').prop('disabled', false);
                    if(response.status=='500'){
                        grecaptcha.reset();
                        $.notify(
                            response.message, 
                            { className: 'error' }
                        );
                    }
                    if(response.status=='200'){
                        $(form).trigger("reset");
                        grecaptcha.reset();
                        $.notify(
                            response.message, 
                            { className: 'success' }
                        );
                    }
                }
            });
        }
    });
});
