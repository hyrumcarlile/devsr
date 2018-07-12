/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Show an element
$(document).ready(function(){
    var show = function (elem) {
        elem.style.display = 'block';
    };

    // Hide an element
    var hide = function (elem) {
        elem.style.display = 'none';
    };

    // Toggle element visibility
    var toggle = function (elem) {

    // If the element is visible, hide it
    if (window.getComputedStyle(elem).display === 'block') {
        hide(elem);
        return;
    }

    // Otherwise, show it
    show(elem);

    };

    function toggleResponses() {
        console.log('clicked');
        $('#showResponses').toggle();
        $('#hideResponses').toggle();
        $('#disqus_thresd').toggle();
    }

    $('#showResponses').on("click", function(){
        toggleResponses();
    });
})