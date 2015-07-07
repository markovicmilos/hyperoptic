
        
        function documentReadyPersonalDetails(url) {
            $("#deliveryAddress").hide();
            $("#postCodeError").hide();
            $("#sameDelivery").change(function() {
                if (this.checked) {
                    $("#newPostCode").attr('disabled', 'disabled');
                    $("#newPostCode").attr('readonly', 'true');
                    $("#submitPostCode").attr('disabled', 'disabled');
                    $("#submitPostCode").attr('readonly', 'true');
                    $("#deliveryAddress").attr('disabled', 'disabled');
                    $("#deliveryAddress").attr('readonly', 'true');
                }
                else {
                    $("#newPostCode").removeAttr('disabled');
                    $("#newPostCode").removeAttr('readonly');
                    $("#submitPostCode").removeAttr('disabled');
                    $("#submitPostCode").removeAttr('readonly');
                    $("#deliveryAddress").removeAttr('disabled');
                    $("#deliveryAddress").removeAttr('readonly');
                }
            });
            
            // fetch addresses for postcode
            $( "#submitPostCode" ).click(function() {
                $.get(url, { postCode: $("#newPostCode").val() } , 
                    function(data) {
                        if(data == "INVALID_POSTCODE" || data == "NO_POSTCODE") {
                            $("#postCodeError").show();
                            $("#deliveryAddress").hide();
                        } else {
                            $("#deliveryAddress").append(data);
                            $("#deliveryAddress").show();
                            $("#postCodeError").hide();
                        }
                });
            });
            //triger change event in case checkbox checked when user accessed page
            $("#sameDelivery").trigger("change");
            $( "#dateOfBirth" ).datepicker({ dateFormat: "yy-mm-dd" });
        }
        
        function validatePersonalDetails() {
                // validate signup form on keyup and submit
                $("#personalFrom").validate({
                        rules: {
                                firstName: "required",
                                lastName: "required",
                                userName: {
                                        required: true,
                                        minlength: 2
                                },
                                password: {
                                        required: true,
                                        minlength: 5
                                },
                                passwordRepeat: {
                                        required: true,
                                        minlength: 5,
                                        equalTo: "#password"
                                },
                                email: {
                                        required: true,
                                        email: true
                                },
                                emailRepeat: {
                                        required: true,
                                        equalTo: "#email"
                                },
                                dateOfBirth: {
                                       required: true
                                },
                                phone: {
                                       required: true
                                },
                                postCode: {
                                       required: true
                                }
                        },
                        messages: {
                                firstName: "Please enter your firstname",
                                lastName: "Please enter your lastname",
                                userName: {
                                        required: "Please enter a username",
                                        minlength: "Your username must consist of at least 2 characters"
                                },
                                password: {
                                        required: "Please provide a password",
                                        minlength: "Your password must be at least 5 characters long"
                                },
                                passwordRepeat: {
                                        required: "Please provide a password",
                                        minlength: "Your password must be at least 5 characters long",
                                        equalTo: "Please enter the same password as above"
                                },
                                email: "Please enter a valid email address"
                        }
                });
        }
