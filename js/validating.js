$.validator.setDefaults({
    highlight: function(element) {
        $(element).closest(".input-group-h").addClass("has-error");
    },
    unhighlight: function(element) {
        $(element).closest(".input-group-h").removeClass("has-error");
    },
    errorElement: "span",
    errorClass: "help-block",
    errorPlacement: function(error, element) {
        $(element).closest(".input-group-h").append(error);
    }
});

$.validator.addClassRules("fillone", {
    require_from_group: [1,".fillone"]
});

function isUKPhoneNumber(phone_number){
    return phone_number.match(/^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$/) != null;
}

function isPhoneNumber(phone_number){
    return phone_number.match(/^(\+(?:[0-9] ?){6,14}[0-9])|(\d{5,16})$/) != null;
}

function isEmail(email){
    return email.match(/^([a-zA-Z0-9])+([\+\._-]{0,1}[a-zA-Z0-9]+[_]{0,1})*@([a-zA-Z0-9])+([-\._]{0,1}[a-zA-Z0-9]+)*(\.[a-zA-Z]+)$/) != null;
}

function isLettersOnly(text){
    return text.match(/^[a-zA-Z][a-zA-Z -]+$/) != null;
}

function isDate (text){
    return text.match(/^((31(?! (Feb|Apr|Jun|Sep|Nov)))|((30|29)(?! Feb))|(29(?= Feb (((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(0?[1-9])|1\d|2[0-8]) (Jan|Feb|Mar|May|Apr|Jul|Jun|Aug|Oct|Sep|Nov|Dec) ((1[6-9]|[2-9]\d)\d{2})$/) != null;
}

function isUniqueEmail (value){
    var isSuccess = false;
    $.ajax({
        url: homeURL + "check-api/",
        type: 'POST',
        data: { mode: 'email', email: value },
        async: false,
        dataType: "json",
        success:
            function( data ) {
                isSuccess = data.isOK;
            }
    });
    return isSuccess;
}

$.validator.addMethod("phoneUK", function(phone_number, element) {
	return this.optional(element) !== false || isUKPhoneNumber(phone_number);
}, "Please specify a valid phone number");
$.validator.addMethod("phoneNumber", function(phone_number, element) {
    return this.optional(element) !== false || isPhoneNumber(phone_number);
}, "Please specify a valid phone number");
$.validator.addMethod("postcodeUK", function(value, element) {
	return this.optional(element) || /[A-Z]{1,2}[0-9R][0-9A-Z]? [0-9][ABD-HJLNP-UW-Z]{2}/i.test(value);
}, "Please specify a valid Postcode");
$.validator.addMethod("acceptLettersOnly", function(value, element) {
    return isLettersOnly(value);
}, "Please use letters only");
$.validator.addMethod("longerThenOne", function(value, element) {
    return this.optional(element) || value.length >= 2;
}, "Please provide your full name");
$.validator.addMethod("exactlengthsix", function(value, element) {
	 return this.optional(element) || value.length == 6;
}, "Please enter exactly 6 characters.");
$.validator.addMethod("exactlengtheight", function(value, element) {
	 return this.optional(element) || value.length == 8;
}, "Please enter exactly 8 characters.");
$.validator.addMethod("validEmail", function(value, element) {
    if(value == '')
        return true;
    return isEmail(value);
}, "Please enter valid email.");
$.validator.addMethod("uniqueEmail", function(value, element) {
	return isUniqueEmail(value);
}, "Email is already in use.");
