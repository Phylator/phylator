document.addEventListener( 'turbolinks:load', function() {
    calculationsFormRemoveMeasurement();
});



function calculationsFormRemoveMeasurement() {
    $('a.removeMeasurement').click(function() {
        var el = $(this);
        el.closest('input[type="hidden"]').value = '1';
        el.parent().hide();
    });
};

function calculationsFormAddMeasurement(el, association, content) {
    var new_id = new Date().getTime(),
        regexp = new RegExp('new_' + association, 'g');
    el.before(content.replace(regexp, new_id));
    calculationsFormRemoveMeasurement();
    flexdatalistInit();
};
