<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 pad-left-percent-0 pad-top-fixed-10 pad-bottom-fixed-10 gray-bg-3 ri-menu-container">
    <div class="  col-xs-4 col-sm-4 col-md-4 col-lg-4 pad-right-percent-0">
        <p class=" marg-top-fixed-10 font-12 gray-f-2" style="float: left;" > REGISTER YOUR INTEREST </p>
    </div>
    <form id="postcodeForm" onsubmit="return onGoClickedRI();">
        <div class="input-group-h col-xs-6 col-sm-6 col-md-7 col-lg-6 pad-left-percent-0">
            <input type="text" class="postcodeUK form-control input-ri" placeholder="Enter your postcode" id="postcode" name="postcode" onclick="postCodeChangeStart()" required="required" />
        </div>
        <div class="col-xs-2 col-sm-2 col-md-1 col-lg-2 pad-all-0">
            <button type="submit" id="register-ue" class="btn btn-primary register-button btn-l-768 btn-two-letters-l-768" style="float:right">GO</button>
        </div>
        <div id="go-disable-button" class="btn-hover-b ab-btn-h op-0">
            <p id="ph-p" class="font-13">
                Somebody else has already placed an order on this address. Please contact our customer support for more info.
            </p>
        </div>
		<div id="go-disable-button-error" class="btn-hover-b white-bg-fff op-0">
            <p id="ph-p" class="font-13">
                The address you entered is not valid.
            </p>
        </div>
    </form>
    <div id="postcodeResultsCloser" class="postcode-r-closer"></div>
    <div id="postcodeResultsExtender" class="postcode-r-extender"></div>
    <div id="postcodeResults" class="postcode-s-b op-0"></div>
