<!-- First tab in Tab 1   -->
<div class="{disabled1} col-xs-12 col-sm-4 col-md-4 col-lg-4 pad-right-percent-0 marg-bottom-fixed-30 pad-left-percent-0 b-r-1px-l-gray product-panel" >
	<!-- START BLOCK : enable-click1 --> 
	<div class="p-d-op1" onclick="javascript:changingPacketText('p-t-op{product-id}');javascript:changingPacketImg('p-i-op{product-id}');javascript:changingPacket(this);" >
	<!-- END BLOCK : enable-click1 -->
		<input type="hidden" class="productBundleId" />
		<input type="hidden" class="productProductId" />
		<input type="hidden" class="productCategoryId" />
	<!-- START BLOCK : disable-click1 -->
	<div class="p-d-op1" >
	<!-- END BLOCK : disable-click1 --> 
		<!-- START BLOCK : active-product1 -->
			<img id="p-i-op{product-id}" class=" pad-right-fixed-15 pad-left-fixed-15 pack-i-op pack-i-uns-op pack-i-s-op " src="{base-url}/images/products/{image-id}.png" alt="Hyperoptic bb"  />
		<!-- END BLOCK : active-product1 -->
		<!-- START BLOCK : inactive-product1 -->
			<img id="p-i-op{product-id}" class=" pad-right-fixed-15 pad-left-fixed-15 pack-i-op pack-i-uns-op " src="{base-url}/images/products/{image-id}.png" alt="Hyperoptic bb"  />
		<!-- END BLOCK : inactive-product1 -->
		<div class="pd-p-co-op">
			<!-- START BLOCK : offer11 -->
			<p class="d-p-op marg-left-fixed-m5 gray-f-2 font-w-500">per month<br>for <span class="promotion-months">{promotion-months}</span> months</p>
			<!-- END BLOCK : offer11 -->
			<!-- START BLOCK : price11 -->
			<p class="p-p-op font-f-bariol-light font-30 font-w-600 blue-navy-f-2">£{product-price}</p>
			<!-- END BLOCK : price11 -->
			<!-- START BLOCK : price21 -->
			<p class="p-price-only-op font-f-bariol-light font-30 font-w-600 blue-navy-f-2">£{product-price}</p>
			<!-- END BLOCK : price21 -->
		</div>
			<img id="" class="offer-i-op" src="{base-url}/images/offer-sticker.png" alt="Hyperoptic bb"  />
	</div>
	<div id="p-t-op{product-id}" class="pack-text-op pad-left-fixed-15 marg-top-fixed-30 gray-f-2 font-12 black-f-1 font-w-600"> {state} </div>
	<div class="pad-left-fixed-15 blue-navy-f-2 font-18 font-w-600 product-title"> {product-title} </div>
	<p class="pad-left-fixed-15 pad-right-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> {product-description} </p>
	<ul  class=" pad-left-fixed-30 gray-f-2 font-13 ">
		<!-- START BLOCK : pros1 -->
		<li>{pros-text}</li>
		<!-- END BLOCK : pros1 -->
	</ul>
		<p class="pad-left-fixed-15 marg-top-fixed-15 gray-f-2 font-13 "> Ideal for use with: </p>
        <!-- START BLOCK : residential-bb-use-with -->
        <img class="marg-top-fixed-30 ideal-u-i-op" src="{base-url}/images/products/{image-id}usewith.png" alt="Hyperoptic bb"/>
        <!-- END BLOCK : residential-bb-use-with -->
        <!-- START BLOCK : business-bb-use-with -->
        <img class="marg-top-fixed-30 ideal-u-i-op" src="{base-url}/images/products/{image-id}-business-usewith.png" alt="Hyperoptic bb"/>
        <!-- END BLOCK : business-bb-use-with -->
</div>
<!-- End of First tab in Tab 1   --> 