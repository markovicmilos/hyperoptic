	<!-- INCLUDE BLOCK : header -->
	
	<!-- INCLUDE BLOCK : menu-maps -->

    <!--  List view  -->
	<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1">

		<!-- START BLOCK : item -->
		<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 marg-bottom-fixed-15  list-box-bg ">
			<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0  ">
				<div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-1 ">
					<a href="../routing/?siteid={id}"><img class="ld-img-s2 vertical-baseline " src="{image}" alt="{name}" /></a>
				</div>
				<div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-top-fixed-15 pad-left-percent-0">
					<div id="map-canvas-{number}" class="map-canvas-small"></div>
				</div>
			</div>
	
			<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-percent-0  ">
				<div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 col-lg-pull-1 marg-top-fixed-10 ">
					<div id="ld-name-container" class="dis-inline-b">
						<a href="../routing/?siteid={id}">
							<div id="ldh-{number}" class="location-name-lv marg-left-fixed-10 blue-navy-f-2 font-18 "> {name} </div>
						</a>
						<div id="ldp-{number}" class="marg-top-fixed-10 marg-left-fixed-10">
							<p class="gray-f-4 font-14 font-w-300 ">
								<br />
								{city}, {postarea} 
								<br />
								<a href="../routing/?siteid={id}" class=" blue-navy-f-2  font-w-400">Find out more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 pad-right-percent-0 pad-left-percent-0">
					<div id="status-group-list" class=" dis-inline-b marg-top-fixed-15 pad-all-0" >
						<img  class=" pull-right" src="{marker}" alt="{name}" />
						<div id="ldh-{number}"  class=" gray-f-2  font-12  "> GET IN TOUCH </div>
						<div id="ldp-{number}" class="marg-top-fixed-10 ">
							<span class="gray-f-2 font-14 font-w-300 font-w-700"> {repname} </span>
							<p class="gray-f-4 font-14 font-w-300 font-w-500">
								Hyperoptic representative <br />
								Email <a class="w-w-break" href="mailto:{email}">{email}</a>  <br />
                                <br />
							</p>
						</div>
						<!-- START BLOCK : status-gray -->
						<div id="ldlg-1" class=" marg-top-fixed-30 " >
							<p class=" marg-left-fixed-10 white-f-fff font-14 font-w-100 "> Status </p>
							<p class=" marg-left-fixed-10 white-f-fff font-14 font-w-500"> {status} </p>
						</div>
						<!-- END BLOCK : status-gray -->
	
						<!-- START BLOCK : status-blue -->
						<div id="ldlb-1" class=" marg-top-fixed-30 " >
							<p class=" marg-left-fixed-10 white-f-fff font-14 font-w-100 "> Status </p>
							<p class=" marg-left-fixed-10 white-f-fff font-14 font-w-500"> {status} </p>
						</div>
						<!-- END BLOCK : status-blue -->
					</div>
				</div>
	
			</div> 
		</div> 
		<!-- END BLOCK : item -->
	</div>

    <!-- INCLUDE BLOCK : footer -->