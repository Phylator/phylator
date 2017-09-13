document.addEventListener( 'turbolinks:load', function() {
    calculationsNewInit();
    calculationsNewMarginOfErrorInit();
});



function calculationsNewInit() {

    function calculationsNewToggleContent() {
        if ( $('form > .quantity').is(':visible') ) {
            $('form > .quantity').fadeToggle(250);
            $('form > .unit').fadeToggle( 250, function() {
                $('p.setup').toggleClass('invisible');
                $('.measurements').toggleClass('content-disabled');
            });
        } else {
            $('p.setup').toggleClass('invisible');
            $('.measurements').toggleClass('content-disabled');
            setTimeout(function() {
                $('form > .quantity').fadeToggle(250);
                $('form > .unit').fadeToggle(250);
            }, 250);
        };
    };

    $('input#quantityUnits').on( 'select:flexdatalist', function(event, object, options) {
        var unitName = object['name'],
            quantityId = $('input#quantity').flexdatalist('value');
        $.getJSON( '/quantities.json?locale=' + $('html').attr('lang'), { get_param: 'value' }, function(data) {
            var quantity = $.grep( data, function(e) { return e.id == quantityId; }),
                quantityName = quantity[0].name;
            $('p.setup span.quantity').html(quantityName);
            $('p.setup span.unit').html(unitName);
            calculationsNewToggleContent();
        });
    });
    $('p.setup').click(function() {
        calculationsNewToggleContent();
    });

};

function calculationsNewMarginOfErrorInit() {
    $('p.margin-of-error').click(function() {
        $(this).toggle();
        var el = $(this).parent().find('.calculation_measurements_margin_of_error');
        el.toggleClass('hide');
        if ( !el.hasClass('hide') )
            el.find('input').focus();
    });
};
