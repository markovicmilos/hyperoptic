<!-- End Modal window -->
<div class="modal fade" id="modal{addOnDivID}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" {additional-modal-data}>
  <div class="modal-dialog">
	<div class="modal-content">
	  <div class="modal-header">
	    <!-- START BLOCK : close-modal-dialog -->
	  	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<!-- END BLOCK : close-modal-dialog -->
		<!-- START BLOCK : close-modal-dialog-home -->
	  	<button type="button" class="close" onclick="window.location.href='{home-url}'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<!-- END BLOCK : close-modal-dialog-home -->
		<h2 class="modal-title" id="modalTitle">{modal-title}</h2>
	  </div>
	  <div class="">
		<p class="pad-left-fixed-15 font-18 font-w-500 black-f-1">{modal-msg-line-one}</p>
		<p class="pad-bottom-fixed-60 pad-left-fixed-15 font-13 gray-f-1">{modal-msg-line-two}</p>
	  </div>
	</div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->