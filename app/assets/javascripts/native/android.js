// Use this file to require your platform specific javascript.
//
//= require_tree ./android
//= require nativeScale

document.addEventListener( 'turbolinks:load', function() {
    nativeScale();
});
