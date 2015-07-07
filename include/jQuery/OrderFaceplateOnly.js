        
        function validateFaceplateOrder() {
                // validate signup form on keyup and submit
                $("#faceplateForm").validate({
                        rules: {
                                firstName: "required",
                                lastName: "required",
                                email: {
                                        required: true,
                                        email: true
                                },
                                contactNumber: {
                                       required: true
                                }
                        },
                        messages: {
                                firstName: "Please enter your firstname",
                                lastName: "Please enter your lastname",
                                email: "Please enter a valid email address",
                                contactNumber: "Please enter a phone number"
                        }
                });
        }
