$(function () {
    $(document).on('click', '.ajax', function (e) {
        e.preventDefault();
        $.get($(this).attr('href'));
    });
});