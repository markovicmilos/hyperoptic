	<!-- INCLUDE BLOCK : header -->
	
	<!-- INCLUDE BLOCK : menu-maps -->
	
	<!--  Grid view  -->      
	<div class="row container-fluid pad-left-percent-19 pad-right-percent-18 gray-bg-1">      
		<div> <!-- Div that is needed to contain elemnts because Bootstrap grid logic -->
		
			<!-- START BLOCK : item -->
			<div class=" col-xs-6 col-sm-4 col-md-3 col-lg-3 pad-right-percent-2 pad-bottom-percent-1  pad-left-percent-0">
				<!-- Location description (ao) accepting order -->      
				<div id="locationDescription-ri" class=" locationDescription arrow-box-gv marg-top-fixed-10">
					<a href="../routing/?siteid={id}"><img class=" ld-img-s1" src="{image}" alt="{name}"  /></a>
					<a href="../routing/?siteid={id}">
						<div id="ldgh-{number}" class="site-name-gv blue-navy-f-2 marg-top-fixed-15 marg-left-fixed-15 marg-right-fixed-15 font-18 "> {name} </div>
					</a>
					<div id="ldgp-{number}" class="marg-top-fixed-10 marg-left-fixed-15">
						<img  class="marker-grid-view pull-right" src="{marker}" alt="{name}"  /> 
						<p class="gray-f-4 font-14 font-w-300"><br /><br />{city}, {postarea} <br />
							<a href="../routing/?siteid={id}" class="font-w-400">Find out more</a>
						</p>
					</div>
					<!-- START BLOCK : status-gray -->
					<div class="ldg-1">
						<p class=" pad-top-percent-5 marg-left-fixed-15 white-f-fff font-14 font-w-300 "> Status <span class=" marg-left-fixed-5 font-w-500">{status}</span></p> 
					</div>
					<!-- END BLOCK : status-gray -->
					
					<!-- START BLOCK : status-blue -->
					<div class="ldb-1">
						<p class=" pad-top-percent-5 marg-left-fixed-15 white-f-fff font-14 font-w-300 "> Status <span class=" marg-left-fixed-5 font-w-500">{status}</span></p> 
					</div>
					<!-- END BLOCK : status-blue -->
				</div> <!--  End of Location description (ao) registering interest -->      
			</div>      
			<!-- END BLOCK : item -->
			
		</div>  <!-- Div that is needed to contain elemnts because Bootstrap grid logic -->
	</div>
