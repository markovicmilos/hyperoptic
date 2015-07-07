<!-- INCLUDE BLOCK : header -->

<!-- INCLUDE BLOCK : my-account-menu -->
<!-- INCLUDE BLOCK : my-account-need-support -->

<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">
<div class="row container-fluid ">
	<!-- Latest Bill and Billing method col   -->
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-top-fixed-15 pad-bottom-fixed-30 pad-left-percent-0">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0 pad-right-0-l-768">
				<!-- 1/2 of Column 12/12   -->
				<div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-15 gray-bg-3">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0 ">
						<!-- Column 1   -->
						<div class=" marg-top-fixed-15 pad-bottom-fixed-15 gray-f-1 font-12">
							LATEST SUMMARY
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0 b-b-1px-l-gray">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="black-f-1 font-38 l-h-68">£ {last-bils}</p>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-13 pull-right"></p>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-12">YOU WERE BILLED ON</p>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-13 pull-right">{last-billled-on}</p>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-12">NEXT PAYMENT DUE</p>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-13 pull-right">{next-billed-on}</p>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 b-b-1px-l-gray">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-12">BALANCE</p>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<p class="gray-f-1 font-13 pull-right">£ {balance}</p>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-left-percent-0">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
							<p class="gray-f-1 font-13">
								Your next bill will arrive on {next-billed-on}. <br>
							</p>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-30 pad-right-percent-0 pad-left-percent-0">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<button id="pop-v-l-b" type="submit" class="btn view-bill-btn font-w-500" style="float: left" onclick="getBill('last'); return false;">VIEW
								LATEST BILL</button>
						</div>
					</div>
				</div>
			</div>
			<div id="" class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-0-l-768 marg-top-30-l-768">
				<div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gray-bg-3 pad-bottom-fixed-15">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-left-percent-0">
						<div class=" marg-top-fixed-15 pad-bottom-fixed-15 gray-f-1 font-12">BILLING METHOD</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-right-percent-0 pad-bottom-fixed-5 pad-left-percent-0">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
							<div id="" class="l-h-100">
								<p class="black-f-1 font-18 font-w-600">Direct Debit <br></p>
							</div>
							<p class=" gray-f-2 font-13 l-h-100">
								<a href="../myaccount-payment" class="font-w-500 blue-navy-f-2">Update</a>
							</p>
							<div id="" class=" marg-top-fixed-30 gray-f-2  font-12  ">
								BILLING ADDRESS
							</div>
							<div id="" class="marg-top-fixed-10 ">
								<p class="black-f-1 font-18 font-w-600">
									{address}
								</p>
							</div>
							<p class=" gray-f-2 font-13 l-h-100">
								<!-- <a href="#" class="font-w-500 blue-navy-f-2">Change</a> -->
							</p>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Latest Bill and Billing method col   -->
	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0 pad-right-0-l-768">
		<div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-15 gray-bg-3">
			<p class=" marg-top-fixed-10 font-13 gray-f-2">VIEW AND PRINT OLDER BILLS</p>
			<ul id="" class="nav navbar-nav ma-dropdown-big">
				<li class="dropdown">
					<a href="#"	class="dropdown-toggle font-16 font-w-500 gray-f-2"	data-toggle="dropdown" role="button" aria-expanded="false">
						<span id="nameTitle"> - Select bill - </span> <span class="caret arow-down-ri-big "></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- START BLOCK : bill-item -->
						<li><a href="#" onclick="getBill('{date}')">{name}</a></li>
						<!-- END BLOCK : bill-item -->
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-all-0">
		<img class="baner-ma pad-top-percent-2" id="" src="{base-url}/images/my-account-my-package-baner.jpg" alt="Hyperoptic bb">
	</div>

	<div id="billPlaceHolder"></div>
	
</div>
</div>
