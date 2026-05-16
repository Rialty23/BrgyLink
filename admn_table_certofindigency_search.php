<?php
// require the database connection
require 'classes/conn.php';
$bmis->delete_certofindigency();
if (isset($_POST['search_certofindigency'])) {
    $keyword = $_POST['keyword'];
?>
    <table class="table table-hover text-center table-bordered table-responsive">

        <thead class="alert-info">
            <tr>
                <th style="width: 10%;"> Surname </th>
                <th style="width: 10%;"> First Name </th>
                <th style="width: 10%;"> Middle Name </th>
                <th style="width: 10%;"> Nationality </th>
                <th style="width: 10%;"> Address </th>
                <th style="width: 10%;"> Purpose </th>
                <th style="width: 10%;"> Date </th>
                <th style="width: 10%;"> Status </th>
                <th style="width: 10%;"> Rejected Reason </th>
                <th style="width: 20%;"> Actions</th>
                <th style="width: 20%;"> Update Status </th>

            </tr>
        </thead>

        <tbody>
            <?php

            $stmnt = $conn->prepare("SELECT * FROM `tbl_indigency` WHERE `lname` LIKE '%$keyword%' or  `mi` LIKE '%$keyword%' or  `fname` LIKE '%$keyword%'   order by id_indigency DESC");
            $stmnt->execute();

            while ($view = $stmnt->fetch()) {
            ?>
                <tr>

                    <td> <?= $view['lname']; ?> </td>
                    <td> <?= $view['fname']; ?> </td>
                    <td> <?= $view['mi']; ?> </td>
                    <td> <?= $view['nationality']; ?> </td>
                    <td> <?= $view['houseno']; ?>, <?= $view['street']; ?>, <?= $view['brgy']; ?>, <?= $view['municipal']; ?></td>
                    <td> <?= $view['purpose']; ?> </td>
                    <td> <?= $view['date']; ?> </td>
                    <?php include('include_statuses.php'); ?>
                          <td><?= !empty($view['rejected_reason']) ? htmlspecialchars($view['rejected_reason']) : 'N/A'; ?></td>
                          <td>
                        <form action="" method="post">



                            <a class="btn btn-success"
                                style="width: 80px; font-size: 15px; border-radius:5px; margin-bottom: 2px;"
                                href="indigency_form.php?id_indigency=<?= $view['id_indigency']; ?>"
                                onclick="openPopup(this.href); return false;">
                                Generate
                            </a>



                            <input type="hidden" name="id_indigency" value="<?= $view['id_indigency']; ?>">
                            <!-- <button class="btn btn-danger" style="width: 80px; font-size: 15px; border-radius:5px;" type="submit" name="delete_certofindigency"> Delete </button> -->
                        </form>
                    </td>
                    <td style="width:180px;">
                        <form method="POST" action="update_status.php" class="indigency-status-form">

                            <input type="hidden" name="id_indigency" value="<?= $view['id_indigency']; ?>">
                            <input type="hidden" name="reject_reason" class="reject-reason-input" value="<?= htmlspecialchars($view['rejected_reason'] ?? '', ENT_QUOTES, 'UTF-8'); ?>">

                            <select name="status" class="form-control form-control-sm indigency-status-select" data-id="<?= $view['id_indigency']; ?>">

                                <option value="PENDING" <?= $view['status'] == 'PENDING' ? 'selected' : '' ?>>PENDING</option>

                                <option value="APPROVED" <?= $view['status'] == 'APPROVED' ? 'selected' : '' ?>>APPROVED</option>

                                <option value="REJECTED" <?= $view['status'] == 'REJECTED' ? 'selected' : '' ?>>REJECTED</option>

                                <option value="READY FOR PICKUP" <?= $view['status'] == 'READY FOR PICKUP' ? 'selected' : '' ?>>READY FOR PICKUP</option>

                                <option value="CLAIMED" <?= $view['status'] == 'CLAIMED' ? 'selected' : '' ?>>CLAIMED</option>

                                <option value="DELETED" <?= $view['status'] == 'DELETED' ? 'selected' : '' ?>>DELETED</option>

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
                    <th style="width: 10%;"> Control # </th>
                    <th style="width: 10%;"> Surname </th>
                    <th style="width: 10%;"> First Name </th>
                    <th style="width: 10%;"> Middle Name </th>
                    <th style="width: 10%;"> Nationality </th>
                    <th style="width: 10%;"> Address </th>
                    <th style="width: 10%;"> Purpose </th>
                    <th style="width: 10%;"> Date </th>
                    <th style="width: 10%;"> Status </th>
                    <th style="width: 10%;"> Rejected Reason </th>
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
                            <td> <?= $view['nationality']; ?> </td>
                            <td> <?= $view['houseno']; ?>, <?= $view['street']; ?>, <?= $view['brgy']; ?>, <?= $view['municipal']; ?></td>
                            <td> <?= $view['purpose']; ?> </td>
                            <td> <?= $view['date']; ?> </td>
                            <?php include('include_statuses.php'); ?>
                                     <td><?= !empty($view['rejected_reason']) ? htmlspecialchars($view['rejected_reason']) : 'N/A'; ?></td>
                                     <td>
                                <form action="" method="post">



                                    <a class="btn btn-secondary"
                                        style="width: 80px; font-size: 15px; border-radius:5px; margin-bottom: 2px;"
                                        href="indigency_form.php?id_indigency=<?= $view['id_indigency']; ?>"
                                        onclick="openPopup(this.href); return false;">
                                        Generate
                                    </a>



                                    <input type="hidden" name="id_indigency" value="<?= $view['id_indigency']; ?>">
                                    <!-- <button class="btn btn-danger" style="width: 80px; font-size: 15px; border-radius:5px;" type="submit" name="delete_certofindigency"> Delete </button> -->
                                </form>
                            </td>
                            <td style="width:180px;">
                                <form method="POST" action="update_status.php" class="indigency-status-form">

                                    <input type="hidden" name="id_indigency" value="<?= $view['id_indigency']; ?>">
                                    <input type="hidden" name="reject_reason" class="reject-reason-input" value="<?= htmlspecialchars($view['rejected_reason'] ?? '', ENT_QUOTES, 'UTF-8'); ?>">

                                    <select name="status" class="form-control form-control-sm indigency-status-select" data-id="<?= $view['id_indigency']; ?>">

                                        <option value="PENDING" <?= $view['status'] == 'PENDING' ? 'selected' : '' ?>>PENDING</option>

                                        <option value="APPROVED" <?= $view['status'] == 'APPROVED' ? 'selected' : '' ?>>APPROVED</option>

                                        <option value="REJECTED" <?= $view['status'] == 'REJECTED' ? 'selected' : '' ?>>REJECTED</option>

                                        <option value="READY FOR PICKUP" <?= $view['status'] == 'READY FOR PICKUP' ? 'selected' : '' ?>>READY FOR PICKUP</option>

                                        <option value="CLAIMED" <?= $view['status'] == 'CLAIMED' ? 'selected' : '' ?>>CLAIMED</option>

                                        <option value="DELETED" <?= $view['status'] == 'DELETED' ? 'selected' : '' ?>>DELETED</option>

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
<?php
}
$con = null;
?>

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

<script src="https://cdn.tailwindcss.com"></script>

<div id="indigencyRejectReasonModal" class="fixed inset-0 z-[9999] hidden items-center justify-center bg-slate-900/60 p-4">
    <div class="w-full max-w-lg rounded-xl bg-white shadow-2xl">
        <div class="flex items-center justify-between border-b px-5 py-4">
            <h3 class="text-lg font-semibold text-slate-800">Reject Certificate of Indigency</h3>
            <button type="button" id="closeIndigencyRejectModalBtn" class="rounded p-1 text-slate-500 hover:bg-slate-100 hover:text-slate-700">&times;</button>
        </div>
        <form method="POST" action="update_status.php" id="indigencyRejectReasonForm" class="px-5 py-4">
            <input type="hidden" name="id_indigency" id="indigencyRejectId">
            <input type="hidden" name="status" value="REJECTED">
            <label for="indigencyRejectReason" class="mb-1 block text-sm font-medium text-slate-700">Reason for rejection</label>
            <textarea id="indigencyRejectReason" name="reject_reason" maxlength="129" required
                class="w-full rounded-lg border border-slate-300 p-3 text-sm focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-200"
                placeholder="Type reason here (max 129 characters)"></textarea>
            <p class="mt-1 text-xs text-slate-500">This reason will be stored and included in the email.</p>
            <div class="mt-4 flex justify-end gap-2">
                <button type="button" id="cancelIndigencyRejectModalBtn" class="rounded-lg border border-slate-300 px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">Cancel</button>
                <button type="submit" class="rounded-lg bg-red-600 px-4 py-2 text-sm font-semibold text-white hover:bg-red-700">Confirm Reject</button>
            </div>
        </form>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const modal = document.getElementById('indigencyRejectReasonModal');
        const closeBtn = document.getElementById('closeIndigencyRejectModalBtn');
        const cancelBtn = document.getElementById('cancelIndigencyRejectModalBtn');
        const rejectIdInput = document.getElementById('indigencyRejectId');
        const reasonInput = document.getElementById('indigencyRejectReason');
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
        document.querySelectorAll('.indigency-status-select').forEach(function(select) {
            select.addEventListener('focus', function() { this.dataset.previous = this.value; });
            select.addEventListener('change', function() {
                const selectedStatus = this.value;
                const form = this.closest('form.indigency-status-form');
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