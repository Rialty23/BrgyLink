<?php
ini_set('display_errors', 0);
error_reporting(E_ALL ^ E_WARNING);
require('classes/staff.class.php');

$userdetails = $bmis->get_userdata();
$bmis->validate_admin();

$staffbmis->create_staff();
$staffbmis->update_staff();
$staffbmis->delete_staff();
$view = $staffbmis->view_staff();
?>

<?php include('dashboard_sidebar_start.php'); ?>

<style>
    .staff-table-wrap {
        width: 100%;
    }

    .staff-table {
        width: 100% !important;
        table-layout: fixed;
    }

    .staff-table td,
    .staff-table th {
        vertical-align: middle;
    }
</style>

<div class="container-fluid">
    <h1 class="mb-1 text-center">Barangay Staff Data</h1>
    <hr>
    <br>

    <button class="btn btn-info" style="width: 95px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 8px;" data-toggle="modal" data-target="#addStaffModal">
        <i class="fas fa-plus" style="padding-right:4px;"></i>Add
    </button>

    <div class="modal fade" id="addStaffModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Staff</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input name="fullname" type="text" class="form-control" placeholder="Enter full name" required>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Term Started</label>
                                    <input type="date" class="form-control" name="term_started" required>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Term Ended</label>
                                    <input type="date" class="form-control" name="term_ended" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Position</label>
                                    <input name="position" type="text" class="form-control" placeholder="Enter position" required>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label>Status</label>
                                    <select class="form-control" name="status" required>
                                        <option value="">Choose Status</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <?php include('styled_button.php'); ?>
                        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                        <button id="styled_button_approve" name="add_staff" type="submit" class="btn btn-primary">Add Staff</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="table-responsive staff-table-wrap">
    <table class="table table-hover text-center table-bordered staff-table" id="dataTable" width="100%" cellspacing="0">
        <thead class="alert-info">
            <tr>
                <th style="width: 5%;">ID</th>
                <th style="width: 25%;">Full Name</th>
                <th style="width: 15%;">Position</th>
                <th style="width: 12%;">Term Started</th>
                <th style="width: 12%;">Term Ended</th>
                <th style="width: 10%;">Status</th>
                <th style="width: 21%;">Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php if (is_array($view)) { ?>
                <?php foreach ($view as $row) { ?>
                    <tr>
                        <td><?= $row['id']; ?></td>
                        <td><?= htmlspecialchars($row['fullname']); ?></td>
                        <td><?= htmlspecialchars($row['position']); ?></td>
                        <td><?= htmlspecialchars($row['term_started']); ?></td>
                        <td><?= htmlspecialchars($row['term_ended']); ?></td>
                        <td>
                            <?php if ($row['status'] === 'Active') { ?>
                                <span class="badge badge-success">Active</span>
                            <?php } else { ?>
                                <span class="badge badge-secondary">Inactive</span>
                            <?php } ?>
                        </td>
                        <td>
                            <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editStaffModal<?= $row['id']; ?>" style="width:80px;">Edit</button>
                            <form action="" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<?= $row['id']; ?>">
                                <button type="submit" name="delete_staff" class="btn btn-danger btn-sm" style="width:80px;" onclick="return confirm('Are you sure you want to delete this staff record?');">Delete</button>
                            </form>
                        </td>
                    </tr>

                    <div class="modal fade" id="editStaffModal<?= $row['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Edit Staff</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <form method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="id" value="<?= $row['id']; ?>">

                                        <div class="form-group">
                                            <label>Full Name</label>
                                            <input name="fullname" type="text" class="form-control" value="<?= htmlspecialchars($row['fullname']); ?>" required>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Term Started</label>
                                                    <input type="date" class="form-control" name="term_started" value="<?= htmlspecialchars($row['term_started']); ?>" required>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Term Ended</label>
                                                    <input type="date" class="form-control" name="term_ended" value="<?= htmlspecialchars($row['term_ended']); ?>" required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Position</label>
                                                    <input name="position" type="text" class="form-control" value="<?= htmlspecialchars($row['position']); ?>" required>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label>Status</label>
                                                    <select class="form-control" name="status" required>
                                                        <option value="Active" <?= $row['status'] === 'Active' ? 'selected' : ''; ?>>Active</option>
                                                        <option value="Inactive" <?= $row['status'] === 'Inactive' ? 'selected' : ''; ?>>Inactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" name="update_staff" class="btn btn-primary">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>
        </tbody>
    </table>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.2.6/js/bootstrap-modalmanager.min.js" integrity="sha512-/HL24m2nmyI2+ccX+dSHphAHqLw60Oj5sK8jf59VWtFWZi9vx7jzoxbZmcBeeTeCUc7z1mTs3LfyXGuBU32t+w==" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link href="customcss/regiformstyle.css" rel="stylesheet" type="text/css">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>
<script src="bootstrap/js/bootstrap.bundle.js" type="text/javascript"></script>

<?php include('dashboard_sidebar_end.php'); ?>
