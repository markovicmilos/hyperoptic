<!-- Leased Line Modal -->
<div class="modal fade" id="leasedLineModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <form id="leasedLineForm" method="post">
            <div class="modal-content gray-bg-1 modal-wf-abd">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span
                                class="sr-only">Close</span></button>
                    <h2 class="modal-title" id="myModalLabel"> Leased Line/Shared Leased Line </h2>
                </div>
                <!-- /.modal-body -->
                <div class="panel-body pad-all-0">
                    <div class="row container-fluid"> <!-- Row for Building Manager -->
                        <div id="bum-form"> <!-- Building manager details form  -->

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-right-percent-0 pad-bottom-fixed-30 pad-left-percent-0">
                                <!-- Column Registering interest  -->
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5">
                                    <!-- Column 2 Adress -->
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Business name </p>
                                    <input type="text" class="form-control input-ri" placeholder="Business name" name="companyName" required="required"/>
                                </div>

                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pad-left-fixed-15 pad-right-percent-0">
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Title </p>
                                    <ul class="nav navbar-nav ri-dropdown-small">
                                        <li class="dropdown"> <!-- Changing residential to bussines -->
                                            <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2"
                                               data-toggle="dropdown" role="button" aria-expanded="false">
                                                <span id="nameTitle">Mr</span>
                                                <input type="text" class="hidden" id="nameTitleInput" name="nameTitle"
                                                       value="Mr"/>
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
                                <div id="first-name-bu" class="input-group-h col-xs-12 col-sm-12 col-md-5 col-lg-5">
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> First Name </p>
                                    <input type="text" class="longerThenOne acceptLettersOnly form-control input-ri"
                                           placeholder="First Name" name="firstname" minlength="2" required="required"/>
                                </div>
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-5 col-lg-5">
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Last Name </p>
                                    <input type="text" class="longerThenOne acceptLettersOnly form-control input-ri"
                                           placeholder="Last Name" name="lastname" minlength="2" required="required"/>
                                </div>

                                <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5">
                                    <!-- Column 2 Adress -->
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Address </p>
                                    <input type="text" class="form-control input-ri" placeholder="Address"
                                           name="address" minlength="3"/>
                                </div>
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-all-0">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 marg-top-fixed-5">
                                        <!-- Column 2 Adress -->
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> City </p>
                                        <input type="text" class="acceptLettersOnly form-control input-ri"
                                               placeholder="City" name="city" minlength="2"/>
                                    </div>
                                </div>
                                <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4 marg-top-fixed-5">
                                    <!-- Column 2 Adress -->
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2"> Postcode </p>
                                    <input type="text" class="postcodeUK form-control input-ri" placeholder="Postcode"
                                           name="postcode"/>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0">
                                    <!-- Column 3 -->
                                    <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> Landline number </p>
                                        <input type="text" class="phoneUK form-control input-ri"
                                               placeholder="Landline number" name="phone" required="required"/>
                                    </div>
                                    <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> Mobile number </p>
                                        <input type="text" class="phoneNumber form-control input-ri"
                                               placeholder="Mobile number" name="mobile"/>
                                    </div>
                                    <div class="input-group-h col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2"> Email Address </p>
                                        <input type="text" class="validEmail form-control input-ri" placeholder="Email Address"
                                               name="email" required="required"/>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-15">
                                    <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700">
                                        Product details: </p>
                                    <ul class="nav navbar-nav ri-dropdown-big">
                                        <li class="dropdown"> <!-- Changing residential to bussines -->
                                            <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2"
                                               data-toggle="dropdown" role="button" aria-expanded="false">
                                                <span id="leasedLine"> -Select- </span>
                                                <input type="text" id="leasedLineInput" class="hidden"
                                                       name="leasedLine"/>
                                                <span class="caret arow-down-ri-big"></span></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#" onclick="setDropDownValue('leasedLine','Leased Line')">Leased
                                                        Line</a></li>
                                                <li><a href="#"
                                                       onclick="setDropDownValue('leasedLine','Shared leased line')">Shared
                                                        leased line</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 marg-top-fixed-5 pad-all-0">
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-15">
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700">
                                            What is your current download speed? </p>
                                        <ul class="nav navbar-nav ri-dropdown-big">
                                            <li class="dropdown"> <!-- Changing residential to bussines -->
                                                <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2"
                                                   data-toggle="dropdown" role="button" aria-expanded="false">
                                                    <span id="currentSpeed"> -Select- </span>
                                                    <input type="text" id="currentSpeedInput" class="hidden"
                                                           name="currentSpeed"/>
                                                    <span class="caret arow-down-ri-big "></span></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#" onclick="setDropDownValue('currentSpeed','< 10Mb')"><
                                                            10Mb</a></li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentSpeed','10 - 20Mb')">10 -
                                                            20Mb</a></li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentSpeed','21 - 50Mb')">21 -
                                                            50Mb</a></li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentSpeed','51 - 100Mb')">51 -
                                                            100Mb</a></li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentSpeed','101 - 300Mb')">101
                                                            - 300Mb</a></li>
                                                    <li><a href="#" onclick="setDropDownValue('currentSpeed','300Mb+')">300Mb+</a>
                                                    </li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentSpeed','I dont have broadband')">I
                                                            don't have broadband</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 pad-left-fixed-15">
                                        <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700">
                                            What is your current broadband monthly price? </p>
                                        <ul class="nav navbar-nav ri-dropdown-big">
                                            <li class="dropdown"> <!-- Changing residential to bussines -->
                                                <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2"
                                                   data-toggle="dropdown" role="button" aria-expanded="false">
                                                    <span id="currentPrice"> -Select- </span>
                                                    <input type="text" id="currentPriceInput" class="hidden"
                                                           name="currentPrice"/>
                                                    <span class="caret arow-down-ri-big "></span></a>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#" onclick="setDropDownValue('currentPrice','< £50')"><
                                                            £50</a></li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentPrice','£50-£99')">£50-£99</a>
                                                    </li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentPrice','£100-£249')">£100-£249</a>
                                                    </li>
                                                    <li><a href="#"
                                                           onclick="setDropDownValue('currentPrice','£250-£449')">£250-£449</a>
                                                    </li>
                                                    <li><a href="#" onclick="setDropDownValue('currentPrice','£450+')">£450+</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                            <!-- End of Registering interest column -->
                        </div>
                        <!-- Building details form  -->
                    </div>
                    <!-- End of Row for Building Manager -->
                </div>
                <!-- /.modal-body -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-bottom-fixed-20 pad-left-fixed-20 gray-bg-1">
                    <div class="checkbox checkbox-success pad-top-fixed-15 font-13 gray-f-1 b-t-1px-gray">
                        <button type="submit" class="btn btn-primary" style="float:right">SEND</button>
                    </div>
                </div>
            </div>
        </form>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div><!-- /.modal Leased Line end -->
