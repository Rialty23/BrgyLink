<?php
include('dbcon.php');

function getEmailOfResident($table_type, $id_column, $id)
{
    global $db_connection;

    // Step 1 & 2 combined using JOIN (safer)
    $query = "
        SELECT r.email
        FROM $table_type t
        INNER JOIN tbl_resident r ON t.id_resident = r.id_resident
        WHERE t.$id_column = ?
    ";

    $stmt = mysqli_prepare($db_connection, $query);
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($row = mysqli_fetch_assoc($result)) {
        return $row['email'];
    }

    return null;
}

function getRequestDetails($table, $idColumn, $id)
{
    global $db_connection;

    $allowedSources = [
        'tbl_rescert' => 'id_rescert',
        'tbl_bspermit' => 'id_bspermit',
        'tbl_clearance' => 'id_clearance',
        'tbl_indigency' => 'id_indigency',
        'tbl_blotter' => 'id_blotter',
        'tbl_resident' => 'id_resident',
    ];

    if (!isset($allowedSources[$table]) || $allowedSources[$table] !== $idColumn) {
        return null;
    }

    if ($table === 'tbl_resident') {
        $query = "SELECT t.*, t.email AS resident_email, t.lname AS resident_lname,
                         t.fname AS resident_fname, t.mi AS resident_mi
                  FROM tbl_resident t WHERE t.id_resident = ?";
    } else {
        $query = "SELECT t.*, r.email AS resident_email, r.lname AS resident_lname,
                         r.fname AS resident_fname, r.mi AS resident_mi
                  FROM $table t
                  LEFT JOIN tbl_resident r ON t.id_resident = r.id_resident
                  WHERE t.$idColumn = ?";
    }

    $stmt = mysqli_prepare($db_connection, $query);
    mysqli_stmt_bind_param($stmt, 'i', $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    return mysqli_fetch_assoc($result) ?: null;
}

function formatEmailDate($value)
{
    if (empty($value)) {
        return 'Not available';
    }

    $timestamp = strtotime($value);
    return $timestamp ? date('F d, Y h:i A', $timestamp) : $value;
}

function buildStatusEmail($table, $idColumn, $id, $serviceName, $status, $rejectReason = '')
{
    $details = getRequestDetails($table, $idColumn, $id) ?: [];
    $status = strtoupper(trim($status));
    $requester = trim(($details['resident_fname'] ?? $details['fname'] ?? '') . ' '
        . ($details['resident_mi'] ?? $details['mi'] ?? '') . ' '
        . ($details['resident_lname'] ?? $details['lname'] ?? ''));
    $requestDate = $details['timestamp_date'] ?? $details['timeapplied'] ?? $details['date'] ?? null;
    $controlNumber = $details['control_no'] ?? '';

    $detailLines = "Date of update: " . date('F d, Y h:i A') . "\n"
        . "Date requested: " . formatEmailDate($requestDate) . "\n"
        . "Who requested: " . ($requester !== '' ? $requester : 'Not available') . "\n"
        . "Document / Service: $serviceName\n";

    if ($controlNumber !== '') {
        $detailLines .= "Control number: $controlNumber\n";
    }

    if ($status === 'REJECTED' && $rejectReason !== '') {
        $detailLines .= "Reason for rejection: $rejectReason\n";
    }

    $context = [];
    foreach ([
        'purpose' => 'Purpose',
        'bsname' => 'Business name',
        'bsindustry' => 'Business industry',
        'type' => 'Report type',
        'narrative' => 'Report details',
    ] as $field => $label) {
        if (!empty($details[$field])) {
            $context[] = "$label: " . $details[$field];
        }
    }

    if ($context) {
        $detailLines .= "\nAdditional details:\n" . implode("\n", $context) . "\n";
    }

    if ($status === 'REJECTED') {
        $intro = "We regret to inform you that, after careful review, your $serviceName request has been rejected. "
            . "Please review the reason provided below. You may correct the noted issue and submit a new request with complete and valid information.";
        $subject = "Decision on Your $serviceName Request: Rejected";
    } elseif ($status === 'APPROVED') {
        $intro = "We are pleased to inform you that your $serviceName request has been approved.";
        $subject = "$serviceName Request Status: Approved";
    } elseif ($status === 'READY FOR PICKUP') {
        $intro = "Your $serviceName is now ready for pickup at the barangay hall.";
        $subject = "$serviceName Request Status: Ready for Pickup";
    } elseif ($status === 'CLAIMED') {
        $intro = "Our records confirm that your $serviceName has been claimed.";
        $subject = "$serviceName Request Status: Claimed";
    } else {
        $intro = "The status of your $serviceName request has been updated. Please review the information below.";
        $subject = "$serviceName Request Status: " . ucwords(strtolower($status));
    }

    $statusColors = [
        'APPROVED' => ['#166534', '#dcfce7'],
        'REJECTED' => ['#991b1b', '#fee2e2'],
        'READY FOR PICKUP' => ['#6b21a8', '#f3e8ff'],
        'CLAIMED' => ['#374151', '#f3f4f6'],
        'PENDING' => ['#92400e', '#fef3c7'],
    ];
    [$statusColor, $statusBackground] = $statusColors[$status] ?? ['#1e40af', '#dbeafe'];

    $safeRequester = htmlspecialchars($requester !== '' ? $requester : 'Resident', ENT_QUOTES, 'UTF-8');
    $safeIntro = htmlspecialchars($intro, ENT_QUOTES, 'UTF-8');
    $safeStatus = htmlspecialchars($status, ENT_QUOTES, 'UTF-8');
    $safeDetails = nl2br(htmlspecialchars($detailLines, ENT_QUOTES, 'UTF-8'));

    $message = "Dear $safeRequester,<br><br>"
        . $safeIntro
        . "<div style=\"margin:20px 0;padding:14px;text-align:center;border-radius:6px;"
        . "color:$statusColor;background:$statusBackground;font-size:18px;font-weight:bold;\">"
        . "STATUS: $safeStatus</div>"
        . $safeDetails
        . "<br><br><strong>Where to inquire:</strong> East Modern Site Barangay Hall"
        . "<br>Please bring a valid ID and present your control number when claiming or following up on your request.";

    return [
        'email' => $details['resident_email'] ?? $details['email'] ?? null,
        'subject' => $subject,
        'title' => "$serviceName — $status",
        'message' => $message,
    ];
}

if (isset($_POST['status']) && isset($_POST['id_rescert'])) {

    $status = $_POST['status'];
    $id = (int) $_POST['id_rescert'];
    $rejectReason = trim($_POST['reject_reason'] ?? '');
    $rejectReason = substr($rejectReason, 0, 129);
    $safeReason = mysqli_real_escape_string($db_connection, $rejectReason);

    if ($status === 'REJECTED') {
        if ($rejectReason === '') {
            echo "<script>alert('Please provide a rejection reason.'); window.location.href=document.referrer;</script>";
            exit();
        }
        $query = "UPDATE tbl_rescert SET status='$status', rejected_reason='$safeReason' WHERE id_rescert='$id'";
    } else {
        $query = "UPDATE tbl_rescert SET status='$status', rejected_reason='' WHERE id_rescert='$id'";
    }

    if (mysqli_query($db_connection, $query)) {
        // DELETED is an internal archive action, so the resident is not emailed.
        if (strtoupper(trim($status)) !== 'DELETED') {
            $emailDetails = buildStatusEmail('tbl_rescert', 'id_rescert', $id, 'Certificate of Residency', $status, $rejectReason);
            $response = sendEmail([
                'email' => $emailDetails['email'],
                'subject' => $emailDetails['subject'],
                'title' => $emailDetails['title'],
                'message' => $emailDetails['message'],
            ]);
        }

        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}

if (isset($_POST['status']) && isset($_POST['id_bspermit'])) {

    $status = $_POST['status'];
    $id = (int) $_POST['id_bspermit'];
    $rejectReason = trim($_POST['reject_reason'] ?? '');
    $rejectReason = substr($rejectReason, 0, 129);
    $safeReason = mysqli_real_escape_string($db_connection, $rejectReason);

    if ($status === 'REJECTED') {
        if ($rejectReason === '') {
            echo "<script>alert('Please provide a rejection reason.'); window.location.href=document.referrer;</script>";
            exit();
        }
        $query = "UPDATE tbl_bspermit SET status='$status', rejected_reason='$safeReason' WHERE id_bspermit='$id'";
    } else {
        $query = "UPDATE tbl_bspermit SET status='$status', rejected_reason='' WHERE id_bspermit='$id'";
    }

    if (mysqli_query($db_connection, $query)) {
        // DELETED is an internal archive action, so the resident is not emailed.
        if (strtoupper(trim($status)) !== 'DELETED') {
            $emailDetails = buildStatusEmail('tbl_bspermit', 'id_bspermit', $id, 'Business Permit', $status, $rejectReason);
            $response = sendEmail([
                'email' => $emailDetails['email'],
                'subject' => $emailDetails['subject'],
                'title' => $emailDetails['title'],
                'message' => $emailDetails['message'],
            ]);
        }

        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
if (isset($_POST['status']) && isset($_POST['id_clearance'])) {

    $status = $_POST['status'];
    $id = (int) $_POST['id_clearance'];
    $rejectReason = trim($_POST['reject_reason'] ?? '');
    $rejectReason = substr($rejectReason, 0, 129);
    $safeReason = mysqli_real_escape_string($db_connection, $rejectReason);

    if ($status === 'REJECTED') {
        if ($rejectReason === '') {
            echo "<script>alert('Please provide a rejection reason.'); window.location.href=document.referrer;</script>";
            exit();
        }
        $query = "UPDATE tbl_clearance SET status2='$status', rejected_reason='$safeReason' WHERE id_clearance='$id'";
    } else {
        $query = "UPDATE tbl_clearance SET status2='$status', rejected_reason='' WHERE id_clearance='$id'";
    }

    if (mysqli_query($db_connection, $query)) {
        // DELETED is an internal archive action, so the resident is not emailed.
        if (strtoupper(trim($status)) !== 'DELETED') {
            $emailDetails = buildStatusEmail('tbl_clearance', 'id_clearance', $id, 'Barangay Clearance', $status, $rejectReason);
            $response = sendEmail([
                'email'   => $emailDetails['email'],
                'subject' => $emailDetails['subject'],
                'title'   => $emailDetails['title'],
                'message' => $emailDetails['message'],
            ]);
        }

        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
if (isset($_POST['status']) && isset($_POST['id_indigency'])) {

    $status = $_POST['status'];
    $id = (int) $_POST['id_indigency'];
    $rejectReason = trim($_POST['reject_reason'] ?? '');
    $rejectReason = substr($rejectReason, 0, 129);
    $safeReason = mysqli_real_escape_string($db_connection, $rejectReason);

    if ($status === 'REJECTED') {
        if ($rejectReason === '') {
            echo "<script>alert('Please provide a rejection reason.'); window.location.href=document.referrer;</script>";
            exit();
        }
        $query = "UPDATE tbl_indigency SET status='$status', rejected_reason='$safeReason' WHERE id_indigency='$id'";
    } else {
        $query = "UPDATE tbl_indigency SET status='$status', rejected_reason='' WHERE id_indigency='$id'";
    }

    if (mysqli_query($db_connection, $query)) {
        // DELETED is an internal archive action, so the resident is not emailed.
        if (strtoupper(trim($status)) !== 'DELETED') {
            $emailDetails = buildStatusEmail('tbl_indigency', 'id_indigency', $id, 'Certificate of Indigency', $status, $rejectReason);
            $response = sendEmail([
                'email'   => $emailDetails['email'],
                'subject' => $emailDetails['subject'],
                'title'   => $emailDetails['title'],
                'message' => $emailDetails['message'],
            ]);
        }
        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
if (isset($_POST['status']) && isset($_POST['id_blotter'])) {

    $status = $_POST['status'];
    $id = $_POST['id_blotter'];

    $query = "UPDATE tbl_blotter SET status='$status' WHERE id_blotter='$id'";

    if (mysqli_query($db_connection, $query)) {
        $emailDetails = buildStatusEmail('tbl_blotter', 'id_blotter', $id, 'Blotter Report', $status);

        $response = sendEmail([
            'email'   => $emailDetails['email'],
            'subject' => $emailDetails['subject'],
            'title'   => $emailDetails['title'],
            'message' => $emailDetails['message'],
        ]);
        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
if (isset($_POST['status']) && isset($_POST['id_resident'])) {

    $status = $_POST['status'];
    $id = $_POST['id_resident'];

    $query = "UPDATE tbl_resident SET status2='$status' WHERE id_resident='$id'";

    if (mysqli_query($db_connection, $query)) {
        // Get resident email dynamically
        // $email = getEmailOfResident('tbl_resident', 'id_resident', $id);

        // $response = sendEmail([
        //     'email'   => $email,
        //     'subject' => "Update for Your Resident Account",
        //     'title'   => "Resident Status Update",
        //     'message' => "Your resident account status has been updated to: $status.",
        // ]);
        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
if (isset($_POST['status']) && isset($_POST['id_resident2'])) {

    $status = $_POST['status'];
    $id = $_POST['id_resident2'];

    $query = "UPDATE tbl_resident SET status2='$status', request_status='approved' WHERE id_resident='$id'";

    if (mysqli_query($db_connection, $query)) {
        $emailDetails = buildStatusEmail('tbl_resident', 'id_resident', $id, 'Resident Account Registration', $status);

        $response = sendEmail([
            'email'   => $emailDetails['email'],
            'subject' => $emailDetails['subject'],
            'title'   => $emailDetails['title'],
            'message' => $emailDetails['message'],
        ]);
        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
