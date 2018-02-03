import $ from 'jquery';

export function init(publishable_key) {

    var stripe = Stripe(publishable_key),
        elements = stripe.elements();

    // Custom styling can be passed to options when creating an Element.
    // (Note that this demo uses a wider set of styles than the guide below.)
    var style = {
        base: {
            color: '#fff',
            fontFamily: 'brandon-grotesque, -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
                color: '#9297a7'
            }
        },
            invalid: {
            color: '#f19882',
            iconColor: '#f19882'
        }
    };

    // Create an instance of the card Element
    var card = elements.create( 'card', { style: style } );

    // Add an instance of the card Element into the `card-element` <div>
    card.mount('#card-element');

    // Handle real-time validation errors from the card Element.
    card.addEventListener( 'change', function(event) {
        var displayError = $('#card-errors');
        if (event.error) {
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    });

    // Handle form submission
    var form = $('form#purchase-form');
    form.submit(function(event) {
        event.preventDefault();

        $('.modal.buy .modal-content-wrapper').fadeOut( 250, function() {
            $('.modal.buy .modal-loader-wrapper').hide().removeClass('hidden').fadeIn(250);

            var options = {
                name: document.getElementById('name').value
            };

            stripe.createToken(card, options).then(function(result) {
                if (result.error) {
                    // Inform the user if there was an error
                    var errorElement = $('#card-errors');
                    errorElement.textContent = result.error.message;

                    $('.modal.buy .modal-loader-wrapper').fadeOut( 250, function() {
                        $('.modal.buy .modal-content-wrapper').fadeIn(250);
                    });
                } else {
                    // Send the token to your server
                    $('form#purchase input#token').val(result.token['id']);
                    $('form#purchase-form').addClass('hidden');
                    $('.modal.buy .modal-content-wrapper > h2').addClass('hidden');
                    $('form#purchase .wrapper').removeClass('hidden');
                    $('form#purchase input#receipt_email').val(document.getElementById('receipt_email').value);

                    $('.modal.buy .modal-loader-wrapper').fadeOut( 250, function() {
                        $('.modal.buy .modal-content-wrapper').fadeIn(250);
                    });
                }
            });
        });
    });

};
