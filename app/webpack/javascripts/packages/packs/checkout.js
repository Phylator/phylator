document.addEventListener( 'modalist:render', () => {
    if (document.querySelector('.modalist--content-body.packs.checkout')) {
        let stripe = Stripe(stripePublishableKey),
            elements = stripe.elements(),
            style = {
                base: {
                    color: '#FFFFFF',
                    background: '#1B2936',
                    lineHeight: '18px',
                    fontFamily: '"Inter UI", sans-serif',
                    fontSmoothing: 'antialiased',
                    fontSize: '16px',
                    '::placeholder': {
                        color: '#8899A6'
                    }
                },
                invalid: {
                    color: '#f6809a',
                    iconColor: '#f6809a'
                }
            },
            card = elements.create( 'card', { style: style } ),
            form = document.querySelector('.modalist--content-body.users.payment_methods.edit form'),
            hiddenInput = form.querySelector('input[name="stripeToken"]');

        card.mount('#card-element');

        form.addEventListener( 'submit', function(event) {
            if (!hiddenInput.value) {
                event.preventDefault();
                stripe.createToken(card).then(function(result) {
                    hiddenInput.value = result.token.id;
                    Rails.fire( form, 'submit' );
                });
                return false;
            }
        });
    }
})
