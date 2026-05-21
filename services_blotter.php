<?php
require('classes/resident.class.php');
$userdetails = $bmis->get_userdata();
$id_resident = $_GET['id_resident'];
$resident = $residentbmis->get_single_resident($id_resident);

$bmis->create_blotter();



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

        /* Modal */

        .applybutton {
            width: 100% !important;
            height: 50px !important;
            border-radius: 20px;
            margin-top: 5%;
            margin-bottom: 8%;
            font-size: 25px;
            letter-spacing: 2px;
        }

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

        /* Under Navbar */

        .container1 {
            position: relative;
            font-family: Arial;
            background-color: lightblue;
        }

        .text-block {
            position: absolute;
            bottom: 35%;
            right: 20%;
            background-color: black;
            opacity: .7;
            color: white;
            padding-left: 20px;
            padding-right: 20px;
            border-radius: 20px;
        }

        /* Slideshow */

        * {
            box-sizing: border-box;
        }

        .picture {
            position: relative;
            left: 15px;
            width: 102.7%;
        }

        .picture1 {
            height: 100px;
        }

        /* Position the image container (needed to position the left and right arrows) */
        .container2 {
            position: relative;
        }

        /* Hide the images by default */
        .mySlides {
            display: none;
        }

        /* Add a pointer when hovering over the thumbnail images */
        .cursor {
            cursor: grabbing;
        }

        /* Next & previous buttons */
        .prev,
        .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 30px;
            margin-top: -50px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            border-radius: 0 3px 3px 0;
            user-select: none;
            -webkit-user-select: none;
            cursor: grab;
        }

        /* Position the "next button" to the right */
        .next {
            right: 15px;
            border-radius: 3px 0 0 3px;
        }

        /* On hover, add a black background color with a little bit see-through */
        .prev:hover,
        .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Container for image text */
        .caption-container {
            position: relative;
            left: -15px;
            text-align: center;
            background-color: #222;
            padding: 5px;
            color: white;
            width: 102.7%;
            font-size: 25px;
        }

        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Six columns side by side */
        .column {
            width: 16.66%;
        }

        /* Add a transparency effect for thumnbail images */
        .demo {
            opacity: 0.6;
        }

        .active,
        .demo:hover {
            opacity: 1;
        }


        .paa {
            margin-top: 20px;
            position: relative;
            left: -28%;
        }

        /* Card Flip */

        .container3 {
            margin-top: 3%;
        }

        .flip-card {
            background-color: transparent;
            width: 300px;
            height: 300px;
            perspective: 1000px;
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front,
        .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
        }

        .flip-card-front {
            color: white;
        }

        .flip-card-back {
            padding: 7px;
            color: white;
            transform: rotateY(180deg);
        }

        /* Footer */

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

            .picture {
                width: 100% !important;
                left: 0 !important;
            }

            .caption-container {
                width: 100% !important;
                left: 0 !important;
                font-size: 18px;
            }

            .prev,
            .next {
                display: none;
            }

            .column {
                width: 33.333%;
            }

            .text-overlay {
                padding: 12px 16px;
            }

            .text-overlay h1 {
                font-size: 1.6rem;
                letter-spacing: 2px;
            }

            .flip-card {
                width: 100%;
                max-width: 320px;
                height: 260px;
                margin: 0 auto 1rem;
            }

            .flip-card-front h2,
            .flip-card-front h3 {
                font-size: 1.25rem;
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


    <nav class="navbar navbar-expand-lg navbar-dark custom-blue sticky-top">
        <div class="logo">
            <a href="#"><img src="assets/blink.png" alt="logo" style="height: 60px; border-radius: 50%;" /></a>
        </div>
        <a class="navbar-brand" href="resident_homepage.php"><b>BarangayLink</b></a>
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





    <!-- Under Navbar -->

    <style>
        .banner-container {
            position: relative;
            width: 100%;
            overflow: hidden;
            text-align: center;
        }

        .banner-container img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            object-position: center 35%;
            display: block;
        }

        .text-overlay {
            position: absolute;
            top: 55%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, 0.55);
            padding: 20px 40px;
            border-radius: 10px;
        }

        .text-overlay h1 {
            color: #ffffff;
            font-size: 4vw;
            letter-spacing: 5px;
            margin: 0;
            text-transform: uppercase;
        }

        @media (max-width: 768px) {
            .banner-container img {
                height: 250px;
            }
        }
    </style>

    <div class="banner-container">
        <img src="assets/EMS.png"  alt="Peace and Order Banner">

        <div class="text-overlay">
            <h1>Peace and Order</h1>
        </div>
    </div>



    <div id="down3"></div>

    <br>


    <!-- Slideshow -->


    <div class="container container3">
        <h1 style="text-align:center">Blotter Information</h1>
        <hr style="background-color: black;">

        <br>

        <div class="row">
            <div class="col">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front custom-blue">
                            <br>
                            <br>
                            <i class="fas fa-question-circle fa-4x"></i>
                            <br>
                            <br>
                            <h2>How can I file a Barangay Blotter?</h2>
                        </div>
                        <div class="flip-card-back bg-info">
                            <br>
                            <h5 style="font-size: 18px; line-height: 1.6;">
                                Step 1: Fill out the complaint form completely.<br><br>
                                Step 2: Review and confirm all information provided.<br><br>
                                Step 3: Submit the complaint and wait for schedule or mediation.
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front custom-blue">
                            <br>
                            <br>
                            <i class="fas fa-question-circle fa-4x"></i>
                            <br>
                            <br>
                            <h2>What is Barangay Blotter?</h2>
                        </div>
                        <div class="flip-card-back bg-info">
                            <br>
                            <h5 style="font-size: 22px; line-height: 1.4;">
                                A Barangay Blotter is an official logbook where complaints,
                                incidents, and disputes in the community are recorded.
                                It serves as the first step in resolving conflicts at the barangay level.
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front custom-blue">
                            <br>
                            <br>
                            <i class="fas fa-question-circle fa-4x"></i>
                            <br>
                            <br>
                            <h3>What is the purpose of Barangay Blotter?</h3>
                        </div>
                        <div class="flip-card-back  bg-info">
                            <br>
                            <h5 style="font-size: 22px; line-height: 1.6;">
                            The purpose of a barangay blotter is to document incidents
                            and complaints, provide an official record, and help in
                            resolving disputes or taking proper legal action.
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="down1"></div>

    <br>
    <br>
    <br>


    <!-- Button trigger modal -->

    <div class="container container4">

        <br><br>
        <h1 class="text-center">Complain</h1>

        <hr style="background-color:black;">

        <div class="col">
            <button type="button" class="btn btn-info applybutton" data-toggle="modal" data-target="#exampleModalCenter">
                Apply Form
            </button>
        </div>


        <!-- Modal -->

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Complain Form</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <!-- Modal Body -->

                    <div class="modal-body">
                        <form method="post" enctype="multipart/form-data">

                            <label> Complainant's Details: </label>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="lname">Last name:</label>
                                        <input name="lname" type="text" class="form-control uppercase-input" value="<?= $userdetails['surname'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label for="fname">First name:</label>
                                        <input name="fname" type="text" class="form-control uppercase-input" value="<?= $userdetails['firstname'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label for="mname">Middle name:</label>
                                        <input name="mi" type="text" class="form-control uppercase-input" value="<?= $userdetails['mname'] ?>">
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col">
                                    <div class="form-group">
                                        <label for="age" class="mtop">Age </label>
                                        <input name="age" type="number" class="form-control" value="<?= $userdetails['age'] ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label for="cno">Contact Number:</label>
                                        <input name="contact" type="text" maxlength="11" class="form-control" value="<?= $userdetails['contact'] ?>" pattern="[0-9]{11}" placeholder="0912-345-6789" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
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

                            <hr>

                            <label> Respondent's Details: </label>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="rlname">Last Name:</label>
                                        <input name="rlname" type="text" class="form-control uppercase-input" placeholder="Enter Last Name of Respondent" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="rfname">First Name:</label>
                                        <input name="rfname" type="text" class="form-control uppercase-input" placeholder="Enter First Name of Respondent" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="rmi">Middle Name:</label>
                                        <input name="rmi" type="text" class="form-control uppercase-input" placeholder="Enter Middle Name of Respondent">
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="rage">Age</label>
                                        <input name="rage" type="number" class="form-control" placeholder="Enter Age" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="rcontact">Contact Number:</label>
                                        <input name="rcontact" type="text" maxlength="11" class="form-control" pattern="[0-9]{11}" placeholder="09123456789" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="raddress">Address:</label>
                                        <input name="raddress" type="text" class="form-control uppercase-input" placeholder="Enter Address of Respondent" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <label> Incident Details: </label>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="type">Complaint:</label>
                                        <input name="type" type="text" class="form-control uppercase-input" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="date">Date of Incident:</label>
                                        <input name="date" type="date" class="form-control" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="time">Time of Incident:</label>
                                        <input name="time" type="time" class="form-control" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="location">Location of Incident:</label>
                                        <input name="location" type="text" class="form-control uppercase-input" placeholder="Enter Location of Incident" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>


                            <hr>

                            <h6>Guidelines for Narrative Report:</h6>

                            <p>
                            <ul style="font-size: 15px;">
                                <li>
                                    Use simple, everyday words rather than complex terminology.
                                </li>
                                <li>
                                    Be specific on your report
                                </li>
                                <li>
                                    Don't use bad words
                                </li>
                                <li>
                                    Clear and Easy to read report
                                </li>
                                <li>
                                    Don't use Emoji or any kind of Symbols.
                                </li>
                            </ul>
                            </p>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="report">Narrative Report:</label>
                                        <textarea class="form-control" rows="5" id="report" name="narrative" placeholder="Enter Message here" required></textarea>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="witness">Witnesses (if any):</label>
                                        <textarea class="form-control" rows="3" id="witness" name="witness" placeholder="Enter Witnesses here"></textarea>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="modal-footer" style="justify-content: flex-start; margin-left:85px;">
                                <div class="paa">
                                    <input name="id_resident" type="hidden" value="<?= $resident['id_resident'] ?>">
                                    <?php include('styled_button.php'); ?>
                                    <button id="styled_button_approve" type="submit" name="create_blotter" class="btn btn-success">Save changes</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Footer -->



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
        var slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("demo");
            var captionText = document.getElementById("caption");
            if (n > slides.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
            captionText.innerHTML = dots[slideIndex - 1].alt;
        }
    </script>

    <script>
        // Add the following code if you want the name of the file appear on select
        $(".custom-file-input").on("change", function() {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
    </script>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#blah')
                        .attr('src', e.target.result)
                        .width(470)
                        .height(350);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
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