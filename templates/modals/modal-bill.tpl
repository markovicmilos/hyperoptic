	
	<!-- Modal View Latest Bill -->
	<div class="modal fade in" id="{bill-div-id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-bottom-fixed-10 gray-bg-1">
					<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
						<h2 class="modal-title font-f-bariol-regular font-38 black-f-1"	id="myModalLabel">{bill-name}</h2>
					</div>
					<div class="marg-top-fixed-10 col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="pad-top-fixed-5 pad-right-percent-0 pad-bottom-fixed-5 col-xs-6 col-sm-6 col-md-6 col-lg-6 txt-a-c b-r-1px-l-gray">
							<!-- <a class="font-15 blue-navy-f-1" href="#">Print</a> -->
						</div>
						<div class="pad-top-fixed-5 pad-right-percent-0 pad-bottom-fixed-5 col-xs-6 col-sm-6 col-md-6 col-lg-6 txt-a-c pull-right">
							<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						</div>
					</div>
				</div>
				<!-- /.modal-body -->
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 gray-bg-1">
					<div class="pad-top-fixed-15 pad-bottom-fixed-5 col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 b-t-1px-l-gray b-b-1px-l-gray">
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-percent-0">
							<p class="l-h-68 font-12 gray-f-1 font-w-500">ACCOUNT NAME</p>
							<p class="l-h-68 font-13 gray-f-1 font-w-500">{account-name}</p>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-percent-0">
							<p class="l-h-68 font-12 gray-f-1 font-w-500">ACCOUNT NAME</p>
							<p class="l-h-68 font-13 gray-f-1 font-w-500">{account-number}</p>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-percent-0">
							<p class="l-h-68 font-12 gray-f-1 font-w-500">BILL NUMBER</p>
							<p class="l-h-68 font-13 gray-f-1 font-w-500">{account-bill-number}</p>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-percent-0">
							<p class="l-h-68 font-12 gray-f-1 font-w-500">INVOICING DATE</p>
							<p class="l-h-68 font-13 gray-f-1 font-w-500">{payment-date}</p>
						</div>
					</div>
					<div class="pad-top-fixed-20 col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
						<p class="gray-f-1 font-12">MONTHLY SERVICE CHARGES</p>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-20 summary-table">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
								<p class="gray-f-1 font-10">Product description</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0 ">
								
							</div>
						</div>
						
						<!-- START BLOCK : broadband-section -->
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-10 pad-left-percent-0 gray-bg-3 b-b-1px-l-gray">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-all-0 pad-left-fixed-10">
								<p class="l-h-small font-18 font-w-700 blue-navy-f-2">Broadband</p>
								<p class="font-13 gray-f-2 l-h-small font-w-500">{broadband-name} ({contractLength})</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-fixed-10">
								<p class=" font-f-bariol-regular font-22 gray-f-2 pull-right">£ {broadband-price}</p>
							</div>
						</div>
						<!-- END BLOCK : broadband-section -->
						
						<!-- START BLOCK : line-rental-section -->
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-fixed-10">
								<p class="l-h-small font-18 font-w-700 blue-navy-f-2">Line rental</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-fixed-10">
								<p class="pad-top-fixed-5 l-h-small font-13 gray-f-2 font-w-500 pull-right">£ {line-rental-price}</p>
							</div>
						</div>
						<!-- END BLOCK : line-rental-section -->
						
						<!-- START BLOCK : line-additional-section -->
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-3">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-fixed-10">
								<p class="l-h-68 font-13 gray-f-2 font-w-500">{line-additional-name}</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-fixed-10">
								<p class="l-h-68 font-13 gray-f-2 font-w-500 pull-right">£ {line-additional-price}</p>
							</div>
						</div>
						<!-- END BLOCK : line-additional-section -->
						
						<!-- START BLOCK : other-section -->
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-fixed-10">
								<p class="l-h-small font-18 font-w-700 blue-navy-f-2">Other</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-fixed-10">
								<p class="pad-top-fixed-5 l-h-small font-13 gray-f-2 font-w-500 pull-right"></p>
							</div>
						</div>
						<!-- END BLOCK : other-section -->
						
						<!-- START BLOCK : other-additional-section -->
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-3">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-fixed-10">
								<p class="font-13 gray-f-2 font-w-500">{other-additional-name}</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-fixed-10">
								<p class="l-h-68 font-13 gray-f-2 font-w-500 pull-right">£ {other-additional-price}</p>
							</div>
						</div>
						<!-- END BLOCK : other-additional-section -->
						
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 gray-bg-3 b-t-1px-l-gray b-b-1px-l-gray">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-fixed-10">
								<p class="l-h-100 font-13 gray-f-2 font-w-500">VAT</p>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-fixed-5">
								<p class="l-h-100 font-13 gray-f-2 font-w-500 pull-right">£ {vat-value}</p>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 pad-top-fixed-15 b-b-1px-l-gray">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-right-fixed-5 pull-right">
								<p class=" pad-top-fixed-5 font-18 l-h-small black-f-1 font-w-700 pull-right">£ {total}</p>
							</div>
							<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 pad-left-percent-0 pull-right" style="text-align: right;">
								<p class="pad-top-fixed-5 font-18 gray-f-2 l-h-small font-w-700">Total</p>
							</div>
						</div>
					</div>
					
					<!-- START BLOCK : current-bill -->
					<p class="font-10 gray-f-1">Payment will be taken by Direct
						Debit on  {bill-date}. Please ensure you have adequate funds
						in your account to make payment. </p>
					<!-- END BLOCK : current-bill -->

				</div>
				<!-- /.modal-body -->
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>