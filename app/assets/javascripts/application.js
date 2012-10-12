// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// Loads all Bootstrap javascripts
//= require bootstrap


$(function() {
    $("#items th a").live("click", function() {
        $.getScript(this.href);
        return false;
    });
    $("#items_search input").keyup(function() {
        // alert('searchval = '+$("#search_keyword").val());
        $.get($("#items_search").attr("action"), $("#search_keyword").serialize(), null, "script");
        return false;
    });
    /*$(window).load(function () {
     $.get($("#items_search").attr("action"), $("#items_search").serialize(), null, "script");
     return false;
     });*/
});
