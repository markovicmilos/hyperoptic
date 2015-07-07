<div class=" progress-h-active col-xs-12 col-sm-12 col-md-6 gray-bg-3">
    <!-- START BLOCK : msg-live -->
	<p class=" marg-top-fixed-15 font-18 blue-navy-f-2" > {menu-title} is live and taking orders </p>
	<!-- END BLOCK : msg-live -->
	<!-- START BLOCK : msg-preorder -->
	<p class=" marg-top-fixed-15 font-18  blue-navy-f-2" > {menu-title} is taking pre-orders </p>
	<!-- END BLOCK : msg-preorder -->
</div>
<div class="  col-xs-12 col-sm-12 col-md-6 pad-left-percent-0  pad-top-fixed-10 pad-bottom-fixed-10 gray-bg-3" id="menu-container" >
    <form id="postcodeForm" onsubmit="return onGoClickedLive();">
        <div class="  col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-percent-0">
            <p class=" marg-top-fixed-10 font-12 gray-f-1" style="float: left;" > START YOUR ORDER</p>
        </div>
        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-1">
            <input type="text" name="postcode" id="postcode" class="form-control input-bl" placeholder="Enter your postcode" onclick="postCodeChangeStart()" required="required" />
            <input type="hidden" name="pafid" id="pafid" />
        </div>
        <div class="  col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-all-0">
            <button type="submit" id="register-ue" class="btn btn-primary btn-l-768" style="float:right">ORDER NOW</button>
        </div>
        <div id="go-disable-button" class="btn-hover-b ab-btn-h op-0">
            <p id="ph-p" class="font-13">
                Somebody else has already placed an order on this address. Please contact our customer support for more info.
            </p>
        </div>
		<div id="go-disable-button-error" class="btn-hover-b ab-btn-h op-0">
            <p id="ph-p" class="font-13">
                The address you entered is not valid.
            </p>
        </div>
    </form>
    <input id="pafid" name="pafid" type="hidden" />
    <div id="postcodeResultsCloser" class="postcode-r-closer"></div>
    <div id="postcodeResultsExtender" class="postcode-r-extender"></div>
    <div id="postcodeResults" class="postcode-s-b op-0">
</div>
	