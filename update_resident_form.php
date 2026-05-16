<?php
ini_set('display_errors', 0);
error_reporting(E_ALL ^ E_WARNING);
include('classes/staff.class.php');
include('classes/resident.class.php');

$userdetails = $bmis->get_userdata();
$bmis->validate_admin();
$rescount = $residentbmis->count_resident();
$rescountm = $residentbmis->count_male_resident();
$rescountf = $residentbmis->count_female_resident();
$rescountfh = $residentbmis->count_head_resident();
$rescountfm = $residentbmis->count_member_resident();
$rescountvoter = $residentbmis->count_voters();
$rescountsenior = $residentbmis->count_resident_senior();

$staffcount = $staffbmis->count_staff();
$staffcountm = $staffbmis->count_mstaff();
$staffcountf = $staffbmis->count_fstaff();

$view = $residentbmis->view_resident();
$residentbmis->create_resident();
$upstaff = $residentbmis->update_resident();
$residentbmis->delete_resident();

// Fetch resident data based on GET parameter
$resident_data = null;
if (isset($_GET['id_resident'])) {
    $connection = $residentbmis->openConn();
    $stmt = $connection->prepare("SELECT * FROM tbl_resident WHERE id_resident = ?");
    $stmt->execute([$_GET['id_resident']]);
    $resident_data = $stmt->fetch(PDO::FETCH_ASSOC);
    $connection = null;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>East Modern Site Barangay Information System</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <?php
    include('dashboard_sidebar_start.php');
    ?>
    <!-- End of Sidebar -->
    <style>
        .search {
            text-align: center;
        }

        .password-input {
            position: relative;
        }

        .password-input input {
            padding-right: 30px;
            /* Adjust the padding to accommodate the icon */
        }

        .password-input .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            /* Adjust the position as needed */
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 1;
        }
    </style>

    <!-- Begin Page Content -->
    <div class="container-fluid">
        <h1 class="mb-4 text-center">Barangay Residents Data</h1>

        <hr>
        <br>

        <!-- Page Heading -->

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white"> Update Barangay Resident</div>
                    <div class="card-body">
                        <form method="post">
                            <input type="hidden" name="resident_id" value="<?= isset($resident_data['id_resident']) ? $resident_data['id_resident'] : ''; ?>">
                            <input type="hidden" name="id_admin" value="<?= $userdetails['id_admin']; ?>">
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label> Last Name: </label>
                                        <input type="text" class="form-control" name="lname" placeholder="Enter Last Name" value="<?= isset($resident_data['lname']) ? $resident_data['lname'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop">First Name: </label>
                                        <input type="text" class="form-control" name="fname" placeholder="Enter First Name" value="<?= isset($resident_data['fname']) ? $resident_data['fname'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop"> Middle Name: </label>
                                        <input type="text" class="form-control" name="mi" placeholder="Enter Middle Name" value="<?= isset($resident_data['mi']) ? $resident_data['mi'] : ''; ?>">
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop">Contact Number:</label>
                                        <input type="tel" class="form-control" name="contact" maxlength="11" placeholder="Enter Contact Number" value="<?= isset($resident_data['contact']) ? $resident_data['contact'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label>Email: </label>
                                        <input type="email" class="form-control" name="email" placeholder="Enter Email" value="<?= isset($resident_data['email']) ? $resident_data['email'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label>Password:</label>
                                        <div class="password-input">
                                            <input type="password" class="form-control" id="password-field" name="password" placeholder="Leave blank to keep current password" minlength="8" maxlength="16">
                                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                        </div>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Password must be 8-16 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character (@, _, #, or *).</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label> House Number: </label>
                                        <input type="text" class="form-control" name="houseno" placeholder="Enter House Number" value="<?= isset($resident_data['houseno']) ? $resident_data['houseno'] : ''; ?>" required>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label> Purok & Street </label>
                                        <input type="text" class="form-control" name="street" placeholder="Enter Purok & Street Name" value="<?= isset($resident_data['street']) ? $resident_data['street'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label> Barangay: </label>
                                        <input type="text" class="form-control" name="brgy" value="East Modern Site" readonly required>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label> Municipality: </label>
                                        <input type="text" class="form-control" name="municipal" value="Baguio City" readonly required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop">Birth Date: </label>
                                        <input type="date" class="form-control" name="bdate" id="birthdate" oninput="calculateAge()" required max="<?php echo date('Y-m-d'); ?>" value="<?= isset($resident_data['bdate']) ? $resident_data['bdate'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop">Birth Place </label>
                                        <input type="text" class="form-control" name="bplace" placeholder="Enter Birth Place" value="<?= isset($resident_data['bplace']) ? $resident_data['bplace'] : ''; ?>" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label class="mtop">Nationality:</label>
                                        <select class="form-control" name="nationality" onchange="updateNationality(this.value)" required>
                                            <option value="American" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'American') ? 'selected' : ''; ?>>American</option>
                                            <option value="Australian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Australian') ? 'selected' : ''; ?>>Australian</option>
                                            <option value="Brazilian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Brazilian') ? 'selected' : ''; ?>>Brazilian</option>
                                            <option value="British" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'British') ? 'selected' : ''; ?>>British</option>
                                            <option value="Canadian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Canadian') ? 'selected' : ''; ?>>Canadian</option>
                                            <option value="Chinese" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Chinese') ? 'selected' : ''; ?>>Chinese</option>
                                            <option value="Filipino" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Filipino') ? 'selected' : 'selected'; ?>>Filipino</option>
                                            <option value="French" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'French') ? 'selected' : ''; ?>>French</option>
                                            <option value="German" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'German') ? 'selected' : ''; ?>>German</option>
                                            <option value="Indian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Indian') ? 'selected' : ''; ?>>Indian</option>
                                            <option value="Indonesian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Indonesian') ? 'selected' : ''; ?>>Indonesian</option>
                                            <option value="Italian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Italian') ? 'selected' : ''; ?>>Italian</option>
                                            <option value="Japanese" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Japanese') ? 'selected' : ''; ?>>Japanese</option>
                                            <option value="Korean" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Korean') ? 'selected' : ''; ?>>Korean</option>
                                            <option value="Malaysian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Malaysian') ? 'selected' : ''; ?>>Malaysian</option>
                                            <option value="Russian" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Russian') ? 'selected' : ''; ?>>Russian</option>
                                            <option value="Spanish" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Spanish') ? 'selected' : ''; ?>>Spanish</option>
                                            <option value="Thai" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Thai') ? 'selected' : ''; ?>>Thai</option>
                                            <option value="Vietnamese" <?= (isset($resident_data['nationality']) && $resident_data['nationality'] == 'Vietnamese') ? 'selected' : ''; ?>>Vietnamese</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label>Civil Status: </label>
                                        <select class="form-control" name="status" id="status" required>
                                            <option value="">Choose your Status</option>
                                            <option value="Single" <?= (isset($resident_data['status']) && $resident_data['status'] == 'Single') ? 'selected' : ''; ?>>Single</option>
                                            <option value="Married" <?= (isset($resident_data['status']) && $resident_data['status'] == 'Married') ? 'selected' : ''; ?>>Married</option>
                                            <option value="Widowed" <?= (isset($resident_data['status']) && $resident_data['status'] == 'Widowed') ? 'selected' : ''; ?>>Widowed</option>
                                            <option value="Divorced" <?= (isset($resident_data['status']) && $resident_data['status'] == 'Divorced') ? 'selected' : ''; ?>>Divorced</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col">
                                    <div class="form-group">
                                        <label>Age:</label>
                                        <input class="form-control" name="age" id="age" required readonly value="<?= isset($resident_data['age']) ? $resident_data['age'] : ''; ?>">
                                    </div>
                                </div>

                                <div class="col rb">
                                    <div class="form-group">
                                        <label class="mtop">Sex:</label>
                                        <select class="form-control" name="sex" id="sex" required>
                                            <option value="">Choose your Sex</option>
                                            <option value="Male" <?= (isset($resident_data['sex']) && $resident_data['sex'] == 'Male') ? 'selected' : ''; ?>>Male</option>
                                            <option value="Female" <?= (isset($resident_data['sex']) && $resident_data['sex'] == 'Female') ? 'selected' : ''; ?>>Female</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Are you a registered voter? </label>
                                        <select class="form-control" name="voter" id="regvote" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['voter']) && $resident_data['voter'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['voter']) && $resident_data['voter'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col rb">
                                    <div class="form-group">
                                        <label>PWD? </label>
                                        <select class="form-control" name="pwd" id="pwd" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['pwd']) && $resident_data['pwd'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['pwd']) && $resident_data['pwd'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Indigent? </label>
                                        <select class="form-control" name="indigent" id="indigent" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['indigent']) && $resident_data['indigent'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['indigent']) && $resident_data['indigent'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Single Parent? </label>
                                        <select class="form-control" name="single_parent" id="single_parent" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['single_parent']) && $resident_data['single_parent'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['single_parent']) && $resident_data['single_parent'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Pregnant? </label>
                                        <select class="form-control" name="pregnancy" id="pregnancy" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['pregnancy']) && $resident_data['pregnancy'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['pregnancy']) && $resident_data['pregnancy'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Malnourished? </label>
                                        <select class="form-control" name="malnourished" id="malnourished" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['malnourished']) && $resident_data['malnourished'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['malnourished']) && $resident_data['malnourished'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Member of 4Ps? </label>
                                        <select class="form-control" name="four_ps" id="four_ps" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['four_ps']) && $resident_data['four_ps'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['four_ps']) && $resident_data['four_ps'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Member of Senior Citizen? </label>
                                        <select class="form-control" name="senior" id="senior" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['senior_citizen']) && $resident_data['senior_citizen'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['senior_citizen']) && $resident_data['senior_citizen'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!-- Out of School Youth dropdown -->
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Out of School Youth? </label>
                                        <select class="form-control" name="out_of_school_youth" id="out_of_school_youth" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['out_of_school_youth']) && $resident_data['out_of_school_youth'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['out_of_school_youth']) && $resident_data['out_of_school_youth'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!-- New LGBTQ+ dropdown -->
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>LGBTQ+? </label>
                                        <select class="form-control" name="lgbtq" id="lgbtq" required>
                                            <option value="">...</option>
                                            <option value="Yes" <?= (isset($resident_data['lgbtq']) && $resident_data['lgbtq'] == 'Yes') ? 'selected' : ''; ?>>Yes</option>
                                            <option value="No" <?= (isset($resident_data['lgbtq']) && $resident_data['lgbtq'] == 'No') ? 'selected' : ''; ?>>No</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>


                                <br>
                            </div>
                    </div>
                    <input type="hidden" class="form-control" name="role" value="resident">
                    <center><button class="btn btn-success" type="submit" name="update_resident" style="width: 120px; font-size: 18px; border-radius:5px;">
                            Update
                        </button>
                        <a href="admn_resident_crud.php" class="btn btn-danger" style="width: 120px; font-size: 18px; border-radius:5px;"> Back </a>
                    </center>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <br><br><br>
    <!-- End of Main Content -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js" integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w==" crossorigin="anonymous"></script>
    <!-- responsive tags for screen compatibility -->
    <meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
    <!-- custom css -->
    <link href="customcss/regiformstyle.css" rel="stylesheet" type="text/css">
    <!-- bootstrap css -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- fontawesome icons -->
    <script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.bundle.js" type="text/javascript"> </script>


    <script>
        $(".toggle-password").click(function() {
            $(this).toggleClass("fa-eye fa-eye-slash");
            var input = $($(this).attr("toggle"));
            if (input.attr("type") == "password") {
                input.attr("type", "text");
            } else {
                input.attr("type", "password");
            }
        });

        function calculateAge() {
            var birthdate = document.getElementById('birthdate').value;
            var today = new Date();
            var birthdateObj = new Date(birthdate);
            var age = today.getFullYear() - birthdateObj.getFullYear();

            // Check if the birthday has occurred this year
            if (today.getMonth() < birthdateObj.getMonth() || (today.getMonth() === birthdateObj.getMonth() && today.getDate() < birthdateObj.getDate())) {
                age--;
            }

            // Update the "Age" input field
            document.getElementById('age').value = age;
        }
    </script>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout.php">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js" integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w==" crossorigin="anonymous"></script>
    <!-- responsive tags for screen compatibility -->
    <meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
    <!-- bootstrap css -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <!-- fontawesome icons -->
    <script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>
    <script src="bootstrap/js/bootstrap.bundle.js" type="text/javascript"> </script>

    <?php
    include('dashboard_sidebar_end.php');
    ?>