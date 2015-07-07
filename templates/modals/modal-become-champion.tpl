<div class="modal fade" id="modalBecomeChampion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" {additional-modal-data}>
    <div class="modal-dialog">
        <div class="modal-content gray-bg-1">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h2 class="modal-title" id="modalTitle">Become a Hyperoptic Champion</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0 gray-bg-1">
                <p class="pad-left-fixed-15 font-13 font-w-500 gray-f-2"> Simply enter your details below and we'll get back to you soon to discuss helping your building connect to the UK's fastest broadband. </p>

                <form method="POST" id="becomeChampionForm" onsubmit="return becomeChampionSubmit()">
                    <input type="hidden" name="pafid" id="pafid"/>
                    <input type="hidden" name="siteid" id="siteid" value="{siteid}" />
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 pad-left-fixed-20 fp-padding-rl">
                        <p class="marg-top-fixed-10 font-13 gray-f-2"><b>Title</b></p>
                        <ul class="nav navbar-nav ri-dropdown-small">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                                    <span id="nameTitle">Mr</span>
                                    <input type="text" class="hidden" id="nameTitleInput" name="nameTitle" value="Mr"/>
                                    <span class="caret arow-down-ri "></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#" onclick="setDropDownValue('nameTitle','Mr')">Mr</a></li>
                                    <li><a href="#" onclick="setDropDownValue('nameTitle','Mrs')">Mrs</a></li>
                                    <li><a href="#" onclick="setDropDownValue('nameTitle','Miss')">Miss</a></li>
                                    <li><a href="#" onclick="setDropDownValue('nameTitle','Ms')">Ms</a></li>
                                    <li><a href="#" onclick="setDropDownValue('nameTitle','Dr')">Dr</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                    <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4 pad-left-percent-0 pad-right-percent-0 fp-padding-rl">
                        <p class="marg-top-fixed-10 font-13 gray-f-2"><b>First name</b></p>
                        <input name="firstname" id="championsFirstname" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="First name"
                               minlength="2" required/>
                    </div>
                    <div class="input-group-h col-xs-12 col-sm-12 col-md-5 col-lg-5">
                        <p class="marg-top-fixed-10 font-13 gray-f-2"><b>Last name</b></p>
                        <input name="lastname" id="championsLastname" type="text" class="longerThenOne acceptLettersOnly form-control input-ri" placeholder="Last name"
                               minlength="2" required/>
                    </div>
                    <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5">
                        <p class="marg-top-fixed-10 font-13 gray-f-2"><b>Address</b></p>
                        <input name="postcode" id="postcode" type="text" class="form-control input-ri" placeholder="Type postcode or address" minlength="2" required/>

                        <div id="postcodeResultsCloser" class="postcode-r-closer"></div>
                        <div id="postcodeResultsExtender" class="postcode-r-extender"></div>
                        <div id="postcodeResults" class="postcode-s-b left-percent-0 op-0"></div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0">
                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl">
                            <p class=" marg-top-fixed-10 font-13 gray-f-2"><b>Phone number</b></p>
                            <input type="text" id="championsPhone" class="phoneNumber form-control input-ri" name="phone" placeholder="Phone" required="required"/>
                        </div>
                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <p class=" marg-top-fixed-10 font-13 gray-f-2"> Mobile </p>
                            <input type="text" id="championsMobile" class="phoneUK form-control input-ri" placeholder="Mobile" name="mobile"/>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0 marg-bottom-fixed-15">
                        <div class="input-group-h col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-right-percent-0 pad-left-fixed-20 fp-padding-rl">
                            <p class=" marg-top-fixed-10 font-13 gray-f-2"><b>Email address</b></p>
                            <input type="text" id="championsEmail" class="validEmail form-control input-ri" placeholder="Email address" name="email" required/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="checkbox checkbox-success pad-top-fixed-15 font-13 gray-f-1">
                            <button type="submit" class="btn btn-primary " style="float:right">SUBMIT</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->