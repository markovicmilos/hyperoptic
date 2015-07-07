
        
        function checkBankDetails(url) {
    
            $( "#buttonNext" ).click(function() {
                $.get(url, { sortCode: $("#sortCode").val(), accountNumber: $("#accountNumber").val() } , 
                    function(data) {
                        if(data == "WEB_SERVICE_DOWN") {
                            $("#webServiceStatus").val("0");
                            $("#invalidBankDetails").hide();
                            $("#paymentForm").submit();
                        } else if(data == "VALID") {
                            $("#webServiceStatus").val("1");
                            $("#invalidBankDetails").hide();
                            $("#paymentForm").submit();
                        } else {
                            $("#invalidBankDetails").show();
                        }
                });
            });

        }
        
        function validatePersonalDetails() {
                // validate signup form on keyup and submit
                $("#invalidBankDetails").hide();
                $("#paymentForm").validate({
                        rules: {
                                accountHolderName: "required",
                                sortCode: "required",
                                accountNumber: "required",
                                directDebit: "required"
                        },
                        messages: {
                                accountHolderName: "Please enter your Account Holder Name",
                                sortCode: "Please enter the sort code of your bank",
                                accountNumber: "Please enter your account number",
                                directDebit: "You have to tick the Direct Debit checkbox"
                        },
                });
        }
