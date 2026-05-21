<?php
require('classes/main.class.php');
require('classes/resident.class.php');
$userdetails = $bmis->get_userdata();
$bmis->create_certofindigency();

?>

<!DOCTYPE html>

<html>

<head>
    <title> Barangay Link </title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js" integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w==" crossorigin="anonymous"></script>
    <!-- responsive tags for screen compatibility -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!-- bootstrap css -->
    <link href="bootstrap.css" rel="stylesheet" type="text/css">
    <!-- fontawesome icons -->
    <script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>

    <style>
        /* Navbar Buttons */

        .btn1 {
            border-radius: 20px;
            border: none;
            /* Remove borders */
            color: white;
            /* White text */
            font-size: 16px;
            /* Set a font size */
            cursor: pointer;
            /* Mouse pointer on hover */
            margin-left: 13%;
            padding: 8px 22px;
        }

        .btn2 {
            border-radius: 20px;
            border: none;
            /* Remove borders */
            color: white;
            /* White text */
            font-size: 16px;
            /* Set a font size */
            cursor: pointer;
            /* Mouse pointer on hover */
            padding: 8px 22px;
            margin-left: .1%;
        }

        .btn3 {
            border-radius: 20px;
            border: none;
            /* Remove borders */
            color: white;
            /* White text */
            font-size: 16px;
            /* Set a font size */
            cursor: pointer;
            /* Mouse pointer on hover */
            padding: 8px 22px;
            margin-left: .1%;
        }

        .btn4 {
            border-radius: 20px;
            border: none;
            /* Remove borders */
            color: white;
            /* White text */
            font-size: 16px;
            /* Set a font size */
            cursor: pointer;
            /* Mouse pointer on hover */
            padding: 8px 22px;
            margin-left: .1%;
        }

        .btn5 {
            border-radius: 20px;
            border: none;
            /* Remove borders */
            color: white;
            /* White text */
            font-size: 16px;
            /* Set a font size */
            cursor: pointer;
            /* Mouse pointer on hover */
            padding: 8px 22px;
            margin-left: .1%;
        }

        /* Darker background on mouse-over */
        .btn1:hover {
            background-color: RoyalBlue;
            color: black;
        }

        .btn2:hover {
            background-color: RoyalBlue;
            color: black;
        }

        .btn3:hover {
            background-color: RoyalBlue;
            color: black;
        }

        .btn4:hover {
            background-color: RoyalBlue;
            color: black;
        }

        .btn5:hover {
            background-color: RoyalBlue;
            color: black;
        }

        /* Back-to-Top */

        .top-link {
            transition: all 0.25s ease-in-out;
            position: fixed;
            bottom: 0;
            right: 0;
            display: inline-flex;
            cursor: pointer;
            align-items: center;
            justify-content: center;
            margin: 0 3em 3em 0;
            border-radius: 50%;
            padding: 0.25em;
            width: 80px;
            height: 80px;
            background-color: #3661D5;
        }

        .top-link.show {
            visibility: visible;
            opacity: 1;
        }

        .top-link.hide {
            visibility: hidden;
            opacity: 0;
        }

        .top-link svg {
            fill: white;
            width: 24px;
            height: 12px;
        }

        .top-link:hover {
            background-color: #3498DB;
        }

        .top-link:hover svg {
            fill: #000000;
        }

        .screen-reader-text {
            position: absolute;
            clip-path: inset(50%);
            margin: -1px;
            border: 0;
            padding: 0;
            width: 1px;
            height: 1px;
            overflow: hidden;
            word-wrap: normal !important;
            clip: rect(1px, 1px, 1px, 1px);
        }

        .screen-reader-text:focus {
            display: block;
            top: 5px;
            left: 5px;
            z-index: 100000;
            clip-path: none;
            background-color: #eee;
            padding: 15px 23px 14px;
            width: auto;
            height: auto;
            text-decoration: none;
            line-height: normal;
            color: #444;
            font-size: 1em;
            clip: auto !important;
        }

        .container1 {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('assets/EMS.png') no-repeat center 40%;
            background-size: cover;
            height: 500px;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            }

        .applybutton {
            width: 100% !important;
            height: 50px !important;
            border-radius: 20px;
            margin-top: 5%;
            margin-bottom: 8%;
            font-size: 25px;
            letter-spacing: 2px;
        }

        .paa {
            margin-top: 10px;
            position: relative;
            left: -28%;
        }

        .text1 {
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.55);
            padding: 20px 50px;
            border-radius: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            font-size: 50px;
            color: #ffffff;
            font-size: 4vw;
            letter-spacing: 5px;
            margin: 0;
            text-transform: uppercase;
        }
        

        .picture {
            height: 120px;
            width: 120px;
            position: relative;
            top: 150px; /* Adjust this to move them down a little bit */
        }

        /* width */
        ::-webkit-scrollbar {
            width: 5px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .card4 {
            width: 250px;
            height: 210px;
            overflow: hidden;
            margin: auto;
            color: white;
        }

        .card3 {
            width: 250px;
            height: 210px;
            overflow: hidden;
            margin: auto;
            color: white;
        }

        .card2 {
            width: 250px;
            height: 210px;
            overflow: auto;
            margin: auto;
            color: white;
        }

        .card1 {
            width: 250px;
            height: 210px;
            overflow: auto;
            margin: auto;
            color: white;
        }

        a {
            color: white;
        }

        .shfooter .collapse {
            display: inherit;
        }

        @media (max-width:767px) {
            .shfooter ul {
                margin-bottom: 0;
            }

            .shfooter .collapse {
                display: none;
            }

            .shfooter .collapse.show {
                display: block;
            }

            .shfooter .title .fa-angle-up,
            .shfooter .title[aria-expanded=true] .fa-angle-down {
                display: none;
            }

            .shfooter .title[aria-expanded=true] .fa-angle-up {
                display: block;
            }

            .shfooter .navbar-toggler {
                display: inline-block;
                padding: 0;
            }

        }

        .resize {
            text-align: center;
        }

        .resize {
            margin-top: 3rem;
            font-size: 1.25rem;
        }

        /*RESIZESCREEN ANIMATION*/
        .fa-angle-double-right {
            animation: rightanime 1s linear infinite;
        }

        .fa-angle-double-left {
            animation: leftanime 1s linear infinite;
        }

        @keyframes rightanime {
            50% {
                transform: translateX(10px);
                opacity: 0.5;
            }

            100% {
                transform: translateX(10px);
                opacity: 0;
            }
        }

        @keyframes leftanime {
            50% {
                transform: translateX(-10px);
                opacity: 0.5;
            }

            100% {
                transform: translateX(-10px);
                opacity: 0;
            }
        }

        /* Contact Chip */

        .chip {
            display: inline-block;
            padding: 0 25px;
            height: 50px;
            line-height: 50px;
            border-radius: 25px;
            background-color: #2C54C1;
            margin-top: 5px;
        }

        .chip img {
            float: left;
            margin: 0 10px 0 -25px;
            height: 50px;
            width: 50px;
            border-radius: 50%;
        }

        .zoom {
            transition: transform .3s;
        }

        .zoom:hover {
            -ms-transform: scale(1.4);
            /* IE 9 */
            -webkit-transform: scale(1.4);
            /* Safari 3-8 */
            transform: scale(1.4);
        }

        .uppercase-input {
            text-transform: uppercase;
        }

        /* Mobile responsiveness overrides */
        @media (max-width: 767px) {
            body {
                overflow-x: hidden;
            }

            .top-link {
                width: 52px;
                height: 52px;
                margin: 0 1rem 1rem 0;
            }

            .btn1,
            .btn2,
            .btn3,
            .btn4,
            .btn5 {
                margin-left: 0 !important;
                width: 100%;
                display: block;
                padding: 10px 14px;
                font-size: 14px;
                text-align: center;
            }

            .row>
            .col {
                flex: 0 0 100%;
                max-width: 100%;
            }

            .container1 {
                height: 320px !important;
            }

            .header {
                max-width: 95%;
                margin: 20px auto 10px auto;
                padding: 12px 14px;
            }

            .container1 .text1 {
                position: static !important;
                transform: none !important;
                font-size: 1.6rem !important;
                padding: 12px 16px !important;
                letter-spacing: 2px !important;
                background: rgba(0, 0, 0, 0.55);
                border-radius: 10px;
                display: inline-block;
            }

            .picture {
                width: 72px !important;
                height: 72px !important;
                position: static !important;
                top: auto !important;
            }

            .applybutton {
                font-size: 18px !important;
                letter-spacing: 1px;
            }

            .paa {
                left: 0 !important;
                text-align: center;
            }

            .modal-footer {
                margin-left: 0 !important;
                justify-content: center !important;
            }

            .modal-dialog {
                margin: 0.5rem;
            }
        }
    </style>
</head>

<body>

    <!-- Back-to-Top and Back Button -->

    <a data-toggle="tooltip" title="Back-To-Top" class="top-link hide" href="" id="js-top">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 6">
            <path d="M12 6H0l6-6z" />
        </svg>
        <span class="screen-reader-text">Back to top</span>
    </a>

    <!-- Eto yung navbar -->

    <style>
        .text1 {
            font-size: 2.5rem;
        }

        .text2 {
            font-size: 1.1rem;
        }

        .picture {
            width: 100px;
            height: auto;
        }

        .custom-blue {
            background-color: #1d4ed8;
            /* Tailwind blue-700 color */
            color: white !important;
        }

        /* Navbar styling to match resident_homepage.php (design-only) */
        .navbar.custom-blue {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1);
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
        }

        .navbar.custom-blue .navbar-brand {
            font-weight: 700;
            font-size: 1.125rem;
        }

        .navbar.custom-blue .navbar-nav .nav-link {
            color: #fff !important;
            border-radius: 0.375rem;
            padding: 0.5rem 0.75rem;
        }

        .navbar.custom-blue .navbar-nav .nav-link:hover,
        .navbar.custom-blue .navbar-nav .nav-link:focus {
            color: #e5e7eb !important;
            background-color: rgba(37, 99, 235, 0.4);
        }

        .navbar.custom-blue .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.35);
            border-radius: 0.375rem;
            padding: 0.35rem 0.55rem;
        }

        .navbar.custom-blue .navbar-toggler:hover {
            background-color: rgba(37, 99, 235, 0.7);
        }

        .navbar.custom-blue .navbar-toggler:focus {
            box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.25);
        }

        .navbar.custom-blue .navbar-toggler i {
            color: #fff;
            font-size: 1.25rem;
            line-height: 1;
        }

        @media (max-width: 991.98px) {
            .navbar.custom-blue .navbar-collapse {
                margin-top: 0.5rem;
                padding: 0.5rem;
                border: 1px solid rgba(255, 255, 255, 0.1);
                border-radius: 0.5rem;
                background-color: rgba(30, 64, 175, 0.4);
            }

            .navbar.custom-blue .navbar-nav {
                gap: 0.25rem;
            }
        }
    </style>
    <nav class="navbar navbar-expand-lg navbar-dark custom-blue sticky-top">
        <div class="logo">
            <a href="#"><img src="assets/blink.png" alt="logo" style="height: 60px; border-radius:50%;" /></a>
        </div>
        <a class="navbar-brand" href="resident_homepage.php"><b> BarangayLink</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars" aria-hidden="true"></i>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a href="resident_homepage.php" class="nav-link">HOME</a>
                </li>
                <li class="nav-item">
                    <a href="#down3" class="nav-link">PROCEDURE</a>
                </li>
                <li class="nav-item">
                    <a href="#down1" class="nav-link">REGISTRATION</a>
                </li>
            </ul>
        </div>
    </nav>



    <div class="container-fluid container1" style="height:450px;">
        <div class="row">
            <div class="col">
                <div class="header">
                    <h1 class="text1">Certificate of Indigency </h1>

                </div>

                <br>

                <div class="d-flex justify-content-center">
                    <img class="picture" src="icons/Documents/docu1.png" alt="Document 1">&nbsp;
                    <img class="picture" src="icons/Documents/docu3.png" alt="Document 3">&nbsp;
                    <img class="picture" src="icons/Documents/docu2.png" alt="Document 2">&nbsp;
                </div>
            </div>
        </div>
    </div>

    <div id="down3"></div>

    <br>
    <br>


    <div class="container text-center">
        <div class="row">
            <div class="col">

                <h1>Procedure</h1>
                <hr style="background-color: black;">
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col">
                <br>
                <i class="fas fa-id-card fa-4x"></i>

                <br>
                <br>

                <h3>Step 1: Prepare</h3>
                <p style="text-align:left;">Prepare all of the information that will be needed
                    in acquiring a certificate of residency.</p>
            </div>

            <div class="col">
                <i class="fas fa-laptop fa-4x"></i>

                <br>
                <br>

                <h3>Step 2: Fill-Up</h3>
                <p style="text-align:left;">Fill-Up the entire form in our system.</p>
            </div>

            <div class="col">
                <br>
                <br>

                <i class="fas fa-user-check fa-4x"></i>

                <br>
                <br>

                <h3>Step 3: Assessment</h3>
                <p style="text-align:left;">Verify all of the information you've been given
                    in our system that we can use to make the information of your document
                    accurately.</p>
            </div>

            <div class="col">
                <i class="fas fa-file fa-4x"></i>

                <br>
                <br>

                <h3>Step 4: Release</h3>
                <p style="text-align:left;">Releasing of your Certificate of Indigency. Please bring any valid ID. </p>

            </div>
        </div>

        <div id="down2"></div>

        <br>
        <br>
        <br>


    </div>
    </div>
    </div>

    <div id="down1"></div>


    <!-- Button trigger modal -->

    <div class="container">

        <h1 class="text-center">Registration</h1>
        <hr style="background-color:black;">

        <div class="col">
            <button type="button" class="btn btn-info applybutton" data-toggle="modal" data-target="#exampleModalCenter">
                Request Form
            </button>

        </div>


        <!-- Modal -->

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Certificate of Indigency Form</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <!-- Modal Body -->

                    <div class="modal-body">
                        <form method="post">

                            <div class="row">

                                <div class="col">
                                    <div class="form-group">
                                        <label for="fname">First Name:</label>
                                        <input name="fname" type="text" class="form-control uppercase-input"
                                            placeholder="Enter First Name" value="<?= $userdetails['firstname'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label for="mi" class="mtop">Middle Name: </label>
                                        <input name="mi" type="text" class="form-control uppercase-input"
                                            placeholder="Enter Middle Name" value="<?= $userdetails['mname'] ?>">
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="lname">Last Name:</label>
                                        <input name="lname" type="text" class="form-control uppercase-input"
                                            placeholder="Enter Last Name" value="<?= $userdetails['surname'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--<label class="mtop">Nationality: </label>-->
                                <input type="hidden" class="form-control" name="nationality"
                                    placeholder="Enter Nationality" value="Filipino" required>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label> House No: </label>
                                        <input type="text" class="form-control uppercase-input" name="houseno"
                                            placeholder="Enter House No." value="<?= $userdetails['houseno'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label> Street: </label>
                                        <input type="text" class="form-control uppercase-input" name="street"
                                            placeholder="Enter Street" value="<?= $userdetails['street'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <!--<label> Barangay: </label>-->
                                <input type="hidden" class="form-control" name="brgy"
                                    placeholder="Enter Barangay" value="<?= $userdetails['brgy'] ?>" required>


                                <!--<label> Municipality: </label>-->
                                <input type="hidden" class="form-control" name="municipal"
                                    placeholder="Enter Municipality" value="<?= $userdetails['municipal'] ?>" required>

                            </div>

                            <div class="row">
                                    <div class="col-md-4">
                                        <label>Date of Birth</label>
                                        <input type="date" name="bdate" class="form-control" value="<?= $userdetails['bdate'] ?>" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Age</label>
                                        <input type="number" name="age" class="form-control" value="<?= $userdetails['age'] ?>" required>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Resident Since</label>
                                        <input type="date" name="resident_since" class="form-control">
                                    </div>
                            </div>

                            <div class="row">

                                <div class="col">
                                    <div class="form-group">
                                        <label for="purposes">Purposes:</label>
                                        <select class="form-control" name="purpose" id="purposes" required>
                                            <option value="">Choose your Purposes</option>
                                            <option value="Job/Employment">Job/Employment</option>
                                            <option value="Business Establishment">Business Requirement</option>
                                            <option value="Financial Transaction">Financial Transaction</option>
                                            <option value="Scholarship">Scholarship</option>
                                            <option value="Other important transactions.">Other important transactions.</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>


                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop">Date Needed: </label>
                                        <input type="date" class="form-control" name="date" required min="<?php echo date('Y-m-d'); ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                            </div>


                    </div>



                    <!-- Modal Footer -->

                    <div class="modal-footer" style="justify-content: flex-start; margin-left:100px;">
                        <div class="paa">
                            <input name="id_resident" type="hidden" class="form-control" value="<?= $userdetails['id_resident'] ?>">
                            <?php include('styled_button.php'); ?>
                            <button id="styled_button_approve" name="create_certofindigency" type="submit" class="btn btn-success">Submit Request</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>

    <br>
    <br>
    <br>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.uppercase-input').forEach(function(field) {
                field.value = field.value.toUpperCase();
                field.addEventListener('input', function() {
                    this.value = this.value.toUpperCase();
                });
            });
        });
    </script>

    <script>
        // Set a variable for our button element.
        const scrollToTopButton = document.getElementById('js-top');

        // Let's set up a function that shows our scroll-to-top button if we scroll beyond the height of the initial window.
        const scrollFunc = () => {
            // Get the current scroll value
            let y = window.scrollY;

            // If the scroll value is greater than the window height, let's add a class to the scroll-to-top button to show it!
            if (y > 0) {
                scrollToTopButton.className = "top-link show";
            } else {
                scrollToTopButton.className = "top-link hide";
            }
        };

        window.addEventListener("scroll", scrollFunc);

        const scrollToTop = () => {
            // Let's set a variable for the number of pixels we are from the top of the document.
            const c = document.documentElement.scrollTop || document.body.scrollTop;

            // If that number is greater than 0, we'll scroll back to 0, or the top of the document.
            // We'll also animate that scroll with requestAnimationFrame:
            // https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame
            if (c > 0) {
                window.requestAnimationFrame(scrollToTop);
                // ScrollTo takes an x and a y coordinate.
                // Increase the '10' value to get a smoother/slower scroll!
                window.scrollTo(0, c - c / 10);
            }
        };

        // When the button is clicked, run our ScrolltoTop function above!
        scrollToTopButton.onclick = function(e) {
            e.preventDefault();
            scrollToTop();
        }
    </script>

    <script>
        $(document).ready(function() {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>

    <script>
        $(document).ready(function() {
            // Add smooth scrolling to all links
            $("a").on('click', function(event) {

                // Make sure this.hash has a value before overriding default behavior
                if (this.hash !== "") {
                    // Prevent default anchor click behavior
                    event.preventDefault();

                    // Store hash
                    var hash = this.hash;

                    // Using jQuery's animate() method to add smooth page scroll
                    // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 800, function() {

                        // Add hash (#) to URL when done scrolling (default click behavior)
                        window.location.hash = hash;
                    });
                } // End if
            });
        });
    </script>

    <script src="bootstrap/js/bootstrap.bundle.js" type="text/javascript"> </script>

</body>

</html>
<br><br><br><br>
<?php include('footer.php'); ?>