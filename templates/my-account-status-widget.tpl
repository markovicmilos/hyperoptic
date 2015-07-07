<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-30 golden-yelow-bg-1" ><!-- Entire Instalation Bar 1/1 --> 
	<div class="  col-xs-12 col-sm-4 col-md-4 col-lg-4 pad-top-fixed-15 pad-bottom-fixed-15" ><!-- Instalation date container 1/3  --> 
		<p class=" marg-bottom-fixed-15 font-12 gray-f-1 "> INSTALLATION DATE </p>
		<img class=" pull-left" id=" "  src="{base-url}/images/my-account-calendar-icon.png" alt="Hyperoptic bb"  />
		<div class="marg-left-fixed-50"> 
			<!-- START BLOCK : have-jobe -->
			<p class="pad-top-fixed-5 marg-left-fixed-20 font-13 gray-f-1 l-h-small"> Your installation is booked for:</p>                                	
			<p class="marg-left-fixed-20 font-18 black-f-1 font-w-600 l-h-small ">	{order-status-date} </p>
			<!--<p class="pad-top-fixed-5 marg-left-fixed-20 font-13 gray-f-1 "> {order-status-time}-->
				<!-- <a class="pad-left-fixed-20 blue-navy-f-1 font-w-600" href="#">Change install details</a> -->
			</p>  
			<!-- END BLOCK : have-jobe --> 
			<!-- START BLOCK : no-jobe -->
			<p class="pad-top-fixed-5 marg-left-fixed-20 font-13 gray-f-1 l-h-small"> Installation date to be confirmed </p>                                	
			<p class="marg-left-fixed-20 font-18 black-f-1 font-w-600 l-h-small "></p>
			<p class="pad-top-fixed-5 marg-left-fixed-20 font-13 gray-f-1 "> 
				<!-- <a class="pad-left-fixed-20 blue-navy-f-1 font-w-600" href="#">Change install details</a> -->
			</p>  
			<!-- END BLOCK : no-jobe --> 
		</div>
	</div><!-- End of Instalation date container 1/3  -->                                                         
	<div class="  col-xs-12 col-sm-4 col-md-4 col-lg-4 marg-top-fixed-15 pad-bottom-fixed-45 b-r-1px-gray b-l-1px-gray b-r-0-l-768 b-l-0-l-768"><!-- Order status container 1/3  -->
		<p class=" marg-bottom-fixed-15 font-12 gray-f-1 "> ORDER STATUS </p>
		<div class=""> 
			<p class="font-13 gray-f-1 l-h-15px"> 
				{order-status-message}			
			</p>                                	
			 <a href="{link-help}">
				<p class="font-13 font-w-600 blue-navy-f-1 l-h-15px"> 
					View our Help & Advice section to learn more
			   </p>
			 </a>
		</div>
	</div>
	<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 marg-top-fixed-15" ><!-- Next steps container 1/3  --> 
		<p class=" marg-bottom-fixed-5 font-12 gray-f-1 "> NEXT STEPS </p>
		<div class="marg-bottom-fixed-15" >
			<!-- START BLOCK : step -->
			<div class="font-15 gray-yelow-bg-1 ">
				<div class="{status-class}" ></div>
				<p class=" ppd pad-left-fixed-25 l-h-23px"> {title} </p>
			</div>
			<!-- END BLOCK : step -->
		</div>
	</div>
</div>