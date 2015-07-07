        
        function validateFaceplateOrderSummary() {
                // validate signup form on keyup and submit
                $("#summaryForm").validate({
                        rules: {
                                acceptTermsOfService: "required",
                                acceptPrivacyPolicy: "required"
                        },
                        messages: {
                                acceptTermsOfService: "You must accept the terms of service",
                                acceptPrivacyPolicy: "You must accept the privacy policy"
                        }
                });
        }
