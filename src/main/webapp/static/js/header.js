(function ($) {
    /*----------------------
        WESTEROS DROPDOWN
    ----------------------*/
    var $dropdownControl = $('.westeros-dropdown-control'),
        $dropdownOptions = $('.westeros-dropdown').children('li');

    $dropdownControl.bind('click', slideToggle);
    $dropdownOptions.bind('click', selectOption);

    function slideToggle() {
        var $me = $(this),
            dropdown = $me.parents().eq(1).find('.westeros-dropdown');

        if (dropdown.hasClass('open')) {
            hideDropdown(dropdown);
        } else {
            showDropdown(dropdown);
        }

    }

    function hideDropdown(dropdown) {
        dropdown
            .animate({
                opacity: 0,
                top: '-=20',
                height: 'toggle'
            }, 300);

        dropdown.removeClass('open');
    }

    function showDropdown(dropdown) {
        dropdown
            .animate({
                opacity: 1,
                top: '+=20',
                height: 'toggle'
            }, 300);

        dropdown.addClass('open');
    }

    function selectOption() {
        var $me = $(this),
            dropdown = $me.parent();

        if ($me.hasClass('selected')) return;

        unselectOptions(dropdown);

        // select option
        $me.addClass('selected');
        $me.parents().eq(1).find('p').children('span').text($me.text());

        autoHideDropdown(dropdown);
    }

    function unselectOptions(dropdown) {
        dropdown.children().each(function () {
            $(this).removeClass('selected');
        });
    }

    function autoHideDropdown(dropdown) {
        if (dropdown.hasClass('hide-on-click')) {
            hideDropdown(dropdown);
        }
    }

})(jQuery);