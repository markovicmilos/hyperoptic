<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{header-title}</title>
    <meta name="description" content="{header-description}">
    <meta name="robots" content="index,follow" /> <meta name="googlebot" content="index,follow" />
    <!-- Bootstrap recomended setup  -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="{base-url}/css/allfonts.css" rel="stylesheet" type="text/css">

    <script src="{base-url}/js/jquery.min.js"></script>

    <!-- BOOTSTRAP Latest compiled and minified CSS -->
    <link href="{base-url}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="{base-url}/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="{header-css}?v=2" />
    <script src="{base-url}/js/global.js?v=3"></script>
	<script>
		var homeURL = '{home-url}';
		var baseURL = '{base-url}';
	</script>
	{header-jscript}
	
	<link rel="icon" href="{base-url}/images/favicon.ico" />
	
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	  ga('create', 'UA-23479045-1', 'auto');
	  ga('send', 'pageview');
	</script>
	
	<!-- START BLOCK : tracking-base -->
	<script type="text/javascript" src="https://track.adform.net/serving/scripts/trackpoint/"></script> 
	<script type="text/javascript">
        try {
            var sttAdfPagename = "Hyperoptic.com (New)";
            (function(){
            var sttAdfPathname = "";
            sttAdfPathname = window.location.pathname.replace(/^\//,"").replace(/\/+/g,"/").replace(/\//g,"|").replace(/\|$/,"").replace(/\.[^\.\/]+$/,"");
            if(sttAdfPathname === "" || sttAdfPathname === "index"){ sttAdfPathname = "Home"; }
            if(sttAdfPathname != "") sttAdfPagename += "|"+sttAdfPathname;
            })();
            adf.Params.PageName = encodeURIComponent(sttAdfPagename);
            adf.Params.Divider = encodeURIComponent('|');
            adf.track(189202);
        } catch (e){}
	</script> 
    <!-- END BLOCK : tracking-base -->
	
	<!-- START BLOCK : tracking-ri-complete -->
	<script type="text/javascript"> 
		var _adftrack = { 
			pm: 189202, 
			id: 4007469, 
			order: { 
				sv8: '{track-city}', 
				sv9: '{track-postcode}', 
				sv16: '{track-building-status}',
				sv17: '{track-contract-expires}',
                sv18: '{track-riid}'
			} 
		}; 
		(function(){var s=document.createElement('script');s.type='text/javascript';s.async=true;s.src='https://track.adform.net/serving/scripts/trackpoint/async/';var x = document.getElementsByTagName('script')[0];x.parentNode.insertBefore(s, x);})(); 
	</script> 
	<noscript> 
		<p style="margin:0;padding:0;border:0;"> 
			<img src="https://track.adform.net/Serving/TrackPoint/?pm=189202&amp;lid=4007469" width="1" height="1" alt="" /> 
		</p> 
	</noscript>
	<!-- END BLOCK : tracking-ri-complete -->

	<meta name="google-site-verification" content="QfN-ZU84czT2R7C1PkP4S3mzA--8X-lBnTxByLPGd98" />
</head>

<body class="{header-body-class}">
	<input type="hidden" id="baseURL" value="{base-url}" />
	<div class="pad-top-fixed-15" >
		<!-- BEGIN OF HEADER -->
		<div class="row container-fluid pad-left-percent-19 pad-right-percent-19 ">
			<nav class="navbar navbar-default" role="navigation">
				<div>
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<!-- tost icon-->
                            <span class="sr-only">Toggle navigation</span> <!-- tost icon-->
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
						</button>
						<a href="{home-url}"><img id="Hyperoptic Logo" class="marg-right-fixed-20" src="{base-url}/images/logo-top-left.png" alt="Hyperoptic Logo" title="Hyperoptic" /></a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1" style="overflow-x: hidden;">
                        <a href="{home-url}"><p class="pad-right-fixed-15 font-f-bariol-regular font-21 gray-f-4 header-rbp-links header-rbp-links-l-768">Residential</p></a>
                        <a href="{home-url}business"><p class="marg-top-fixed-m5 pad-right-fixed-15 font-f-bariol-regular font-21  font-w-600 black-f-1 header-rbp-links header-rbp-links-l-768" >Business</p></a>
                        <a href="{home-url}property"><p class="marg-top-fixed-m5 pad-right-fixed-15 font-f-bariol-regular font-21 gray-f-4 header-rbp-links header-rbp-links-l-768" >Property</p></a>
						<!-- START BLOCK : sign-out -->
						<a href="{home-url}logout"> <p class="font-15 blue-navy-f-1 pad-left-fixed-20 pad-top-fixed-5 pull-right">  Sign out </p>  </a>
						<!-- END BLOCK : sign-out -->
						<a href="{home-url}myaccount"><img id="user-avatar-icon" class="pull-right pad-bottom-fixed-5 pad-left-fixed-30" src="{base-url}/images/user-avatar{blue}-icon.png" alt="Hyperoptic Residential info"  />  </a>
						<a href="{home-url}help-and-advice/"><img id="chat-icon" class="pull-right pad-left-fixed-30" src="{base-url}/images/chat-icon.png" alt="Hyperoptic Residential info"  />  </a>
						<a href="javascript:openSearch()"><img id="search-icon" class="pull-right pad-left-fixed-30" src="{base-url}/images/search-icon.png" alt="Hyperoptic Residential info"  />  </a> 
					</div>
					<!-- /.navbar-collapse -->
				</div>
			</nav>
		</div>
		<div id="search-bar-top" class="row container-fluid pad-left-percent-19 pad-right-percent-19 b-t-1px-l-gray register-popup-d-n"> <!-- Search document colum -->
            <form role="search" method="get" class="search-form" action="{home-url}">
	            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
	                <p class=" pad-top-fixed-15 font-12 pad-top-fixed-10 gray-f-4 l-h-small"> SEARCH SITE </p>
	                <input type="text" class="form-control font-f-bariol-light input-h-search b-l-3px-l-gray" placeholder="Search" name="s"  autofocus="autofocus" />
	                <p class="pad-top-fixed-15 font-12 pad-bottom-fixed-10 gray-f-4 l-h-small">Please enter to begin search</p>
	            </div>
            </form>
        </div><!-- End of Search document colum -->   
		<!-- /.container-fluid -->
		<!-- END OF HEADER -->

    
