<?php
session_start(); // Start session

require('classes/conn.php');
require('classes/resident.class.php');

// Call create_resident function
$residentbmis->create_resident();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Barangay Link</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap & CSS -->
    <link href="design.css" rel="stylesheet" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js"></script>
    <script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script src="bootstrap/js/bootstrap.bundle.js"></script>

    <style>
        .field-icon {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            z-index: 2;
            cursor: pointer;
            color: #64748b;
        }

        html,
        body {
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .content {
            flex: 1;
        }

        #footer {
            background-color: #073260;
            color: white;
            text-align: center;
            padding: 10px 0;
        }

        .registration-shell {
            max-width: 1180px;
            margin: 0 auto;
            padding: 0 16px 48px;
        }

        .registration-card {
            border: 1px solid #dbe3ec;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.08);
            overflow: hidden;
        }

        .registration-card .card-body {
            padding: 32px;
        }

        .registration-form .row {
            row-gap: 18px;
        }

        .registration-form label,
        .registration-form h6 {
            color: #24364b;
            font-size: 0.9rem;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .registration-form .form-control {
            min-height: 44px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
        }

        .registration-form .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        .registration-form input[readonly] {
            background: #f1f5f9;
        }
        /* Prevent the email-match message from shifting layout */
        .email-confirm-wrap {
            position: relative;
        }

        #email_msg {
            position: absolute;
            left: 0;
            top: 100%;
            margin-top: 4px;
            font-size: 0.8rem;
            white-space: nowrap;
        }

        .form-section-title {
            margin: 28px 0 18px;
            padding: 10px 14px;
            border-left: 4px solid #2563eb;
            background: #f1f5f9;
            color: #17365d;
            font-size: 1rem;
            font-weight: 700;
        }

        .form-section-title:first-child {
            margin-top: 0;
        }

        .registration-form .form-check-inline {
            margin-top: 5px;
        }

        .registration-form h6,
        .registration-form .rb .form-group > label:first-child {
            min-height: 42px;
            line-height: 1.35;
        }

        .registration-form .rb {
            min-width: 220px;
        }

        .registration-form .rb .form-group {
            height: 100%;
            margin-bottom: 0;
        }

        .registration-actions {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 30px;
        }

        @media (max-width: 767px) {
            .registration-card .card-body {
                padding: 20px 16px;
            }

            .registration-actions {
                flex-direction: column;
            }

            .registration-actions .btn {
                width: 100% !important;
            }

            .registration-form h6,
            .registration-form .rb .form-group > label:first-child {
                min-height: auto;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-dark bg-primary sticky-top">
        <a class="navbar-brand" style="color:white;">BarangayLink</a>
    </nav>

    <div class="container-fluid registration-shell" style="margin-top:4em;">
        <div class="row">
            <div class="col-12">
                <h1 class="text-center mb-2">Resident Registration Form</h1>
                <p class="text-center text-muted mb-4">Please provide complete and accurate information in all required fields.</p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="card registration-card">
                    <div class="card-body">
                        <form method="post" enctype="multipart/form-data" class="registration-form">
                            <div class="form-section-title">Account and Contact Information</div>
                            <!-- Name & Contact -->
<div class="row mb-3">
    <div class="col-md-4">
        <label>Last Name:</label><span style="color: red;">*</span>
        <input type="text" class="form-control"
               name="lname"
               placeholder="DELA CRUZ"
               oninput="this.value = this.value.toUpperCase()"
               title="Please enter at least 2 letters, letters only."
               required>
    </div>

    <div class="col-md-4">
        <label>First Name:</label><span style="color: red;">*</span>
        <input type="text" class="form-control"
               name="fname"
               placeholder="JUAN"
               oninput="this.value = this.value.toUpperCase()"
               title="Please enter at least 2 letters, letters only."
               required>
    </div>

    <div class="col-md-4">
        <label>Middle Name:</label><span style="color: red;">*</span>
        <input type="text" class="form-control"
               name="mi"
               placeholder="DIMAGUIBA"
               oninput="this.value = this.value.toUpperCase()"
               title="Please enter at least 2 letters.">
    </div>
</div>

                            <div class="row mb-3">
                                <!-- <div class="col-md-4">
                                    <label>Contact Number:</label><span style="color: red;">*</span>
                                    <input type="tel" style="text-transform: uppercase;" class="form-control" name="contact" maxlength="11" placeholder="Contact Number">
                                </div> -->
                                <div class="col-md-3">
    <label>Contact Number:</label><span style="color: red;">*</span>

    <input 
        type="tel"
        class="form-control"
        name="contact"
        maxlength="11"
        placeholder="09XXXXXXXXX"
        required
        pattern="^09\d{9}$"
        title="Contact number must start with 09 and contain 11 digits (e.g. 09171234567)"
        oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0,11);"
    >
</div>
                                <!-- EMAIL -->
                                <div class="col-md-3">
                                    <label>Email:</label><span style="color: red;">*</span>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                                </div>
                                <!-- CONFIRM EMAIL -->
                                <div class="col-md-3">
                                    <label>Re-enter Email:</label><span style="color: red;">*</span>
                                    <div class="email-confirm-wrap">
                                        <input type="email" class="form-control" name="confirm_email" id="confirm_email" placeholder="Re-enter Email" required>
                                        <small id="email_msg"></small>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label>Password:</label><span style="color: red;">*</span>
                                    <div class="position-relative">
                                        <input type="password" class="form-control" id="password-field" name="password" placeholder="Password" minlength="8" maxlength="16" required>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                </div>
                                
                              


                            </div>

                            <!-- Address -->
                            <div class="form-section-title">Residential Address</div>
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <label>House Number:</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="houseno" required>
                                </div>
                                <div class="col-md-3">
                                    <label>Purok & Street:</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="street" required>
                                </div>
                                <div class="col-md-3">
                                    <label>Barangay:</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="brgy" value="EAST MODERN SITE" readonly required>
                                </div>
                                <div class="col-md-3">
                                    <label>Municipality:</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="municipal" value="BAGUIO CITY" readonly required>
                                </div>
                            </div>

                            <!-- PSA / National ID / Family Head / Animals / Trees / Farmer / Vegetables -->
                            <div class="form-section-title">Household and Document Information</div>
                            <div class="row mb-3">
                                <!-- PSA -->
                                <div class="col-md-3">
                                    <h6>Do you have PSA birth certificate? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="psa" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="psa" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <h6>Correction in your PSA? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="psa_correction" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="psa_correction" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                    <input type="text" id="psa_c" name="psa_c" class="form-control mt-1" placeholder="If yes, specify" style="display:none;">
                                </div>

                                <!-- National ID -->
                                <div class="col-md-3">
                                    <h6>Do you have National ID? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="ntnlid" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="ntnlid" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                    <input type="text" id="ntlid_input" name="ntlid_" class="form-control mt-1" placeholder="National ID Number" style="display:none;">
                                </div>

                                <!-- Head of family -->
                                <div class="col-md-3">
                                    <h6>Are you the head of the family? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hof" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hof" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Domesticated animals, trees, farmer, vegetables -->
                            <div class="row mb-3">
                                <div class="col-md-3">
                                    <h6>Do you have domesticated animals? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="d_a" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="d_a" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <h6>Do you have trees <br>in your yard? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="trees" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="radio" name="trees" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <h6>Are you a farmer? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="farmer" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="radio" name="farmer" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <h6>Do you grow vegetables in your yard? <span style="color: red;">*</span></h6>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="veges" value="Yes">
                                        <label class="form-check-label">Yes</label>
                                    </div>
                                    <div class="form-check-inline">
                                        <input class="form-check-input" type="radio" name="veges" value="No">
                                        <label class="form-check-label">No</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Birthdate, Age, Birthplace, Nationality, Civil Status, Sex -->
                            <div class="form-section-title">Personal Information</div>
                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label>Birth Date:</label><span style="color: red;">*</span>
                                    <input type="date" class="form-control" name="bdate" id="birthdate" oninput="calculateAge()" required max="<?= date('Y-m-d') ?>">
                                </div>
                                <div class="col-md-4">
                                    <label>Birth Place:</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="bplace" required>
                                </div>
                                <div class="col-md-4">
                                    <label>Nationality:</label><span style="color: red;">*</span>
                                    <!-- <select class="form-control" name="nationality" required>
                                        <option value="Filipino" selected>Filipino</option>
                                    </select> -->
                                    <input class="form-control" name="nationality" value="Filipino" required readonly />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label>Civil Status:</label><span style="color: red;">*</span>
                                    <select class="form-control" name="status" required>
                                        <option value="">Choose your Status</option>
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Live-in">Live-in partner</option>
                                        <option value="Widowed">Widowed</option>
                                        <option value="Divorced">Divorced</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label>Age:</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="age" id="age" readonly required>
                                </div>
                                <div class="col-md-4">
                                    <label>Sex:</label><span style="color: red;">*</span>
                                    <select class="form-control" name="sex" required>
                                        <option value="">Choose your Sex</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Source of Income and Occupation -->
                            <div class="form-section-title">Employment and Income</div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Monthly Income</label><span style="color: red;">*</span>
                                    <select id="soi" name="soi" class="form-control" required>
                                        <option value="">Choose monthly income</option>
                                        <option value="No Income">No Income</option>
                                        <option value="Below 10,000">Below ₱10,000</option>
                                        <option value="10,000 - 19,999">₱10,000 - ₱19,999</option>
                                        <option value="20,000 - 29,999">₱20,000 - ₱29,999</option>
                                        <option value="30,000 - 39,999">₱30,000 - ₱39,999</option>
                                        <option value="40,000 - 49,999">₱40,000 - ₱49,999</option>
                                        <option value="50,000 - 74,999">₱50,000 - ₱74,999</option>
                                        <option value="75,000 - 99,999">₱75,000 - ₱99,999</option>
                                        <option value="100,000 and above">₱100,000 and above</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label>Occupation</label><span style="color: red;">*</span>
                                    <input type="text" style="text-transform: uppercase;" class="form-control" name="occupation">
                                </div>
                            </div>












                            <div class="form-section-title">Resident Classification</div>
                            <div class="row">

                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Are you a registered voter? </label>
                                        <select class="form-control" name="voter" id="regvote">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col rb">
                                    <div class="form-group">
                                        <label>PWD? </label>
                                        <select class="form-control" name="pwd" id="pwd">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
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
                                        <select class="form-control" name="indigent" id="indigent">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Single Parent? </label>
                                        <select class="form-control" name="single_parent" id="single_parent">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Pregnant? </label>
                                        <select class="form-control" name="pregnant" id="pregnant">
                                             <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Member of 4Ps? </label>
                                        <select class="form-control" name="four_ps" id="four_ps">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Member of Senior Citizen? </label>
                                        <select class="form-control" name="senior_citizen" id="senior_citizen">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!-- Out of School Youth dropdown -->
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>Out of School Youth? </label>
                                        <select class="form-control" name="out_of_school_youth" id="out_of_school_youth">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!-- New LGBTQ+ dropdown -->
                                <div class="col rb">
                                    <div class="form-group">
                                        <label>LGBTQ+? </label>
                                        <select class="form-control" name="lgbtq" id="lgbtq">
                                            <option value="">...</option>
                                            <option value="Yes">Yes</option>
                                        </select>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>


                                <br>
                            </div>





















                            <div class="form-section-title">Identity Verification</div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Valid ID Type #1:</label><span style="color: red;">*</span>
                                    <select class="form-control" name="valid1" id="valid1" required>
                                        <option value="">-- Select Valid ID --</option>
                                        <option>PhilSys ID (National ID)</option>
                                        <option>Passport</option>
                                        <option>Driver’s License</option>
                                        <option>UMID</option>
                                        <option>SSS ID</option>
                                        <option>PhilHealth ID</option>
                                        <option>Pag-IBIG ID</option>
                                        <option>Voter’s ID / Voter’s Certification</option>
                                        <option>Postal ID</option>
                                        <option>PRC ID</option>
                                        <option>Company ID</option>
                                        <option>School ID</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label>Valid ID Type #2:</label><span style="color: red;">*</span>
                                    <select class="form-control" name="valid2" id="valid2" required>
                                        <option value="">-- Select Valid ID --</option>
                                        <option>PhilSys ID (National ID)</option>
                                        <option>Passport</option>
                                        <option>Driver’s License</option>
                                        <option>UMID</option>
                                        <option>SSS ID</option>
                                        <option>PhilHealth ID</option>
                                        <option>Pag-IBIG ID</option>
                                        <option>Voter’s ID / Voter’s Certification</option>
                                        <option>Postal ID</option>
                                        <option>PRC ID</option>
                                        <option>Company ID</option>
                                        <option>School ID</option>
                                    </select>
                                </div>
                            </div>

                            <script>
                                const originalOptions = [
                                    "PhilSys ID (National ID)",
                                    "Passport",
                                    "Driver’s License",
                                    "UMID",
                                    "SSS ID",
                                    "PhilHealth ID",
                                    "Pag-IBIG ID",
                                    "Voter’s ID / Voter’s Certification",
                                    "Postal ID",
                                    "PRC ID",
                                    "Company ID",
                                    "School ID"
                                ];

                                function populateSelect(select, excludeValue) {
                                    let currentValue = select.value;

                                    // Clear all options
                                    select.innerHTML = '<option value="">-- Select Valid ID --</option>';

                                    // Rebuild options except excluded
                                    originalOptions.forEach(option => {
                                        if (option !== excludeValue) {
                                            let opt = document.createElement("option");
                                            opt.value = option;
                                            opt.textContent = option;
                                            select.appendChild(opt);
                                        }
                                    });

                                    // Restore previously selected value if still valid
                                    if (currentValue && currentValue !== excludeValue) {
                                        select.value = currentValue;
                                    }
                                }

                                function updateValidIDs() {
                                    let valid1 = document.getElementById("valid1");
                                    let valid2 = document.getElementById("valid2");

                                    let value1 = valid1.value;
                                    let value2 = valid2.value;

                                    populateSelect(valid1, value2);
                                    populateSelect(valid2, value1);
                                }

                                document.getElementById("valid1").addEventListener("change", updateValidIDs);
                                document.getElementById("valid2").addEventListener("change", updateValidIDs);

                                // Initialize on load
                                updateValidIDs();
                            </script>
                            <!-- Valid ID Upload Fields -->
                            <div class="row mb-3" id="idFields" style="display:none;">
                                <div class="col-md-6" id="id1">
                                    <label>Valid ID #1 (Front Only):</label><span style="color: red;">*</span>
                                    <input type="file" class="form-control" name="valid_id_front1" accept="image/*">
                                </div>

                                <div class="col-md-6" id="id2">
                                    <label>Valid ID #2 (Front Only):</label><span style="color: red;">*</span>
                                    <input type="file" class="form-control" name="valid_id_front2" accept="image/*">
                                </div>
                            </div>




                            <!-- Valid IDs -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Valid ID #1 (Front Only):</label><span style="color: red;">*</span>
                                    <input type="file" class="form-control" name="valid_id_front1" accept="image/*" required>
                                </div>
                                <div class="col-md-6">
                                    <label>Valid ID #2 (Front Only):</label><span style="color: red;">*</span>
                                    <input type="file" class="form-control" name="valid_id_front2" accept="image/*" required>
                                </div>
                            </div>

                            <input type="hidden" name="role" value="resident">
                            <div class="registration-actions">
                                <button type="submit" name="add_resident" class="btn btn-success" style="width:130px;">Submit</button>
                                <a href="index_login.php" class="btn btn-danger" style="width:130px;">Back to Login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer id="footer" class="bg-primary text-white text-center">
        <div class="py-3">
            <?= date("Y"); ?> | BarangayLink
        </div>
    </footer>
    <script>
        // const soiInput = document.getElementById('soi');
        // const datalist = document.getElementById('incomeSuggestions');

        // soiInput.addEventListener('input', function () {
        //     const value = this.value.replace(/\D/g, '');

        //     // Clear suggestions
        //     datalist.innerHTML = '';

        //     if (!value) return;

        //     const base = parseInt(value) * 10000;

        //     // Generate suggestions
        //     const suggestions = [
        //         base,
        //         base * 2,
        //         base * 5
        //     ];

        //     suggestions.forEach(amount => {
        //         const option = document.createElement('option');
        //         option.value = amount.toLocaleString();
        //         datalist.appendChild(option);
        //     });
        // });
    </script>
<script>
const email = document.getElementById("email");
const confirmEmail = document.getElementById("confirm_email");
const msg = document.getElementById("email_msg");

// Disable paste
confirmEmail.addEventListener("paste", function(e) {
    e.preventDefault();
    alert("Copy-paste is not allowed. Please type your email.");
});

// Real-time validation
confirmEmail.addEventListener("keyup", function() {
    if (email.value === confirmEmail.value && email.value !== "") {
        msg.style.color = "green";
        msg.innerHTML = "✔ Emails match";
    } else {
        msg.style.color = "red";
        msg.innerHTML = "✖ Emails do not match";
    }
});
</script>



    <script>
        $(".toggle-password").click(function() {
            $(this).toggleClass("fa-eye fa-eye-slash");
            var input = $($(this).attr("toggle"));
            input.attr("type", input.attr("type") === "password" ? "text" : "password");
        });

        // Age calculation
        function calculateAge() {
            var birthdate = document.getElementById('birthdate').value;
            if (!birthdate) return;
            var today = new Date();
            var birthdateObj = new Date(birthdate);
            var age = today.getFullYear() - birthdateObj.getFullYear();
            var m = today.getMonth() - birthdateObj.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthdateObj.getDate())) {
                age--;
            }
            document.getElementById('age').value = age;
        }
    </script>

</body>

</html>
