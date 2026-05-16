<?php
// require the database connection
require 'classes/conn.php';
if (isset($_POST['search_clearance'])) {
    $keyword = $_POST['keyword'];
?>
    <?php
    // include('dashboard_sidebar_start.php');
    ?>
    <table class="table table-hover text-center table-bordered table-responsive">
        <thead class="alert-info">

            <tr>
                <th> Surname </th>
                <th> First Name </th>
                <th> Middle Name </th>
                <th> Purpose </th>
                <th> Address </th>
                <th> Status </th>
                <th> Age </th>
                <th style="width: 8.5%;"> Status</th>
                <th> Rejected Reason </th>
                <th style="width: 20%;"> Actions</th>
                <th style="width: 20%;"> Update Status </th>

            </tr>
        </thead>
        <tbody>
            <?php
            $stmnt = $conn->prepare("SELECT * FROM `tbl_clearance` WHERE `lname` LIKE '%$keyword%' or  `mi` LIKE '%$keyword%' or  
                    `fname` LIKE '%$keyword%'  ORDER BY id_clearance DESC  ");
            $stmnt->execute();

            while ($view = $stmnt->fetch()) {
            ?>
                <tr>
                    <td> <?= $view['lname']; ?> </td>
                    <td> <?= $view['fname']; ?> </td>
                    <td> <?= $view['mi']; ?> </td>
                    <td> <?= $view['purpose']; ?> </td>
                    <td> <?= $view['houseno']; ?>, <?= $view['street']; ?>, <?= $view['brgy']; ?>, <?= $view['municipal']; ?></td>
                    <td> <?= $view['status']; ?> </td>
                    <td> <?= $view['age']; ?> </td>
                    <?php include('include_statuses2.php'); ?>
                          <td><?= !empty($view['rejected_reason']) ? htmlspecialchars($view['rejected_reason']) : 'N/A'; ?></td>
                          <td>
                        <form action="" method="post">



                            <a class="btn btn-success"
                                style="width: 80px; font-size: 15px; border-radius:5px; margin-bottom: 2px;"
                                href="brgyclearance_form.php?id_clearance=<?= $view['id_clearance']; ?>"
                                onclick="openPopup(this.href); return false;">
                                Generate
                            </a>





                            <input type="hidden" name="id_clearance" value="<?= $view['id_clearance']; ?>">
                            <!-- <button class="btn btn-danger" type="submit" style="width: 80px; font-size: 15px; border-radius:5px;" name="delete_clearance"> Delete </button> -->
                        </form>
                    </td>
                    <td style="width:180px;">
                        <form method="POST" action="update_status.php" class="clearance-status-form">

                            <input type="hidden" name="id_clearance" value="<?= $view['id_clearance']; ?>">
                            <input type="hidden" name="reject_reason" class="reject-reason-input" value="<?= htmlspecialchars($view['rejected_reason'] ?? '', ENT_QUOTES, 'UTF-8'); ?>">

                            <select name="status" class="form-control form-control-sm clearance-status-select" data-id="<?= $view['id_clearance']; ?>">

                                <option value="PENDING" <?= $view['status2'] == 'PENDING' ? 'selected' : '' ?>>PENDING</option>

                                <option value="APPROVED" <?= $view['status2'] == 'APPROVED' ? 'selected' : '' ?>>APPROVED</option>

                                <option value="REJECTED" <?= $view['status2'] == 'REJECTED' ? 'selected' : '' ?>>REJECTED</option>

                                <option value="READY FOR PICKUP" <?= $view['status2'] == 'READY FOR PICKUP' ? 'selected' : '' ?>>READY FOR PICKUP</option>

                                <option value="CLAIMED" <?= $view['status2'] == 'CLAIMED' ? 'selected' : '' ?>>CLAIMED</option>

                                <option value="DELETED" <?= $view['status2'] == 'DELETED' ? 'selected' : '' ?>>DELETED</option>

                            </select>

                        </form>
                    </td>

                </tr>
            <?php
            }
            ?>
        </tbody>

    </table>

<?php
} else {
?>
    <?php include('including_style.php'); ?>
    <div class="table-responsive  table-scroll">
        <table class="table table-hover text-center table-bordered">
            <thead class="alert-info">
                <tr>
                    <th> Control # </th>
                    <th style="width: 10%;"> Surname </th>
                    <th style="width: 10%;"> First Name </th>
                    <th style="width: 10%;"> Middle Name </th>
                    <th style="width: 20%;"> Purpose </th>
                    <th style="width: 20%;"> Address </th>
                    <th> Marital Status </th>
                    <th style="width: 8.5%;"> Age </th>
                    <th style="width: 8.5%;"> Status</th>
                    <th> Rejected Reason </th>
                    <th style="width: 20%;"> Actions</th>
                    <th style="width: 20%;"> Update Status </th>

                </tr>
            </thead>

            <tbody>
                <?php if (is_array($view)) { ?>
                    <?php foreach ($view as $view) { ?>
                        <tr>
                            <td> <?= $view['control_no']; ?> </td>
                            <td> <?= $view['lname']; ?> </td>
                            <td> <?= $view['fname']; ?> </td>
                            <td> <?= $view['mi']; ?> </td>
                            <td> <?= $view['purpose']; ?> </td>
                            <td> <?= $view['houseno']; ?>, <?= $view['street']; ?>, <?= $view['brgy']; ?>, <?= $view['municipal']; ?></td>
                            <td> <?= $view['status']; ?> </td>
                            <td> <?= $view['age']; ?> </td>
                            <?php include('include_statuses2.php'); ?>
                                     <td><?= !empty($view['rejected_reason']) ? htmlspecialchars($view['rejected_reason']) : 'N/A'; ?></td>
                                     <td>
                                <form action="" method="post">



                                    <a class="btn btn-secondary"
                                        style="width: 80px; font-size: 15px; border-radius:5px; margin-bottom: 2px;"
                                        href="brgyclearance_form.php?id_clearance=<?= $view['id_clearance']; ?>"
                                        onclick="openPopup(this.href); return false;">
                                        Generate
                                    </a>





                                    <input type="hidden" name="id_clearance" value="<?= $view['id_clearance']; ?>">
                                    <!-- <button class="btn btn-danger" type="submit" style="width: 80px; font-size: 15px; border-radius:5px;" name="delete_clearance"> Delete </button> -->
                                </form>
                            </td>
                            <td style="width:180px;">
                                <form method="POST" action="update_status.php" class="clearance-status-form">

                                    <input type="hidden" name="id_clearance" value="<?= $view['id_clearance']; ?>">
                                    <input type="hidden" name="reject_reason" class="reject-reason-input" value="<?= htmlspecialchars($view['rejected_reason'] ?? '', ENT_QUOTES, 'UTF-8'); ?>">

                                    <select name="status" class="form-control form-control-sm clearance-status-select" data-id="<?= $view['id_clearance']; ?>">

                                        <option value="PENDING" <?= $view['status2'] == 'PENDING' ? 'selected' : '' ?>>PENDING</option>

                                        <option value="APPROVED" <?= $view['status2'] == 'APPROVED' ? 'selected' : '' ?>>APPROVED</option>

                                        <option value="REJECTED" <?= $view['status2'] == 'REJECTED' ? 'selected' : '' ?>>REJECTED</option>

                                        <option value="READY FOR PICKUP" <?= $view['status2'] == 'READY FOR PICKUP' ? 'selected' : '' ?>>READY FOR PICKUP</option>

                                        <option value="CLAIMED" <?= $view['status2'] == 'CLAIMED' ? 'selected' : '' ?>>CLAIMED</option>

                                        <option value="DELETED" <?= $view['status2'] == 'DELETED' ? 'selected' : '' ?>>DELETED</option>

                                    </select>

                                </form>
                            </td>

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
function openPopup(url) {

    const width = 900;
    const height = 700;

    const left = (screen.width / 2) - (width / 2);
    const top = (screen.height / 2) - (height / 2);

    window.open(
        url,
        'generateWindow',
        `width=${width},height=${height},top=${top},left=${left},scrollbars=yes,resizable=yes`
    );
}
</script>
<?php
}
$con = null;
?>

<script src="https://cdn.tailwindcss.com"></script>

<div id="clearanceRejectReasonModal" class="fixed inset-0 z-[9999] hidden items-center justify-center bg-slate-900/60 p-4">
    <div class="w-full max-w-lg rounded-xl bg-white shadow-2xl">
        <div class="flex items-center justify-between border-b px-5 py-4">
            <h3 class="text-lg font-semibold text-slate-800">Reject Barangay Clearance</h3>
            <button type="button" id="closeClearanceRejectModalBtn" class="rounded p-1 text-slate-500 hover:bg-slate-100 hover:text-slate-700">&times;</button>
        </div>
        <form method="POST" action="update_status.php" id="clearanceRejectReasonForm" class="px-5 py-4">
            <input type="hidden" name="id_clearance" id="clearanceRejectId">
            <input type="hidden" name="status" value="REJECTED">
            <label for="clearanceRejectReason" class="mb-1 block text-sm font-medium text-slate-700">Reason for rejection</label>
            <textarea id="clearanceRejectReason" name="reject_reason" maxlength="129" required
                class="w-full rounded-lg border border-slate-300 p-3 text-sm focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-200"
                placeholder="Type reason here (max 129 characters)"></textarea>
            <p class="mt-1 text-xs text-slate-500">This reason will be stored and included in the email.</p>
            <div class="mt-4 flex justify-end gap-2">
                <button type="button" id="cancelClearanceRejectModalBtn" class="rounded-lg border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">Cancel</button>
                <button type="submit" class="rounded-lg bg-red-600 px-4 py-2 text-sm font-semibold text-white hover:bg-red-700">Confirm Reject</button>
            </div>
        </form>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const modal = document.getElementById('clearanceRejectReasonModal');
        const closeBtn = document.getElementById('closeClearanceRejectModalBtn');
        const cancelBtn = document.getElementById('cancelClearanceRejectModalBtn');
        const rejectIdInput = document.getElementById('clearanceRejectId');
        const reasonInput = document.getElementById('clearanceRejectReason');
        function openModal(id) {
            rejectIdInput.value = id || '';
            reasonInput.value = '';
            modal.classList.remove('hidden');
            modal.classList.add('flex');
            reasonInput.focus();
        }
        function closeModal() {
            modal.classList.add('hidden');
            modal.classList.remove('flex');
        }
        document.querySelectorAll('.clearance-status-select').forEach(function(select) {
            select.addEventListener('focus', function() { this.dataset.previous = this.value; });
            select.addEventListener('change', function() {
                const selectedStatus = this.value;
                const form = this.closest('form.clearance-status-form');
                if (!form) return;
                if (selectedStatus === 'REJECTED') {
                    const id = this.dataset.id || '';
                    this.value = this.dataset.previous || this.value;
                    openModal(id);
                    return;
                }
                const reasonInputField = form.querySelector('.reject-reason-input');
                if (reasonInputField) reasonInputField.value = '';
                form.submit();
            });
        });
        closeBtn.addEventListener('click', closeModal);
        cancelBtn.addEventListener('click', closeModal);
        modal.addEventListener('click', function(e) { if (e.target === modal) closeModal(); });
    });
</script>