
    <p class=" marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> What is your current download speed? </p>
    <ul class="nav navbar-nav ri-dropdown-medium">
        <li   class="dropdown"> <!-- Changing residential to bussines -->
            <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                <span id="currentSpeed"> -Select- </span>
                <input type="text" id="currentSpeedInput" class="hidden" name="currentSpeed" />
                <span class="caret arow-down-ri-big "></span></a>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" onclick="setDropDownValue('currentSpeed','< 10Mb')">< 10Mb</a></li>
                <li><a href="#" onclick="setDropDownValue('currentSpeed','10 - 20Mb')">10 - 20Mb</a></li>
                <li><a href="#" onclick="setDropDownValue('currentSpeed','21 - 50Mb')">21 - 50Mb</a></li>
                <li><a href="#" onclick="setDropDownValue('currentSpeed','51 - 100Mb')">51 - 100Mb</a></li>
                <li><a href="#" onclick="setDropDownValue('currentSpeed','101 - 300Mb')">101 - 300Mb</a></li>
                <li><a href="#" onclick="setDropDownValue('currentSpeed','300Mb+')">300Mbb+</a></li>
                <li><a href="#" onclick="setDropDownValue('currentSpeed','I dont have broadband')">I don't have broadband</a></li>

            </ul>
        </li>
    </ul>