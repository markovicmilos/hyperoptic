<!-- Modal Report problem -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content gray-bg-1">
	<form id="reportProblemForm" onsubmit="return submitReportProblem()">
	  <input id="reportProblemSiteId" name="reportProblemSiteId" value="{siteid}" type="hidden" />
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<h2 class="modal-title" id="myModalLabel">Share news or issues </h2>
	  </div>
	  <!-- /.modal-body -->
	  <div id="reportProblemContent" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-1" ><!-- Report problem form -->
		 <p class=" marg-left-fixed-20 font-15 gray-f-2 pad-top-fixed-15"> If you know of any news that may impact or delay Hyperoptic coming to your building please let us know. This can be anything from changes  in the  building management team to building upgrades and refurbishments. You can add information below. </p>
		   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-perc-0" >
				<p class=" marg-top-fixed-10 font-13 gray-f-2"> Subject
				</p>
				<input type="text" name="reportProblemSubject" id="reportProblemSubject" class="form-control input-ri" placeholder="Subject" required="required" />
		   </div>  		  
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 " ><!-- Column 5 -->
		   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-20" >
				<p class=" marg-top-fixed-10 font-13 gray-f-2"> Full name
				</p>
				<input type="text" name="reportProblemName" id="reportProblemName" class="form-control input-ri" placeholder="Full name" required="required" />
		   </div> 
		   <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-perc-0" >
				<p class=" marg-top-fixed-10 font-13 gray-f-2"> Email address
				</p>
				<input type="email" name="reportProblemEmail" id="reportProblemEmail" class="form-control input-ri" placeholder="Email address" required="required" />
		   </div>    
		</div>
		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 " >
			<div id="f-cm-i" class="form-group pad-left-fixed-5">
			   <label for="comment" class="w-99 pad-top-fixed-10 marg-left-fixed-m5 font-13 gray-f-2 font-w-400">Message</label>
				<textarea class="form-control ri-form1" rows="5" id="reportProblemMessage" placeholder="Please type your message here" name="reportProblemMessage" maxlength="300"></textarea>
			  </div>
			  <p id="reportProblemInfoMessage" class="pad-left-fixed-10 font-14 red-error-f-2"></p>									   
		 </div>
		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-fixed-20" >
	
		  </div>
	  </div><!-- End of Report problem form -->
	  <!-- /.modal-body -->
	  <div class="modal-footer">
		<div class="pad-top-fixed-15 b-t-1px-gray">
			<button type="submit" class="btn btn-primary b-t-1px-l-gray" style="float:right" id="reportProblemButton">SEND</button>
		</div>    
	  </div>
	</form>
	<script type="text/javascript">
	(function (){
		$("#reportProblemForm").validate({ rules: {	reportProblemEmail: "validEmail" } });
	}());
	</script>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal Entire Modal Report problem -->