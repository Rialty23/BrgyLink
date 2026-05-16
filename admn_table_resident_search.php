<?php
// require the database connection
require 'classes/conn.php';
$bmis->delete_certofres();
if (isset($_POST['search_certofres'])) {
    $keyword = trim($_POST['keyword']);
?>

    <table class="table table-hover text-center table-bordered table-responsive">
        <thead class="alert-info">

            <tr>
                <?php if (isset($_GET['deleted'])) {  ?>

                <?php } else { ?>
                    <th> Actions</th>
                    <th> Actions</th>
                <?php } ?>

                <th>Certificate / Clearance</th>
                <th> Surname </th>
                <th> First name </th>
                <th> Middle name </th>
                <th> Age </th>
                <th> Address</th>
                <th> Nationality </th>
                <?php if (isset($_GET['deleted'])) {  ?>
                    <th> Rejected Reason </th>
                <?php } ?>

            </tr>
        </thead>

        <tbody>
            <?php
            $keywordLike = "%{$keyword}%";
            $stmnt = $conn->prepare("SELECT * FROM `tbl_resident` WHERE
                `lname` LIKE ? OR
                `fname` LIKE ? OR
                `email` LIKE ? OR
                `mi` LIKE ? OR
                CAST(`age` AS CHAR) LIKE ? OR
                `houseno` LIKE ? OR
                `street` LIKE ? OR
                `nationality` LIKE ? OR
                CONCAT(TRIM(`fname`), ' ', TRIM(`mi`), ' ', TRIM(`lname`)) LIKE ? OR
                CONCAT(TRIM(`fname`), ' ', TRIM(`lname`)) LIKE ?
                ORDER BY id_resident DESC");
            $stmnt->execute([
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike,
                $keywordLike
            ]);

            while ($search = $stmnt->fetch()) {
            ?>
                <tr>
                    <?php if (isset($_GET['deleted'])) {  ?>

                    <?php } else { ?>
                        <td>
                            <form method="post">
                                <a href="update_resident_form.php?id_resident=<?= $search['id_resident']; ?>" style="width:70px; font-size: 14px; border-radius:5px; margin-bottom: 2px;" class="btn btn-success"> Update </a>
                                <!-- <button class="btn btn-danger" type="submit" name="delete_resident" style="width: 70px; font-size: 14px; border-radius:5px;"> Delete </button> -->
                                <input type="hidden" id="idresident" name="id_resident" value="<?= $search['id_resident']; ?>">
                            </form>
                        </td>
                        <td>
                            <form method="post" action="update_status.php">
                                <input type="hidden" name="status" value="DELETED">
                                <button class="btn btn-danger" type="submit" style="width: 80px; font-size: 15px; border-radius:5px;" name="id_resident"> Delete </button>

                                <input type="hidden" id="id_resident" name="id_resident" value="<?= $search['id_resident']; ?>">
                            </form>
                        </td>
                    <?php } ?>

                    <td>
                        <button data-id="<?= $search['id_resident']; ?>" class="btn btn-success residency" style="width: 100%; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;">Residency</button>
                        <button data-id="<?= $search['id_resident']; ?>" class="btn btn-success business" style="width: 100%; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalBusiness">Business</button>
                        <button data-id="<?= $search['id_resident']; ?>" class="btn btn-success clearance" style="width: 100%; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalClearance">Clearance</button>
                        <button data-id="<?= $search['id_resident']; ?>" class="btn btn-success indigency" style="width: 100%; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalIndigency">Indigency</button>

                        <!-- Residency -->
                        <div class="modal fade" id="modalResidency" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Certificate of Residency Form</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="generate_rescert_auto.php" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="mtop">Date Needed: </label>
                                                        <input type="date" class="form-control" name="date" style="text-align:left;" required min="<?php echo date('Y-m-d'); ?>" required>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="purposes">Purpose:</label>
                                                        <select class="form-control" name="purpose" style="text-align:left;" id="purpose" required>
                                                            <option value="">Choose Purpose</option>
                                                            <option value="Job/Employment">Job/Employment</option>
                                                            <option value="Business Establishment">Business Establishment</option>
                                                            <option value="Financial Transaction">Financial Transaction</option>
                                                            <option value="Certify that you are living in a certain barangay">Certify that you are living in a certain barangay</option>
                                                            <option value="Other important transactions.">Other important transactions.</option>
                                                        </select>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer" style="justify-content: flex-start;">
                                            <div class="paa">
                                                <input type="hidden" class="resid" name="id">
                                                <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Business -->
                        <div class="modal fade" id="modalBusiness" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Business Permit Form</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="generate_bspermit_auto.php" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="bsname">Business Name:</label>
                                                        <input name="bsname" style="text-align:left;" type="text" class="form-control" placeholder="Enter Business Name" required>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="status">Business Industry:</label>
                                                        <select class="form-control" style="text-align:left;" name="bsindustry" id="status" placeholder="Enter Status" required>
                                                            <option value="">Choose your Business Industry</option>
                                                            <option value="Computer">Computer</option>
                                                            <option value="Telecommunication">Telecommunication</option>
                                                            <option value="Agriculture">Agriculture</option>
                                                            <option value="Construction">Construction</option>
                                                            <option value="Education">Education</option>
                                                            <option value="Pharmaceutical">Pharmaceutical</option>
                                                            <option value="Food">Food</option>
                                                            <option value="HealthCare">HealthCare</option>
                                                            <option value="Hospitality">Hospitality</option>
                                                            <option value="Entertainment">Entertainment</option>
                                                            <option value="News Media">News Media</option>
                                                            <option value="Energy">Energy</option>
                                                            <option value="Manufacturing">Manufacturing</option>
                                                            <option value="Music">Music</option>
                                                            <option value="Mining">Mining</option>
                                                            <option value="WorldWide Web">WorldWide Web</option>
                                                            <option value="Electronics">Electronics</option>
                                                            <option value="Transport">Pharmaceutical</option>
                                                            <option value="Transport">Aerospace</option>
                                                        </select>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="aoe" class="mtop">Area of Establishment (SqM): </label>
                                                        <input type="number" style="text-align:left;" name="aoe" class="form-control" placeholder="Enter your AOE" required>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer" style="justify-content: flex-start;">
                                            <div class="paa">
                                                <input type="hidden" class="busid" name="id">
                                                <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Clearance -->
                        <div class="modal fade" id="modalClearance" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Barangay Clearance Form</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="generate_brgycle_auto.php" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="status">Status:</label>
                                                        <select class="form-control" style="text-align:left;" name="status" id="status" placeholder="Enter Status" value="<?= $userdetails['status'] ?>" required>
                                                            <option value="">Choose your Status</option>
                                                            <option value="Single">Single</option>
                                                            <option value="In a relationship">In a relationship</option>
                                                            <option value="Engaged">Engaged</option>
                                                            <option value="Married">Married</option>
                                                            <option value="Widowed">Widowed</option>
                                                            <option value="Divorces">Divorced</option>
                                                        </select>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="purposes">Purposes:</label>
                                                        <select class="form-control" style="text-align:left;" name="purpose" id="purposes" placeholder="Enter Status" required>
                                                            <option value="">Choose your Purpose</option>
                                                            <option value="Local Employment">Local Employment</option>
                                                            <option value="Loan">Loan</option>
                                                            <option value="School/S.S.S Requirements">School/S.S.S Requirements</option>
                                                            <option value="NBI/Police Clearance">NBI/Police Clearance</option>
                                                            <option value="Postal ID Application">Postal ID</option>
                                                            <option value="Bank Requirements">Bank Requirements</option>
                                                            <option value="Water/Electric service Connection">Water/Electric service Connection</option>
                                                            <option value="Legal Purpose">Legal Purpose</option>
                                                            <option value="Others">Others</option>
                                                        </select>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer" style="justify-content: flex-start;">
                                            <div class="paa">
                                                <input type="hidden" class="clearid" name="id">
                                                <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Indigency -->
                        <div class="modal fade" id="modalIndigency" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalCenterTitle">Certificate of Indigency Form</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <form action="generate_indigency_auto.php" method="post">
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label class="mtop">Date Needed: </label>
                                                        <input type="date" class="form-control" name="date" style="text-align:left;" required min="<?php echo date('Y-m-d'); ?>" required>
                                                        <div class="valid-feedback">Valid.</div>
                                                        <div class="invalid-feedback">Please fill out this field.</div>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label for="purposes">Purposes:</label>
                                                        <select class="form-control" style="text-align:left;" name="purpose" id="purposes" required>
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
                                            </div>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer" style="justify-content: flex-start;">
                                            <div class="paa">
                                                <input type="hidden" class="indiid" name="id">
                                                <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </td>
                    <td> <?= $search['lname']; ?> </td>
                    <td> <?= $search['fname']; ?> </td>
                    <td> <?= $search['mi']; ?> </td>
                    <td> <?= $search['age']; ?> </td>
                    <td> <?= $search['houseno']; ?>, <?= $search['street']; ?>, <?= $search['brgy']; ?> </td>
                    <td> <?= $search['nationality']; ?> </td>
                    <?php if (isset($_GET['deleted'])) {  ?>
                        <td><?= !empty($search['rejected_reason']) ? htmlspecialchars($search['rejected_reason']) : 'N/A'; ?></td>
                    <?php } ?>

                </tr>
            <?php
            }
            ?>
        </tbody>

    </table>

<?php
} else {
?>
    <?php include('flexbox.php'); ?>
    <?php include('including_style.php'); ?>
    <div class="table-responsive  table-scroll">
        <table class="table table-hover text-center table-bordered">
            <thead class="alert-info">
                <tr>
                    <?php if (isset($_GET['deleted'])) {  ?>

                    <?php } else { ?>
                        <th> Actions</th>
                        <th> Actions</th>
                    <?php } ?>

                    <th>Certificate / Clearance</th>
                    <th>CN #</th>
                    <!-- <th> Email </th> -->
                    <th> Surname </th>
                    <th> First name </th>
                    <th> Middle name </th>
                    <!-- <th> Age </th>
                    <th> Sex </th>
                    <th> Status </th>
                    <th> Address</th>
                    <th> Contact # </th> -->
                    <th> View </th>

                    <?php if (!isset($_GET['deleted'])) {  ?>

                    <?php } else { ?>
                        <th> Rejected Reason </th>
                        <th> Status </th>
                        <th> Action </th>
                    <?php } ?>

                    <!-- <th> Birth date </th>
                <th> Birth place </th>
                <th> Nationality </th>
                <th> Registered Voter </th>
                <th> PWD </th>
                <th> Indigent </th>
                <th> Single Parent </th>
                <th> 4Ps </th> -->
                </tr>
            </thead>

            <tbody>
                <?php if (is_array($view)) { ?>
                    <?php foreach ($view as $view) { ?>
                        <tr>
                            <?php if (isset($_GET['deleted'])) {  ?>

                            <?php } else { ?>
                                <td>
                                    <form method="post">
                                        <a href="update_resident_form.php?id_resident=<?= $view['id_resident']; ?>" style="width:70px; font-size: 14px; border-radius:5px; margin-bottom: 2px;" class="btn btn-info"> Update </a>
                                        <input type="hidden" id="idresident" name="id_resident" value="<?= $view['id_resident']; ?>">
                                    </form>
                                </td>
                                <td>
                                    <form method="post" action="update_status.php">
                                        <input type="hidden" name="status" value="DELETED">
                                        <button class="btn btn-danger" type="submit" style="width: 80px; font-size: 15px; border-radius:5px;" name="id_resident"> Delete </button>

                                        <input type="hidden" id="id_resident" name="id_resident" value="<?= $view['id_resident']; ?>">
                                    </form>
                                </td>
                            <?php } ?>

                            <td>
                                <!-- <button data-id="<?= $view['id_resident']; ?>" class="btn btn-success residency" style="width: 95px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;">Residency</button>
                                <button data-id="<?= $view['id_resident']; ?>" class="btn btn-success business" style="width: 95px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalBusiness">Business</button>
                                <button data-id="<?= $view['id_resident']; ?>" class="btn btn-success clearance" style="width: 95px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalClearance">Clearance</button>
                                <button data-id="<?= $view['id_resident']; ?>" class="btn btn-success indigency" style="width: 95px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalIndigency">Indigency</button>
                                <button onclick="openWin('view_resident.php?id_resident=<?= $view['id_resident']; ?>')" class="btn btn-secondary view" style="width: 95px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;" data-toggle="modal" data-target="#modalView">View</button> -->


                                <div class="dropdown">
                                    <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown">
                                        Select Action
                                    </button>

                                    <div class="dropdown-menu">
                                        <a class="dropdown-item residency"
                                            href="#"
                                            data-id="<?= $view['id_resident']; ?>">
                                            Residency
                                        </a>

                                        <a class="dropdown-item business"
                                            href="#"
                                            data-id="<?= $view['id_resident']; ?>"
                                            data-toggle="modal"
                                            data-target="#modalBusiness">
                                            Business
                                        </a>

                                        <a class="dropdown-item clearance"
                                            href="#"
                                            data-id="<?= $view['id_resident']; ?>"
                                            data-toggle="modal"
                                            data-target="#modalClearance">
                                            Clearance
                                        </a>

                                        <a class="dropdown-item indigency"
                                            href="#"
                                            data-id="<?= $view['id_resident']; ?>"
                                            data-toggle="modal"
                                            data-target="#modalIndigency">
                                            Indigency
                                        </a>

                                        <div class="dropdown-divider"></div>

                                        <!-- ✅ Updated View behavior -->
                                        <a class="dropdown-item view"
                                            href="#"
                                            onclick="openWin('view_resident.php?id_resident=<?= $view['id_resident']; ?>'); return false;">
                                            View
                                        </a>
                                    </div>
                                </div>
                                <!-- Residency -->
                                <div class="modal fade" id="modalResidency" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Certificate of Residency Form</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="generate_rescert_auto.php" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label class="mtop">Date Needed: </label>
                                                                <input type="date" class="form-control" name="date" style="text-align:left;" required min="<?php echo date('Y-m-d'); ?>" required>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="purposes">Purpose:</label>
                                                                <select class="form-control" name="purpose" style="text-align:left;" id="purpose" required>
                                                                    <option value="">Choose Purpose</option>
                                                                    <option value="Job/Employment">Job/Employment</option>
                                                                    <option value="Business Establishment">Business Establishment</option>
                                                                    <option value="Financial Transaction">Financial Transaction</option>
                                                                    <option value="Certify that you are living in a certain barangay">Certify that you are living in a certain barangay</option>
                                                                    <option value="Other important transactions.">Other important transactions.</option>
                                                                </select>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal Footer -->
                                                <div class="modal-footer" style="justify-content: flex-start;">
                                                    <div class="paa">
                                                        <input type="hidden" class="resid" name="id">
                                                        <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Business -->
                                <div class="modal fade" id="modalBusiness" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Business Permit Form</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="generate_bspermit_auto.php" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label for="bsname">Business Name:</label>
                                                                <input name="bsname" style="text-align:left;" type="text" class="form-control" placeholder="Enter Business Name" required>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="status">Business Industry:</label>
                                                                <select class="form-control" style="text-align:left;" name="bsindustry" id="status" placeholder="Enter Status" required>
                                                                    <option value="">Choose your Business Industry</option>
                                                                    <option value="Computer">Computer</option>
                                                                    <option value="Telecommunication">Telecommunication</option>
                                                                    <option value="Agriculture">Agriculture</option>
                                                                    <option value="Construction">Construction</option>
                                                                    <option value="Education">Education</option>
                                                                    <option value="Pharmaceutical">Pharmaceutical</option>
                                                                    <option value="Food">Food</option>
                                                                    <option value="HealthCare">HealthCare</option>
                                                                    <option value="Hospitality">Hospitality</option>
                                                                    <option value="Entertainment">Entertainment</option>
                                                                    <option value="News Media">News Media</option>
                                                                    <option value="Energy">Energy</option>
                                                                    <option value="Manufacturing">Manufacturing</option>
                                                                    <option value="Music">Music</option>
                                                                    <option value="Mining">Mining</option>
                                                                    <option value="WorldWide Web">WorldWide Web</option>
                                                                    <option value="Electronics">Electronics</option>
                                                                    <option value="Transport">Pharmaceutical</option>
                                                                    <option value="Transport">Aerospace</option>
                                                                </select>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="aoe" class="mtop">Area of Establishment (SqM): </label>
                                                                <input type="number" style="text-align:left;" name="aoe" class="form-control" placeholder="Enter your AOE" required>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal Footer -->
                                                <div class="modal-footer" style="justify-content: flex-start;">
                                                    <div class="paa">
                                                        <input type="hidden" class="busid" name="id">
                                                        <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Clearance -->
                                <div class="modal fade" id="modalClearance" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Barangay Clearance Form</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="generate_brgycle_auto.php" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="status">Status:</label>
                                                                <select class="form-control" style="text-align:left;" name="status" id="status" placeholder="Enter Status" value="<?= $userdetails['status'] ?>" required>
                                                                    <option value="">Choose your Status</option>
                                                                    <option value="Single">Single</option>
                                                                    <option value="In a relationship">In a relationship</option>
                                                                    <option value="Engaged">Engaged</option>
                                                                    <option value="Married">Married</option>
                                                                    <option value="Widowed">Widowed</option>
                                                                    <option value="Divorces">Divorced</option>
                                                                </select>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="purposes">Purposes:</label>
                                                                <select class="form-control" style="text-align:left;" name="purpose" id="purposes" placeholder="Enter Status" required>
                                                                    <option value="">Choose your Purpose</option>
                                                                    <option value="Local Employment">Local Employment</option>
                                                                    <option value="Loan">Loan</option>
                                                                    <option value="School/S.S.S Requirements">School/S.S.S Requirements</option>
                                                                    <option value="NBI/Police Clearance">NBI/Police Clearance</option>
                                                                    <option value="Postal ID Application">Postal ID</option>
                                                                    <option value="Bank Requirements">Bank Requirements</option>
                                                                    <option value="Water/Electric service Connection">Water/Electric service Connection</option>
                                                                    <option value="Legal Purpose">Legal Purpose</option>
                                                                    <option value="Others">Others</option>
                                                                </select>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Modal Footer -->
                                                <div class="modal-footer" style="justify-content: flex-start;">
                                                    <div class="paa">
                                                        <input type="hidden" class="clearid" name="id">
                                                        <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <!-- Indigency -->
                                <div class="modal fade" id="modalIndigency" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Certificate of Indigency Form</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="generate_indigency_auto.php" method="post">
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label class="mtop">Date Needed: </label>
                                                                <input type="date" class="form-control" name="date" style="text-align:left;" required min="<?php echo date('Y-m-d'); ?>" required>
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="purposes">Purposes:</label>
                                                                <select class="form-control" style="text-align:left;" name="purpose" id="purposes" required>
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
                                                    </div>
                                                </div>
                                                <!-- Modal Footer -->
                                                <div class="modal-footer" style="justify-content: flex-start;">
                                                    <div class="paa">
                                                        <input type="hidden" class="indiid" name="id">
                                                        <button name="generate" type="submit" class="btn btn-info">Generate</button>
                                                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </td>
                            <td> <?= $view['control_no']; ?> </td>
                            <!-- <td> <?= $view['email']; ?> </td> -->
                            <td> <?= $view['lname']; ?> </td>
                            <td> <?= $view['fname']; ?> </td>
                            <td> <?= $view['mi']; ?> </td>
                            <!-- <td> <?= $view['age']; ?> </td> -->
                            <!-- <td> <?= $view['sex']; ?> </td> -->
                            <!-- <td> <?= $view['status']; ?> </td> -->
                            <!-- <td> <?= $view['houseno']; ?>, <?= $view['street']; ?>, <?= $view['brgy']; ?> </td> -->
                            <!-- <td> <?= $view['contact']; ?> </td> -->
                            <td>
                                <button class="view-btn"
                                    type="button"
                                    data-toggle="modal"
                                    data-target="#viewModal"
                                    style="background-color:#0d6efd;color:#fff;border:1px solid #0d6efd;padding:8px 14px;border-radius:5px;cursor:pointer;min-width:130px;text-align:center;font-weight:600;"

                                    data-id="<?= $view['id_resident']; ?>"
                                    data-email="<?= $view['email']; ?>"
                                    data-lname="<?= $view['lname']; ?>"
                                    data-fname="<?= $view['fname']; ?>"
                                    data-mi="<?= $view['mi']; ?>"
                                    data-age="<?= $view['age']; ?>"
                                    data-sex="<?= $view['sex']; ?>"
                                    data-status="<?= $view['status']; ?>"
                                    data-address="<?= $view['houseno']; ?>, <?= $view['street']; ?>, <?= $view['brgy']; ?>"
                                    data-contact="<?= $view['contact']; ?>"
                                    data-bdate="<?= $view['bdate']; ?>"
                                    data-bplace="<?= $view['bplace']; ?>"
                                    data-nationality="<?= $view['nationality']; ?>">
                                    View Details
                                </button>
                            </td>
                            <div class="modal fade" id="viewModal" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">

                                        <div class="modal-header">
                                            <h5 class="modal-title">Resident Details</h5>
                                            <button type="button" class="close" data-dismiss="modal">
                                                <span>&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="row">

                                                <div class="col-md-6">
                                                    <p><strong>Full Name:</strong> <span id="v_fullname"></span></p>
                                                    <p><strong>Email:</strong> <span id="v_email"></span></p>
                                                    <p><strong>Contact:</strong> <span id="v_contact"></span></p>
                                                    <p><strong>Sex:</strong> <span id="v_sex"></span></p>
                                                    <p><strong>Status:</strong> <span id="v_status"></span></p>
                                                </div>

                                                <div class="col-md-6">
                                                    <p><strong>Age:</strong> <span id="v_age"></span></p>
                                                    <p><strong>Birthdate:</strong> <span id="v_bdate"></span></p>
                                                    <p><strong>Birthplace:</strong> <span id="v_bplace"></span></p>
                                                    <p><strong>Nationality:</strong> <span id="v_nationality"></span></p>
                                                    <p><strong>Address:</strong> <span id="v_address"></span></p>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button class="btn btn-dark" data-dismiss="modal">Close</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <?php if (!isset($_GET['deleted'])) {  ?>

                            <?php } else { ?>
                                <td><?= !empty($view['rejected_reason']) ? htmlspecialchars($view['rejected_reason']) : 'N/A'; ?></td>
                                <td>
                                    <?php
                                    if ($view['request_status'] == 'pending') {
                                        echo '<span style="color:red;">Archived</span>';
                                    } else {
                                        echo '<span style="color:red;">Archived</span>';
                                    }

                                    ?>

                                </td>
                                <td style="width:250px;">
                                    <form method="POST" action="update_status.php">

                                        <input type="hidden" name="id_resident2" value="<?= $view['id_resident']; ?>">

                                        <select name="status" class="form-control form-control-sm" onchange="this.form.submit()">


                                            <option value="Select Status">Select Status</option>
                                            <option value="APPROVED" <?= $view['status'] == 'APPROVED' ? 'selected' : '' ?>>APPROVED</option>


                                        </select>

                                    </form>
                                </td>

                            <?php } ?>
                        </tr>
                    <?php
                    }
                    ?>
                <?php
                }
                ?>
            </tbody>

        </table>

    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {

            document.querySelectorAll(".view-btn").forEach(function(button) {

                button.addEventListener("click", function() {

                    let fname = this.dataset.fname;
                    let lname = this.dataset.lname;
                    let mi = this.dataset.mi;

                    document.getElementById("v_fullname").textContent = fname + " " + mi + " " + lname;
                    document.getElementById("v_email").textContent = this.dataset.email;
                    document.getElementById("v_contact").textContent = this.dataset.contact;
                    document.getElementById("v_sex").textContent = this.dataset.sex;
                    document.getElementById("v_status").textContent = this.dataset.status;
                    document.getElementById("v_age").textContent = this.dataset.age;
                    document.getElementById("v_bdate").textContent = this.dataset.bdate;
                    document.getElementById("v_bplace").textContent = this.dataset.bplace;
                    document.getElementById("v_nationality").textContent = this.dataset.nationality;
                    document.getElementById("v_address").textContent = this.dataset.address;

                });

            });

        });
    </script>
    <script>
        function param(w, h) {
            var width = w;
            var height = h;
            var left = (screen.width - width) / 2;
            var top = (screen.height - height) / 2;
            var params = 'width=' + width + ', height=' + height;
            params += ', top=' + top + ', left=' + left;
            params += ', directories=no';
            params += ', location=no';
            params += ', resizable=no';
            params += ', status=no';
            params += ', toolbar=no';
            return params;
        }

        function openWin(url) {
            myWindow = window.open(url, 'mywin', param(1000, 700));
            myWindow.focus();
        }

        function openCustom(url, w, h) {
            myWindow = window.open(url, 'mywin', param(w, h));
            myWindow.focus();
        }
    </script>
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

<?php
}
$con = null;
?>