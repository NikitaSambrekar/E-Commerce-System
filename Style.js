$(document).ready(function () {
    $(".container").hide().fadeIn(1000);
    $(".button").hover(function () {
        $(this).css("background", "#028A8A");
    }, function () {
        $(this).css("background", "#04BFBF");
    });
});
