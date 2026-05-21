<?php
error_reporting(E_ALL ^ E_WARNING);
ini_set('display_errors', 1);

require('classes/resident.class.php');
$userdetails = $bmis->get_userdata();
$bmis->validate_admin();

$connection = $bmis->openConn();
$keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : '';

$sql = "
    SELECT transaction_no, full_name, date_issued
    FROM (
        SELECT
            control_no AS transaction_no,
            TRIM(CONCAT(lname, ', ', fname, IF(mi IS NULL OR mi = '', '', CONCAT(' ', mi)))) AS full_name,
<<<<<<< HEAD
            timestamp_date AS date_issued
=======
            date AS date_issued
>>>>>>> 7b4f702d2df987b4325173a8cc7ad50a01210789
        FROM tbl_rescert
        WHERE status <> 'DELETED'

        UNION ALL

        SELECT
            control_no AS transaction_no,
            TRIM(CONCAT(lname, ', ', fname, IF(mi IS NULL OR mi = '', '', CONCAT(' ', mi)))) AS full_name,
<<<<<<< HEAD
            timestamp_date AS date_issued
=======
            NULL AS date_issued
>>>>>>> 7b4f702d2df987b4325173a8cc7ad50a01210789
        FROM tbl_bspermit
        WHERE status <> 'DELETED'

        UNION ALL

        SELECT
            control_no AS transaction_no,
            TRIM(CONCAT(lname, ', ', fname, IF(mi IS NULL OR mi = '', '', CONCAT(' ', mi)))) AS full_name,
<<<<<<< HEAD
            timestamp_date AS date_issued
=======
            date_issued AS date_issued
>>>>>>> 7b4f702d2df987b4325173a8cc7ad50a01210789
        FROM tbl_clearance
        WHERE status2 <> 'DELETED'

        UNION ALL

        SELECT
            control_no AS transaction_no,
            TRIM(CONCAT(lname, ', ', fname, IF(mi IS NULL OR mi = '', '', CONCAT(' ', mi)))) AS full_name,
<<<<<<< HEAD
            timestamp_date AS date_issued
=======
            date AS date_issued
>>>>>>> 7b4f702d2df987b4325173a8cc7ad50a01210789
        FROM tbl_indigency
        WHERE status <> 'DELETED'

        UNION ALL

        SELECT
            control_no AS transaction_no,
            TRIM(CONCAT(lname, ', ', fname, IF(mi IS NULL OR mi = '', '', CONCAT(' ', mi)))) AS full_name,
<<<<<<< HEAD
            timestamp_date AS date_issued
=======
            timeapplied AS date_issued
>>>>>>> 7b4f702d2df987b4325173a8cc7ad50a01210789
        FROM tbl_blotter
        WHERE status <> 'DELETED'
    ) AS transaction_logs
";

$params = [];
if ($keyword !== '') {
    $sql .= " WHERE transaction_no LIKE :kw OR full_name LIKE :kw OR DATE_FORMAT(date_issued, '%Y-%m-%d') LIKE :kw ";
    $params[':kw'] = '%' . $keyword . '%';
}

<<<<<<< HEAD
$sql .= " ORDER BY date_issued DESC";
=======
$sql .= " ORDER BY date_issued DESC, transaction_no DESC";
>>>>>>> 7b4f702d2df987b4325173a8cc7ad50a01210789

$stmt = $connection->prepare($sql);
$stmt->execute($params);
$logs = $stmt->fetchAll(PDO::FETCH_ASSOC);

$bmis->closeConn();

include('dashboard_sidebar_start.php');
?>

<style>
    .input-icons i {
        position: absolute;
    }

    .input-icons {
        width: 80%;
        margin-bottom: 10px;
        margin-left: auto;
        margin-right: auto;
    }

    .icon {
        padding: 10px;
        min-width: 40px;
    }

    .form-control {
        text-align: center;
    }
</style>

<div class="container-fluid">
    <div class="row">
        <div class="col text-center">
            <h1>Transaction Logs</h1>
        </div>
    </div>

    <hr>
    <br><br>

    <div class="row">
        <div class="col">
            <form method="GET">
                <div class="input-icons">
                    <i class="fa fa-search icon"></i>
                    <input type="search" class="form-control" name="keyword" value="<?= htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>" style="border-radius: 30px;" placeholder="Search Transaction No, Full Name, or Date (YYYY-MM-DD)">
                </div>
                <button class="btn btn-success" type="submit" style="width: 70px; font-size: 15px; border-radius:5px; margin-left:42%; background-color: #2563EB; color: white;">Search</button>
                <a href="admn_transaction_logs.php" class="btn btn-info" style="width: 70px; font-size: 15px; border-radius:5px;">Reload</a>
            </form>
            <br>
        </div>
    </div>

    <div class="table-responsive table-scroll">
        <table class="table table-hover text-center table-bordered">
            <thead class="alert-info">
                <tr>
                    <th>Transaction No.</th>
                    <th>Full Name</th>
                    <th>Date Issued</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($logs)): ?>
                    <?php foreach ($logs as $log): ?>
                        <tr>
                            <td><?= htmlspecialchars($log['transaction_no'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td><?= htmlspecialchars($log['full_name'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td>
                                <?php
                                if (!empty($log['date_issued'])) {
                                    $dateValue = strtotime($log['date_issued']);
                                    echo $dateValue ? date('F d, Y h:i A', $dateValue) : htmlspecialchars($log['date_issued'], ENT_QUOTES, 'UTF-8');
                                } else {
                                    echo 'N/A';
                                }
                                ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="3">No transaction logs found.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?php include('dashboard_sidebar_end.php'); ?>
