<div class="modal fade" id="tellFriendModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content gray-bg-1">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h2 class="modal-title" id="myModalLabel">Spread the word</h2>
            </div>
            <form id="tellAFriendForm" onsubmit="return tellAFriend()">
                <input type="hidden" id="csf" name="csf" value="{csf}" />
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0" >
                    <p class=" marg-left-fixed-20 font-13 gray-f-2 pad-top-fixed-15 fp-padding-rl"> Tell your friends and neighbours about Hyperoptic full fibre broadband.  </p>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0" >
                        <p class="marg-top-fixed-10 marg-left-fixed-20 font-12 gray-f-2 fp-padding-rl"> FRIEND’S DETAILS </p>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl">
                                <p class="marg-top-fixed-10 font-13 gray-f-2 marg-top-0-l-768"> Name  </p>
                                <input id="name0" name="name0" type="text" class="form-control input-ri" placeholder="Friend’s name" required="required" />
                            </div>
                            <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <p class="marg-top-fixed-10 font-13 gray-f-2"> Email </p>
                                <input id="email0" name="email0" type="text" class="form-control input-ri" placeholder="Friend’s email address" required="required" />
                            </div>
                        </div>
                        <div id="names" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15 pad-left-fixed-20 pad-left-15-l-768">
                        <a class="blue-navy-f-1" href="javascript:addNewEmail()">
                  <span class="pad-top-fixed-5 font-18 font-w-600 blue-navy-f-1 l-h-small">
                      <img src="{base-url}/images/tell-friend-plus-blue-icon.png" alt="Hyperoptic fb" /> Add another friend
                  </span>
                        </a>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0" >
                        <p class="marg-top-fixed-15 pad-top-fixed-15 marg-left-fixed-20 font-12 gray-f-2 w-94 b-t-1px-l-gray marg-left-15-l-768 "> YOUR DETAILS </p>
                        <div id="" class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl" >
                            <p class="marg-top-fixed-10 font-13 gray-f-2 marg-top-0-l-768"> Name  </p>
                            <input id="yourname" name="yourname" type="text" class="form-control input-ri" placeholder="Your name" required="required" />
                        </div>
                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <p class="marg-top-fixed-10 font-13 gray-f-2"> Email </p>
                            <input id="youremail" name="youremail" type="text" class="form-control input-ri" placeholder="Email address" required="required" />
                        </div>
                    </div>


                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-20">
                        <div id="f-cm-i" class="form-group pad-left-fixed-5">
                              <label class="w-99 pad-top-fixed-10 marg-left-fixed-m5 font-13 gray-f-2 font-w-400 b-t-1px-l-gray">MESSAGE</label>
                            <div style="overflow-y: auto; height: 146px;">
                                <p class="pad-top-fixed-10 pad-right-fixed-15 font-13 gray-f-2 txt-a-j">Hi there, </p>
                                <p class="pad-right-fixed-15 font-13 gray-f-2 txt-a-j">Have you heard of Hyperoptic? They're the UK's fastest broadband provider powering residential buildings nationwide. </p>
                                <p class="pad-right-fixed-15 font-13 gray-f-2 txt-a-j">Hyperoptic specialise in bringing fibre all the way to the building, which makes all the difference. It delivers an extraordinarily fast and reliable connection to all residests, all the time. </p>
                                <ul  class="pad-left-fixed-20 gray-f-2 font-13 l-h-120 font-w-400">
                                    <li>Award-winning download speeds of 1Gb (1000Mb)</li>
                                    <li>Equally fast uploads</li>
                                    <li>Consistently fast, even at peak times</li>
                                    <li>Unlimited usage – no slow-downs or restrictions</li>
                                </ul>
                                <p class="pad-right-fixed-15 font-13 gray-f-2 txt-a-j">To find out if Hypeoptic is available where you live, just visit hyperoptic.com and enter your postcode. If it’s not yet available, simply register your interest and they'll start to consider expanding to your area.  </p>
                                <p class="pad-right-fixed-15 font-13 gray-f-2 txt-a-j">There's no commitment when you register. It just lets them know you're interested, and secures exclusive prices for you when their service goes live.  </p>
                                <p class="pad-right-fixed-15 pad-bottom-fixed-15 font-13 gray-f-2 txt-a-j">Nothing to lose, plenty to gain... !</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-top-fixed-15">
                    {captcha}
                    <p class="font-11 gray-f-2 font-w-600"> Please type the characters above </p>
                    <input type="text" name="CaptchaCode" id="CaptchaCode" class="textbox form-control input-ri" />
                </div>
                <div class="modal-footer">
                    <div class="pad-top-fixed-15">
                        <button id="submitTellAFriend" type="submit" class="btn btn-primary" style="float:right">SEND</button>
                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal Entire Tell a Friend end -->