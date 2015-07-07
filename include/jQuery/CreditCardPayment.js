        function validateCreditCardPayment() {
                // validate signup form on keyup and submit
                // $("#expiryDate").datepicker({ dateFormat: "mm/yy", constrainInput: true, minDate: new Date() });
                $("#paymentForm").validate({
                        rules: {
                                nameOnCard:  "required",
                                typeOfCard:  "required",
                                cardNumber:  "required",
                                expiryMonth: "required",
                                expiryYear:  "required",
                                ccv: {
                                         required: true,
                                         minlength: 3,
                                         maxlength: 4
                                }
                        },
                        messages: {
                                nameOnCard: "Please enter the name that's shown on your card",
                                typeOfCard: "Please select the type of card",
                                cardNumber: "Please enter the card number",
                                expiryMonth: "A valid expiry date has to be selected",
                                expiryYear: "A valid expiry date has to be selected",
                                ccv: "A valid CVC code needs to be entered"
                        },
                });
        }
