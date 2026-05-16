<?php
require('classes/main.class.php');
require('classes/resident.class.php');

$userdetails = $bmis->get_userdata();
$bmis->create_certofres();
?>

<!DOCTYPE html>

<html>

<head>
    <title>Barangay Link</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js" integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w==" crossorigin="anonymous"></script>
    <!-- responsive tags for screen compatibility -->
    <meta name="viewport" content="width=device-width, initial-scale=1"><!-- bootstrap css -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
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

        .picture {
            height: 120px;
            width: 120px;
            position: relative;
            top: 160px; /* Adjust this to move them down a little bit */
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

        .card5 {
            width: 195px;
            height: 210px;
            overflow: auto;
            margin: auto;
            color: white;
        }

        .card4 {
            width: 195px;
            height: 210px;
            overflow: auto;
            margin: auto;
            color: white;
        }

        .card3 {
            width: 195px;
            height: 210px;
            overflow: hidden;
            margin: auto;
            color: white;
        }

        .card2 {
            width: 195px;
            height: 210px;
            overflow: auto;
            margin: auto;
            color: white;
        }

        .card1 {
            width: 195px;
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
    </style>
    <nav class="navbar navbar-expand-lg custom-blue sticky-top">
        <div class="logo">
            <a href="#"><img src="assets/blink.png" alt="logo" style="height: 60px; border-radius:50%;" /></a>
        </div>
        <a class="navbar-brand" href="resident_homepage.php"><b>BarangayLink</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
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
                    <h1 class="text1">Certificate of Residency </h1>

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
                <br>
                <h1>Procedure</h1>
                <hr style="background-color: black;">
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col">
                <i class="fas fa-id-card fa-4x"></i>

                <br>
                <br>

                <h3>Step 1: Prepare</h3>
                <p style="text-align:left;">Prepare all of the information that will be<br> needed
                    in acquiring a certificate of residency.</p>

            </div>
            <div class="col">
                <i class="fas fa-laptop fa-4x"></i>

                <br>
                <br>

                <h3>Step 2: Apply</h3>
                <p style="text-align:left;">Apply in our system and fill-up the entire form
                    given below.</p>
            </div>
            <div class="col">
                <i class="fas fa-file fa-4x"></i>

                <br>
                <br>

                <h3>Step 3: Release</h3>
                <p style="text-align:left;">Releasing of your document. Please bring any valid ID.</p>

            </div>
        </div>

    </div>

    <div id="down2"></div>

    <br>
    <br>
    <br>


    </div>
    </div>

    <div id="down1"></div>


    <!-- Button trigger modal -->

    <div class="container">
        <br><br>
        <h1 class="text-center">Registration</h1>
        <hr style="background-color:black;">

        <div class="col">
            <button type="button" class="btn btn-info applybutton" data-toggle="modal" data-target="#exampleModalCenter">
                Request Form
            </button>

        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Certificate of Residency Form</h5>
                        <button type="button" class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>

                    <form method="post" enctype="multipart/form-data">

                        <div class="modal-body" style="max-height:70vh; overflow-y:auto;">

                            <h6> Personal Information </h6>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Last Name:</label>
                                        <input name="lname" type="text" class="form-control uppercase-input"
                                            value="<?= $userdetails['surname'] ?>" required>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>First Name:</label>
                                        <input name="fname" type="text" class="form-control uppercase-input"
                                            value="<?= $userdetails['firstname'] ?>" required>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Middle Name:</label>
                                        <input name="mi" type="text" class="form-control uppercase-input"
                                            value="<?= $userdetails['mname'] ?>">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>House No:</label>
                                        <input type="text" class="form-control uppercase-input" name="houseno"
                                            value="<?= $userdetails['houseno'] ?>" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Street:</label>
                                        <input type="text" class="form-control uppercase-input" name="street"
                                            value="<?= $userdetails['street'] ?>" required>
                                    </div>
                                </div>

                                <input type="hidden" name="brgy" value="<?= $userdetails['brgy'] ?>">
                                <input type="hidden" name="municipal" value="<?= $userdetails['municipal'] ?>">
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <label>Date of Birth</label>
                                    <input type="date" name="bdate" class="form-control"
                                        value="<?= $userdetails['bdate'] ?>" required>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Place of Birth:</label>
                                        <input type="text" class="form-control uppercase-input" name="bplace"
                                            value="<?= $userdetails['bplace'] ?>" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Civil Status:</label>
                                        <select class="form-control" name="civil_status" required>
                                            <option value="">Choose your Status</option>
                                            <option value="Single">Single</option>
                                            <option value="In a relationship">In a relationship</option>
                                            <option value="Engaged">Engaged</option>
                                            <option value="Married">Married</option>
                                            <option value="Widowed">Widowed</option>
                                            <option value="Divorces">Divorced</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Citizenship:</label>
                                        <input type="text" class="form-control uppercase-input" name="nationality"
                                                value="FILIPINO" readonly required>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Occupation:</label>
                                        <input type="text" class="form-control uppercase-input" name="occupation"
                                            value="<?= $userdetails['occupation'] ?>" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Contact No:</label>
                                        <input type="text" class="form-control" name="contact"
                                            value="<?= $userdetails['contact'] ?>" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email Address:</label>
                                        <input type="email" class="form-control" name="email"
                                            value="<?= $userdetails['emailadd'] ?>" required>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <h6>Residency Deatails</h6>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Stay duration:</label>
                                        <select class="form-control" name="resident_since" required>
                                            <option value="">Choose your Resident Since</option>
                                            <option value="Less than 1 year">Less than 6 months</option>
                                            <option value="6 months to 1 year">6 months to 1 year</option>
                                            <option value="1-5 years">1-5 years</option>
                                            <option value="More than 5 years">More than 5 years</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Purpose:</label>
                                        <select class="form-control" name="purpose" required>
                                            <option value="">Choose your Purposes</option>
                                            <option value="Job/Employment">Job Application</option>
                                            <option value="Business Permit">Business Permit</option>
                                            <option value="Postal ID Application">Postal ID Application</option>
                                            <option value="School Requirement">School Requirement</option>
                                            <option value="Other important transactions.">Other important transactions.</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Date Needed:</label>
                                        <input type="date" class="form-control" name="date"
                                            min="<?php echo date('Y-m-d'); ?>" required>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <h6>REQUIREMENTS SUBMITTED (Please check all that apply):</h6>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="requirements[]" value="Valid ID">
                                <label class="form-check-label">Valid Government ID (with current address)</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="requirements[]" value="Utility Bill">
                                <label class="form-check-label">Utility Bill (under applicant's name)</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="requirements[]" value="Cedula">
                                <label class="form-check-label">Community Tax Certificate (Cedula)</label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="requirements[]" value="Homewowners' Association Endorsement">
                                <label class="form-check-label">Homewowners' Association Endorsement</label>
                            </div>

                            <hr>

                            <h6>Attach your requirements here (png, jpg, jpeg):</h6>

                            <div class="form-group">
                                <input type="file" class="form-control-file"
                                    name="attachment[]" accept=".png, .jpg, .jpeg" multiple required>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <input name="id_resident" type="hidden" value="<?= $userdetails['id_resident'] ?>">

                            <?php include('styled_button.php'); ?>

                            <button name="create_certofres" type="submit" class="btn btn-success">Submit Request</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>

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
    </div>
</body>

</html>
<?php include('footer2.php'); ?>