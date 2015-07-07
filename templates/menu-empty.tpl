	<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 gray-bg-1"> <!-- Container for chnaging view and search document-->
        <div>	
              <div class=" col-xs-9 col-sm-10 col-md-10 col-lg-10 pad-all-0">
                    <p class="marg-top-fixed-10 font-11">
						<p class="marg-top-fixed-10 font-11">
						<!-- START BLOCK : bread-crumbs -->
						<a href="{link}"> {crumb} </a> /
						<!-- END BLOCK : bread-crumbs -->
						</p>
					</p>
					<a name="Title"><p class="font-42 gray-f-2 l-h-130"> {menu-title} </p></a>
					<!-- START BLOCK : assigned-postcodes -->
					<p class="font-13 gray-f-2"> {site}, {city}, {area}
                            	<span id="vaap" class="blue-navy-f-2 marg-left-fixed-15 marg-left-0-l-480" data-toggle="modal" data-target="#postcodesModal"> View all available postcodes</span>
                    </p>
                       </div>
                       <!-- Modal postcodes -->
                        <div class="modal fade" id="postcodesModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h2 class="modal-title" id="myModalLabel">Available postcodes for {site}</h2>
                              </div>
                              <div class="modal-body">
                               		Here's the list of postcodes assigned to {site}.  If you can't see your postcode, please get in touch <a href="{home-url}contact-us/"> here</a>. </a>
                                	<ul id="mw-ul1" >
                                      <li class="b-t-1px-l-gray"></li>
									  <!-- START BLOCK : postcodes -->
                                      <li>{pcd}</li>
									  <!-- END BLOCK : postcodes -->
                                    </ul>
                              </div>
                            </div>
                          </div>
                        </div>
					<!-- END BLOCK : assigned-postcodes -->				
               </div>
			   
               <div class="  col-xs-3 col-sm-2 col-md-2 col-lg-2  marg-top-fixed-10 pad-all-0">
               		<!-- AddToAny BEGIN -->
					<a class="a2a_dd" href="https://www.addtoany.com/share_save"><img src="{base-url}/images/share-icon.png" class=" pull-right " border="0" alt="Share"/><span class="pull-right marg-top-percent-2 marg-right-fixed-10 font-12">SHARE</span></a>
					<script type="text/javascript" src="//static.addtoany.com/menu/page.js"></script>
					<!-- AddToAny END -->
              </div>
        </div>  
    </div>