<!-- INCLUDE BLOCK : header -->

<!-- INCLUDE BLOCK : my-account-menu -->
<!-- INCLUDE BLOCK : my-account-need-support -->

<!--  Main Content container  -->      
<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">  <!--  Row 1  -->      
<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0   "> <!--  Full width right and left  -->
<div class="row container-fluid "> <!--  Content Row  -->
		<!-- ACCOUNT DETAILS + ACCOUNT NUMBER col   -->
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-60 pad-left-percent-0" >
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-9 pad-left-percent-0"><!-- Account details 9/12 -->
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 b-r-1px-l-gray"> <!-- Column all input fields  -->
					<p class=" font-f-bariol-regular black-f-1 font-22 font-w-600"> Direct Debit </p>
					<p class="pad-top-fixed-15 font-12 gray-f-1"> SETTING UP A DIRECT DEBIT FOR YOUR HYPEROPTIC SERVICES </p>
					<p class="font-13 gray-f-1 "> To set up your Direct Debit Instruction you will need to provide the name of the account holder, the bank or building society account number and sort code. If the amounts to be paid or the payment dates change Hyperoptic Limited will notify you 10 working days in advance of your account being debited or as otherwise agreed.
					</p>
					<p>
					Your payments are protected by the Direct Debit Guarantee. You can read more about this guarantee below.
					</p>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0">
							<p class="pad-top-fixed-15 font-12 gray-f-1"> COMPANY NAME <br>
								Hyperoptic Ltd
							</p> 
							<p class="font-12 gray-f-1">  
								COMPANY ADDRESS  <br>
							</p>
							<p class="font-12 gray-f-1">
								Unit C401, Westfield London  <br>
								Ariel Way <br>
								London, W12 7FD  <br>
								United Kingdom                                            
							</p>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-left-percent-0">
							<p class="pad-top-fixed-15 font-12 gray-f-1"> SERVICE USER NUMBER <br>
								437378 
							</p> 
							<p class="font-12 gray-f-1">  
								REFERENCE:  <br>
								HYP{customerId}
							</p>
						</div>
					</div>

	<form method="POST" id="paymentInfoForm">
	   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 " >
		  <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0 pad-right-percent-0 " >
			  <p class=" marg-top-fixed-10 font-13 gray-f-2"> Account holder full name </p>
			  <input type="text" name="holdername" class="form-control input-ri" placeholder="Account holder full name" value="{holderFullName}" required />
		  </div> 
	   </div>
	   
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " >
		   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0 pad-right-percent-0 " >
				<div class="input-group-h col-xs-6 col-sm-4 col-md-4 col-lg-4 pad-left-percent-0">
					<p class=" marg-top-fixed-10 font-13 gray-f-2"> Sortcode </p>
					<input type="text" name="sortcode" id="sortcode" class="exactlengthsix form-control input-ri" placeholder="Sortcode" value="{sortcode}" />
				</div>
		   </div> 
		   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-0-l-768 pad-left-0-l-992">
				<p class=" marg-top-fixed-10 font-13 gray-f-2"> Account number </p>
				<input type="text" name="accountNumber" id="accountNumber" class="exactlengtheight form-control input-ri" placeholder="Account number" value="{accountNumber}" />
		   </div>  
		</div>
							   
		  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-right-percent-0 pad-bottom-fixed-20 pad-left-percent-0" >
			  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0" >
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 gray-bg-1" >
				</div>
			  </div>
			  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0" >
				  <button type="submit" class="btn view-bill-btn" style="float:right" {disable-post-buttom} >UPDATE DETAILS</button>
			  </div>
		  </div>
		</form>
					  <!--                                                    
					  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 b-all-1px-gray" >
							<p class="pad-top-fixed-15 font-14 gray-f-1"> To the manager of: </p>
							<p class="font-13 gray-f-1 "> <b>{bank}</b>  </p>
							<p class="pad-top-fixed-15 font-14 gray-f-1"> Please pay Hyperoptic Limited Direct Debits from this account detailed in this instruction 				
										subject to the safeguards assured by the Direct Debit Guarantee. I understand that this instruction may remain with Hyperoptic 																	Limited and, if so, details will be passed electronically to my Bank/Building Society.                                                        </p> 
							  <div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-5 pad-left-percent-0 gray-bg-1 " >
									<div class="checkbox checkbox-success pad-left-fixed-5 font-14 gray-f-1 ">
										<input id="checkbox-10" type="checkbox" >
										<label for="checkbox-10">
										   I am authorised to set up a Direct Debit instruction from the account.
										</label>
									</div> 
							 </div>
							<p class="font-14 gray-f-1 "> <b>Note:</b> Some Banks and Building Societies may not accept Direct Debit instructions from some types of accounts.

							</p>
					  </div> End of Bank dethails column --> 
					  
					  <!-- Direct Debit dethails column -->                                                   
					  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-15 gray-bg-3" >
							<p class="pad-top-fixed-15 font-14 gray-f-1"> THE DIRECT DEBIT GUARANTEE </p>
							<img class=" pad-top-fixed-5 vertical-baseline pull-right" id="live-location-icon"  src="{base-url}/images/direct-debit-logo-op.png" /><p class="marg-top-fixed-15 font-14 gray-f-1"> 
							</p>
							<ul class="pad-left-fixed-15 font-14 gray-f-1">
								 <li>This Guarantee is offered by all banks and building societies that accept instructions to pay Direct Debits </li>
								 <li>If there are any changes to the amount, date or frequency of your Direct Debit Hyperoptic Limited will notify you 10 working days in advance of your account being debited or as otherwise agreed. If you request Hyperoptic Limited to collect a payment, confirmation of the amount and date will be given to you at the time of the request</li>
								 <li>If an error is made in the payment of your Direct Debit by Hyperoptic Limited or your bank or building society you are entitled to a full and immediate refund of the amount paid from your bank or building society</li>
								 <li>If you receive a refund you are not entitled to, you must pay it back when Hyperoptic Limited asks you to</li>
								 <li>You can cancel a Direct Debit at any time by simply contacting your bank or building society. Written confirmation may be required.</li>
							</ul>  
					  </div><!-- Direct Debit dethails column -->

				</div> <!-- End of all input fields -->
				
			</div><!-- Account details - 9/12 -->                           
			<div class="col-xs-12 col-sm-12 col-md-2 col-lg-3 pad-all-0"><!-- entire right col - 3/12 -->
				<div id="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0"><!-- Account number col - 3/12 -->
					<div id="ldh-1"  class=" gray-f-2  font-12  "> ACCOUNT NUMBER </div>
					<div id="ldp-1" class="marg-top-fixed-15 ">
					<span class="black-f-1 font-18 font-w-600"> {customerId} </span>
					</div>
					<div id=""  class=" marg-top-fixed-30 gray-f-2 font-12"> BILLING METHOD </div>
					<div id="" class="marg-top-fixed-15 l-h-100">
						<p class="black-f-1 font-18 font-w-600"> 
						   Direct Debit   <br />
						</p>
					</div>

				</div><!-- End of Account col - 3/12 -->
			</div><!-- End of entire right col - 3/12 -->			
		</div><!-- End of ACCOUNT DETAILS + ACCOUNT NUMBER col col   -->
</div>
</div>
</div>

<!-- INCLUDE BLOCK : modal -->