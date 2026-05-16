<?php
ini_set('display_errors', E_ALL);
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

$view = $residentbmis->view_request();
$residentbmis->create_resident();
$upreq = $residentbmis->approve_request();
$upstaff = $residentbmis->update_resident();
$residentbmis->reject_request();

$id_resident = $_GET['id_resident'] ?? null;
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Barangay Link</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="css/custom.css?v=1" rel="stylesheet"> <!-- Custom CSS -->
</head>

<body id="page-top">

<?php include('dashboard_sidebar_start.php'); ?>

<div class="container-fluid">

    <h1 class="mb-1 text-center">Pending Requests to Join</h1>
    <hr><br>

    <!-- Search Bar -->
    <div class="col-md-12">
        <form method="POST" action="">
            <div class="input-icons">
                <i class="fa fa-search icon"></i>
                <input type="search" class="form-control search" name="keyword" style="border-radius: 30px;" required>
            </div>
            <center>
                <button class="btn btn" name="search_resident"
                    style="background-color: #2563EB; color: white;">
                    Search
                </button>
                <a href="admn_resident_request.php" class="btn btn-info">Reload</a>
            </center>
        </form>
    </div>
    <?php include('flexbox.php'); ?>
    <br>



    <?php include('including_style.php'); ?>
    <div class="table-responsive  table-scroll">
        <table class="table table-hover text-center table-bordered">
            <thead class="alert-info">
                <tr>
                    <th>Actions</th>
                    <th>Control Number</th>
                    <th>Email</th>
                    <th>Surname</th>
                    <th>First name</th>
                    <!-- <th>Middle name</th> -->
                    <!-- <th>Age</th>
                    <th>Sex</th> -->
                    <!-- <th>Address</th> -->
                    <!-- <th>Contact #</th> -->
                    <!-- <th>Birth date</th> -->
                    <!-- <th>Birth place</th> -->
                    <th>Nationality</th>
                    <th>Family Head</th>
                    <th>More</th> <!-- ADDED -->
                </tr>
            </thead>

            <tbody>
                <?php if (is_array($view)) { ?>
                    <?php foreach ($view as $row) { ?>
                        <tr>
                            <?php include('styled_button.php'); ?>
                            <td>
                                <form method="POST" action="" onsubmit="return confirm('Approve this request?');" style="display:inline-block;">
                                    <input type="hidden" name="id_resident" value="<?= $row['id_resident']; ?>">
                                    <button type="submit" name="approve_request" class="btn btn-success btn">Approve</button>
                                </form>
                                <button
                                    type="button"
                                    class="btn btn-danger btn openRejectModal"
                                    data-id="<?= $row['id_resident']; ?>"
                                    data-name="<?= htmlspecialchars(trim($row['fname'] . ' ' . $row['lname']), ENT_QUOTES, 'UTF-8'); ?>">
                                    Reject
                                </button>
                            </td>
                            <td><?= $row['control_no']; ?></td>
                            <td><?= $row['email']; ?> </td>

                            <td><?= $row['lname']; ?></td>
                            <td><?= $row['fname']; ?></td>
                            <!-- <td><?= $row['mi']; ?></td> -->
                            <!-- <td><?= $row['age']; ?></td> -->
                            <!-- <td><?= $row['sex']; ?></td> -->
                            <!-- <td><?= $row['houseno']; ?>, <?= $row['street']; ?>, <?= $row['brgy']; ?></td> -->
                            <!-- <td><?= $row['contact']; ?></td> -->
                            <!-- <td><?= $row['bdate']; ?></td> -->
                            <!-- <td><?= $row['bplace']; ?></td> -->
                            <td><?= $row['nationality']; ?></td>
                            <td><?= $row['head_of_family']; ?></td>

                            <td>
                                <!-- BUTTON TO OPEN MODAL -->
                                <button
                                    class="btn btn-info btn-sm"
                                    data-toggle="modal"
                                    data-target="#viewResidentModal<?= $row['id_resident']; ?>">
                                    View Details
                                </button>
                            </td>
                        </tr>

                        <!-- RESIDENT DETAILS MODAL -->
                        <div class="modal fade" id="viewResidentModal<?= $row['id_resident']; ?>" tabindex="-1" role="dialog">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title">Resident Registration Details</h5>
                                        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                                    </div>

                                    <div class="modal-body">

                                        <h5><b>Personal Information</b></h5>
                                        <hr>

                                        <div class="row">
                                            <div class="col-md-4"><b>Surname:</b> <?= $row['lname']; ?></div>
                                            <div class="col-md-4"><b>First Name:</b> <?= $row['fname']; ?></div>
                                            <div class="col-md-4"><b>Middle Name:</b> <?= $row['mi']; ?></div>
                                        </div>

                                        <br>

                                        <div class="row">
                                            <div class="col-md-4"><b>Age:</b> <?= $row['age']; ?></div>
                                            <div class="col-md-4"><b>Sex:</b> <?= $row['sex']; ?></div>
                                            <div class="col-md-4"><b>Contact:</b> <?= $row['contact']; ?></div>
                                        </div>

                                        <br>

                                        <div class="row">
                                            <div class="col-md-6"><b>Birthdate:</b> <?= $row['bdate']; ?></div>
                                            <div class="col-md-6"><b>Birthplace:</b> <?= $row['bplace']; ?></div>
                                        </div>

                                        <br>

                                        <h5><b>Address</b></h5>
                                        <hr>
                                        <p><?= $row['houseno']; ?>, <?= $row['street']; ?>, <?= $row['brgy']; ?></p>

                                        <br>

                                        <h5><b>Uploaded Valid IDs</b></h5>
                                        <hr>

                                        <div class="row text-center">
                                            <div class="col-md-6">
                                                <p><b>ID 1</b></p>
                                                <img src="uploads/validID/<?= $row['id1']; ?>"
                                                    class="img-fluid img-thumbnail preview-img"
                                                    style="max-height: 250px; cursor: pointer;"
                                                    data-toggle="modal"
                                                    data-target="#imagePreviewModal"
                                                    data-img="uploads/validID/<?= $row['id1']; ?>">
                                            </div>

                                            <div class="col-md-6">
                                                <p><b>ID 2</b></p>
                                                <img src="uploads/validID/<?= $row['id2']; ?>"
                                                    class="img-fluid img-thumbnail preview-img"
                                                    style="max-height: 250px; cursor: pointer;"
                                                    data-toggle="modal"
                                                    data-target="#imagePreviewModal"
                                                    data-img="uploads/validID/<?= $row['id2']; ?>">
                                            </div>
                                        </div>

                                    </div>

                                    <div class="modal-footer">
                                        <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- END MODAL -->


                    <?php } ?>
                <?php } ?>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="imagePreviewModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">

                <div class="modal-body text-center">
                    <img id="previewImage" src="" class="img-fluid" style="max-height: 90vh;">
                </div>

            </div>
        </div>
    </div>

    <!-- Tailwind Reject Reason Modal -->
    <div id="rejectReasonModal" class="fixed inset-0 z-[9999] hidden items-center justify-center bg-slate-900/60 p-4">
        <div class="w-full max-w-lg rounded-xl bg-white shadow-2xl">
            <div class="flex items-center justify-between border-b px-5 py-4">
                <h3 class="text-lg font-semibold text-slate-800">Reject Resident Request</h3>
                <button type="button" id="closeRejectModalBtn" class="rounded p-1 text-slate-500 hover:bg-slate-100 hover:text-slate-700">&times;</button>
            </div>

            <form method="POST" action="" id="rejectReasonForm" class="px-5 py-4">
                <input type="hidden" name="id_resident" id="rejectResidentId">

                <p class="mb-2 text-sm text-slate-600">Resident: <span id="rejectResidentName" class="font-semibold text-slate-800"></span></p>

                <label for="rejectReason" class="mb-1 block text-sm font-medium text-slate-700">Reason for rejection</label>
                <textarea
                    id="rejectReason"
                    name="reject_reason"
                    maxlength="128"
                    required
                    class="w-full rounded-lg border border-slate-300 p-3 text-sm focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-200"
                    placeholder="Type reason here (max 128 characters)"></textarea>
                <p class="mt-1 text-xs text-slate-500">This reason will be saved and emailed to the resident.</p>

                <div class="mt-4 flex justify-end gap-2">
                    <button type="button" id="cancelRejectModalBtn" class="rounded-lg border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">Cancel</button>
                    <button type="submit" name="reject_request" class="rounded-lg bg-red-600 px-4 py-2 text-sm font-semibold text-white hover:bg-red-700">Confirm Reject</button>
                </div>
            </form>
        </div>
    </div>


    </div>
    <!-- jQuery FIRST -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.bundle.js"></script>

    <script>
        $(document).ready(function() {

            $(document).on("click", ".preview-img", function() {
                var imgSrc = $(this).data("img");

                // Store the image source
                $("#previewImage").attr("src", imgSrc);

                // Close ALL modals first

            });

        });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const modal = document.getElementById('rejectReasonModal');
            const closeBtn = document.getElementById('closeRejectModalBtn');
            const cancelBtn = document.getElementById('cancelRejectModalBtn');
            const residentIdInput = document.getElementById('rejectResidentId');
            const residentNameLabel = document.getElementById('rejectResidentName');
            const rejectReasonInput = document.getElementById('rejectReason');

            function openRejectModal(id, name) {
                residentIdInput.value = id || '';
                residentNameLabel.textContent = name || '';
                rejectReasonInput.value = '';
                modal.classList.remove('hidden');
                modal.classList.add('flex');
                rejectReasonInput.focus();
            }

            function closeRejectModal() {
                modal.classList.add('hidden');
                modal.classList.remove('flex');
            }

            document.querySelectorAll('.openRejectModal').forEach(function(btn) {
                btn.addEventListener('click', function() {
                    openRejectModal(this.dataset.id, this.dataset.name);
                });
            });

            closeBtn.addEventListener('click', closeRejectModal);
            cancelBtn.addEventListener('click', closeRejectModal);

            modal.addEventListener('click', function(e) {
                if (e.target === modal) {
                    closeRejectModal();
                }
            });
        });
    </script>

    <?php include('dashboard_sidebar_end.php'); ?>

    </body>

</html>