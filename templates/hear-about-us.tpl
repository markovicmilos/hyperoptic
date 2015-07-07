<div class="input-group-h dropdown-error-message col-xs-12 col-sm-12 col-md-12 col-lg-12 pad-left-percent-0 pad-right-percent-0 " >
        <p class="marg-top-fixed-10 font-13 gray-f-2 let-space-minus-05 font-13-1600-1700"> How did you hear about us? </p>
        <ul class="nav navbar-nav {class-dropdown} dropdown-has-error">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle font-16 font-w-500 gray-f-2" data-toggle="dropdown" role="button" aria-expanded="false">
                    <span id="aboutUs"> -Select- </span>
                    <input type="text" id="aboutUsInput" class="hidden" name="aboutUs" required="required"/>
                    <span class="caret arow-down-ri-big "></span>
                </a>
                <ul class="dropdown-menu" role="menu" >
                    <!-- START BLOCK : about-us-item -->
                    <li><a href="#" onclick="setDropDownValue('aboutUs','{name}','{value}')">{name}</a></li>
                    <!-- END BLOCK : about-us-item -->
                </ul>
            </li>
        </ul>
</div>