	
	<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1"> <!-- Container for chnaging view and search document-->
        <div>	
			<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0">
				<p id="menuBreadcrumbs" class="marg-top-fixed-10 font-11">
					<!-- START BLOCK : bread-crumbs -->
                    <a href="{link}"> {crumb} </a> /
					<!-- END BLOCK : bread-crumbs -->
				</p>
				<a name="Title"><p id="menuTitle" class="font-42 gray-f-2 l-h-130" style="text-transform: uppercase;"> {menu-title} </p></a>
			</div>
			<div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-all-0"> 
                <div class=" col-xs-12 col-sm-12 col-md-6 col-lg-6 marg-top-fixed-30 b-l-1px-gray">  
					<span class="font-11" style="display:inline;"> VIEW BY </span>
					<div class="btn-group btn-group-select-400 marg-left-fixed-10 " >
						<button type="button" class="btn btn-default btn-block btn-select dropdown-toggle border-none font-21 gray-bg-1" data-toggle="dropdown" 
						aria-expanded="false">  {menu-selected}
						<span class="caret arow-down-s marg-left-fixed-10"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<!-- START BLOCK : menu-items -->
							<li><a class="link-into-view-by" href="{url}">{name}</a></li>
							<!-- END BLOCK : menu-items -->
						</ul>
					</div>
				</div>   
				<div id="input-postcode-s" class=" col-xs-12  col-sm-12 col-md-6 col-lg-6 marg-top-fixed-30  b-r-1px-gray b-l-1px-gray">
					<input type="text" id="postcodeText" class="form-control input-postcode" placeholder="Postcode search">
				</div>
                <div id="postcodeResultsCloser" class="postcode-r-closer"></div>
                <div id="postcodeResultsExtender" class="postcode-r-extender"></div>
				<div id="postcodeResults" class="postcode-s-b op-0">
					
				</div>
			</div>
        </div>  
    </div>
    