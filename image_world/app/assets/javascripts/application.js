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
//= require_tree .
//= require rails.validations
//= require rails.validations.simple_form
//= require jquery_nested_form
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.datepicker

/*
 * Chained - jQuery non AJAX(J) chained selects plugin
 *
 * Copyright (c) 2010-2013 Mika Tuupola
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Project home:
 *   http://www.appelsiini.net/projects/lazyload
 *
 * Version:  0.9.4
 *
 */

/*
$(function() {
  $("input.date_picker").datepicker({ dateFormat: "yy/mm/dd" });
});
*/

function leftItemSelected(event) {
	$(".left_link").removeClass("selected");
	$("#" + event.srcElement.id).addClass("selected");
}

function modifyForms()
{
	$("input").addClass("image_world form field input");
	$("select").addClass("image_world form field input");
	$(".container.form.submit").find("input:first").addClass("submit");
}

jQuery(document).ready(function() {
	//$("body *").addClass("image_world");
	modifyForms();
});