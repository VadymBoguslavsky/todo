// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js
//= require jquery
//= require best_in_place
//= require best_in_place.jquery-ui
//= require turbolinks
/*
 SortTable
 version 2
 7th April 2007
 Stuart Langridge, http://www.kryogenix.org/code/browser/sorttable/

 Instructions:
 Download this file
 Add <script src="sorttable.js"></script> to your HTML
 Add class="sortable" to any table you'd like to make sortable
 Click on the headers to sort

 Thanks to many, many people for contributions and suggestions.
 Licenced as X11: http://www.kryogenix.org/code/browser/licence.html
 This basically means: do what you want with it.
 */
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require turbolinks
//= require_tree .

$(document).ready(function () {
  jQuery(".best_in_place").best_in_place();
});

$(function () {
  $("#tasks th a, #tasks .pagination a").live("click", function () {
    $.getScript(this.href);
    return false;
  });
  $("my-submit-btn").keyup(function () {
    $.get($("#tasks_search").attr("action"), $("#tasks_search").serialize(), null, "script");
    return false;
  });
  $('#form1, form2').submit(function () {
    $.get(this.action, $(this).serialize(), null, 'script');
    return false;
  });
});
function check() {
  var check = $('#form1').find('input');
  for (var i = 0; i < check.length; i++) {
    if (check[i].type == 'checkbox') {
      if (('#form1 input:checkbox:checked').length > 0) {
        $("#but_disabled1").removeAttr("disabled")
      }
      check[i].checked = true;
    }
  }
}
function uncheck() {
  var uncheck = $('#form1').find('input');
  for (var i = 0; i < uncheck.length; i++) {
    if (uncheck[i].type == 'checkbox') {
      $("#but_disabled1").attr("disabled", "disabled");
      uncheck[i].checked = false;
    }
  }
}

function check1() {
  var check = $('#form2').find('input');
  for (var i = 0; i < check.length; i++) {
    if (check[i].type == 'checkbox') {
      if (('#form2 input:checkbox:checked').length > 0) {
        $("#but_disabled2").removeAttr("disabled")
      }
      check[i].checked = true;
    }
  }
}
function uncheck1() {
  var uncheck = $('#form2').find('input');
  for (var i = 0; i < uncheck.length; i++) {
    if (uncheck[i].type == 'checkbox') {
      $("#but_disabled2").attr("disabled", "disabled");
      uncheck[i].checked = false;
    }
  }
}

$(document).on("turbolinks:load", function () {
  $('#form1 input:checkbox').change(function () {
    if ($('#form1 input:checkbox:checked').length > 0) {
      $("#but_disabled1").removeAttr("disabled");
    } else {
      $("#but_disabled1").attr("disabled", "disabled");
    }
  });
  $('#form2 input:checkbox').change(function () {
    if ($('#form2 input:checkbox:checked').length > 0) {
      $("#but_disabled2").removeAttr("disabled");
    } else {
      $("#but_disabled2").attr("disabled", "disabled");
    }
  });
});