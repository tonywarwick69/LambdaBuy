(function ($) {
    /*----------------------
        LIQUID IMAGES
    ----------------------*/
    $('.liquid').imgLiquid();

    /*-----------------
        ACCORDION
    -----------------*/
    $('.accordion').xmaccordion({
        startOpen: 2,
        easing: 'swing',
        speed: 600
    });

    /*-------------------------
        BLOG VIEW SELECT
    -------------------------*/
    var $display = $('.display'),
        $previews = $display.children();

    $previews.bind('click', selectView);

    function selectView() {
        if ($(this).hasClass('selected')) return;

        var me = $(this),
            view = 'blog-post-preview';

        view += ' ' + me.attr('class');
        // remove 'selected' class on all items	
        clearSelection(me.parent().children());
        me.addClass('selected');
        me.parents().eq(3).find('.blog-post-preview').removeClass().addClass(view);
    }

    function clearSelection(items) {
        items.each(function () {
            $(this).removeClass('selected');
        });
    }

    /*---------------------
        SIDEBAR CONTROL
    ---------------------*/
    var $sidebarControl = $('.sidebar-control'),
        $shopSidebar = $('.shop-sidebar');

    $sidebarControl.bind('click', toggleShopSidebar);

    function toggleShopSidebar() {
        if ($shopSidebar.hasClass('open')) {
            // Desktop enable scroll
            $('body').removeClass('no-scroll');

            // Mobile enable scroll
            $('body').unbind('touchmove');

            // Close shop sidebar
            $shopSidebar.removeClass('open');
        } else {
            // Desktop disable scroll
            $('body').addClass('no-scroll');

            // Mobile disable scroll
            $('body').bind('touchmove', function (e) { e.preventDefault() });

            // Open shop sidebar
            $shopSidebar.addClass('open');
        }
    }

})(jQuery);