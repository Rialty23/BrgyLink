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
        $email = getEmailOfResident('tbl_rescert', 'id_rescert', $id);
        $emailMessage = "Your Certificate of Residency request has been updated to: $status.";
        if ($status === 'REJECTED') {
            $emailMessage .= "\nReason: $rejectReason";
        }
        $response = sendEmail([
            'email' => $email,
            'subject' => "Update for Your Certificate of Residency",
            'title' => "Certificate of Residency Status Update",
            'message' => $emailMessage,
        ]);

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
        $email = getEmailOfResident('tbl_bspermit', 'id_bspermit', $id);
        $emailMessage = "Your Business Permit request has been updated to: $status.";
        if ($status === 'REJECTED') {
            $emailMessage .= "\nReason: $rejectReason";
        }
        $response = sendEmail([
            'email' => $email,
            'subject' => "Update for Your Business Permit",
            'title' => "Business Permit Status Update",
            'message' => $emailMessage,
        ]);

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
        $email = getEmailOfResident('tbl_clearance', 'id_clearance', $id);
        $emailMessage = "Your Barangay Clearance request has been updated to: $status.";
        if ($status === 'REJECTED') {
            $emailMessage .= "\nReason: $rejectReason";
        }
        $response = sendEmail([
            'email'   => $email,
            'subject' => "Update for Your Barangay Clearance",
            'title'   => "Barangay Clearance Status Update",
            'message' => $emailMessage,
        ]);

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
        $email = getEmailOfResident('tbl_indigency', 'id_indigency', $id);
        $emailMessage = "Your Certificate of Indigency request has been updated to: $status.";
        if ($status === 'REJECTED') {
            $emailMessage .= "\nReason: $rejectReason";
        }
        $response = sendEmail([
            'email'   => $email,
            'subject' => "Update for Your Certificate of Indigency",
            'title'   => "Certificate of Indigency Status Update",
            'message' => $emailMessage,
        ]);
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
        // Get resident email dynamically
        $email = getEmailOfResident('tbl_blotter', 'id_blotter', $id);

        $response = sendEmail([
            'email'   => $email,
            'subject' => "Update for Your Blotter Report",
            'title'   => "Blotter Report Status Update",
            'message' => "Your Blotter Report request has been updated to: $status.",
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
        // Get resident email dynamically
        $email = getEmailOfResident('tbl_resident', 'id_resident', $id);

        $response = sendEmail([
            'email'   => $email,
            'subject' => "Update for Your Resident Account",
            'title'   => "Resident Status Approved",
            'message' => "Your resident account status has been updated to: $status and your request has been approved.",
        ]);
        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit();
    } else {
        echo "Error updating status.";
    }
}
