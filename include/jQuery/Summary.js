        
        function validateSummary() {
                $("#summaryForm").validate({
                        rules: {
                                acceptTermsOfService: "required",
                                acceptPrivacyPolicy: "required"
                        },
                        messages: {
                                acceptTermsOfService: "You must accept the terms of service",
                                acceptPrivacyPolicy: "You must accept the privacy and cookie policy"
                        }
                });
        }
