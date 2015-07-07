
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 pad-left-percent-0 pad-bottom-fixed-10 white-bg-fff" >
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
    	<span id="selectItemCount" class="font-13 blue-navy-f-2 font-w-600"> Matches: {total}</span>
        <p class="font-13 gray-f-2 l-h-small"> Enter the address to refine your search </p>
    </div>  
</div>
<!-- START BLOCK : item -->
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 pad-bottom-fixed-5 white-bg-fff" >
	<!-- START BLOCK : itemPAF -->
	<a href="../routing/?pafid={id}">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-10 pad-bottom-fixed-10 gray-bg-1 font-16 gray-f-2" >
			{address}                                  
    	</div>
    </a>
    <!-- END BLOCK : itemPAF -->
    <!-- START BLOCK : itemPOI -->
    <!-- START BLOCK : linkjs -->
	<a href="javascript:moveMap('{id}')">
    <!-- END BLOCK : linkjs -->
    <!-- START BLOCK : linkNOTjs -->
	<a href="?q={id}">
    <!-- END BLOCK : linkNOTjs -->
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-10 pad-bottom-fixed-10 gray-bg-1 font-16 gray-f-2" >
			{address}                                  
    	</div>
    </a>
    <!-- END BLOCK : itemPOI -->
</div>
<!-- END BLOCK : item -->
<!-- START BLOCK : itemSELECT -->
<div class="item-in-select col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 pad-bottom-fixed-5 white-bg-fff" >
    <a href="javascript:selectPostCode('{pafid}', '{address}', '{postcode}');">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-10 pad-bottom-fixed-10 gray-bg-1 font-16 gray-f-2" >
			{address}                                  
    	</div>
    </a>
</div>
<!-- END BLOCK : itemSELECT -->
<!-- START BLOCK : address-not-found -->
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 pad-bottom-fixed-5 white-bg-fff" >
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" ><!-- Column 2   -->
    	<a href="../building-unknown/" class="font-13 blue-navy-f-2 font-w-600">My address is not appearing</a>
    </div>
</div>
<!-- END BLOCK : address-not-found -->