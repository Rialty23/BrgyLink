<?php

error_reporting(E_ALL ^ E_WARNING);
ini_set('display_errors', 0);
require('classes/resident.class.php');

// Initialize
$userdetails = $bmis->get_userdata();
$bmis->validate_admin();

// Get data
$view = $residentbmis->view_blotter();
$id_blotter = isset($_GET['id_blotter']) ? $_GET['id_blotter'] : 0;

if ($id_blotter > 0) {
   $resident = $residentbmis->get_single_blotter($id_blotter);
}

/* =======================
   ANALYTICS + PREDICTION
======================= */
$statusCount = [];
$caseCount = [];
$monthlyCount = [];

foreach ($view as $row) {

   // Status count
   $status = $row['status'] ?? 'UNKNOWN';
   $statusCount[$status] = ($statusCount[$status] ?? 0) + 1;

   // Case count
   $case = $row['type'] ?? ($row['case_name'] ?? 'UNKNOWN');
   $case = $case ?: 'UNKNOWN';
   $caseCount[$case] = ($caseCount[$case] ?? 0) + 1;

   // Monthly trend
   $month = null;

   // Prefer `timeapplied` (date filed) for monthly case volume.
   $timeapplied = $row['timeapplied'] ?? null;
   if (is_string($timeapplied) && preg_match('/^\d{4}-\d{2}-\d{2}/', $timeapplied)) {
      // Fast path for MySQL DATETIME like "YYYY-MM-DD HH:MM:SS"
      $month = substr($timeapplied, 0, 7);
   } elseif (!empty($timeapplied)) {
      $ts = strtotime((string)$timeapplied);
      if ($ts !== false) {
         $month = date('Y-m', $ts);
      }
   }

   // Fallback: if `timeapplied` is missing, use incident date.
   if ($month === null) {
      $incidentDate = $row['date'] ?? null;
      if (is_string($incidentDate) && preg_match('/^\d{4}-\d{2}-\d{2}/', $incidentDate)) {
         $month = substr($incidentDate, 0, 7);
      } elseif (!empty($incidentDate)) {
         $ts = strtotime((string)$incidentDate);
         if ($ts !== false) {
            $month = date('Y-m', $ts);
         }
      }
   }

   if ($month !== null) {
      $monthlyCount[$month] = ($monthlyCount[$month] ?? 0) + 1;
   }
}

// Sort months
ksort($monthlyCount);

// Prediction
$predictionMonthlyCount = $monthlyCount;

// If we have counts for the current month, it's often a partial month and will
// undercount vs the previous month. Exclude it from prediction when possible.
$currentMonth = date('Y-m');
if (isset($predictionMonthlyCount[$currentMonth]) && count($predictionMonthlyCount) > 1) {
   unset($predictionMonthlyCount[$currentMonth]);
}

$values = array_values($predictionMonthlyCount);
$prediction = 0;
$trend = "Stable";

if (count($values) >= 2) {
   $last = $values[count($values) - 1];
   $prev = $values[count($values) - 2];
   
   // Calculate average growth over all available months
   $growths = [];
   for ($i = 1; $i < count($values); $i++) {
      $growths[] = $values[$i] - $values[$i-1];
   }
   $avg_growth = array_sum($growths) / count($growths);
   
   $prediction = max(0, round($last + $avg_growth));
   
   if ($avg_growth > 0) $trend = "Increasing 📈";
   elseif ($avg_growth < 0) $trend = "Decreasing 📉";
} elseif (count($values) == 1) {
   $prediction = $values[0]; // Keep current if only one month
} else {
   $prediction = 0;
}

// Most common case
arsort($caseCount);

// Remove UNKNOWN if exists
unset($caseCount['UNKNOWN']);

$topCase = !empty($caseCount) ? key($caseCount) : 'No Data';

?>

<?php include('dashboard_sidebar_start.php'); ?>


<div class="container-fluid">

   <div class="row">
      <div class="col text-center">
         <h1>Peace and Order Report Data</h1>
      </div>
   </div>

   <hr>

   <!-- ANALYTICS CARDS -->
   <div class="row mb-4">

      <div class="col-md-3">
         <div class="card p-3 shadow bg-warning text-dark">
            <h6>Predicted Cases (Next Month)</h6>
            <h2><?= $prediction ?></h2>
         </div>
      </div>

      <div class="col-md-3">
         <div class="card p-3 shadow">
            <h6>Trend</h6>
            <h4><?= $trend ?></h4>
         </div>
      </div>

      <div class="col-md-3">
         <div class="card p-3 shadow">
            <h6>Most Common Case</h6>
            <h5><?= $topCase ?></h5>
         </div>
      </div>

      <div class="col-md-3">
         <div class="card p-3 shadow">
            <h6>Total Records</h6>
            <h3><?= count($view) ?></h3>
         </div>
      </div>

   </div>

   <!-- STATUS BREAKDOWN -->
   <div class="card p-3 shadow mb-4">
      <h5>Status Overview</h5>
      <div class="row">
         <?php foreach ($statusCount as $k => $v): ?>
            <div class="col-md-3 mb-2">
               <div class="border p-2 text-center">
                  <strong><?= $k ?></strong><br>
                  <?= $v ?>
               </div>
            </div>
         <?php endforeach; ?>
      </div>
   </div>

   <a href="admn_blotterreport.php?deleted" class="btn btn-warning" style="color: white; width: 120px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;">Archived Files</a>


   <a href="#" id="exportExcelBtn"
      class="btn btn-success"
      style="color: white; width: 200px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;">
      <i class="fas fa-file-excel"></i> Export to Excel
   </a>

   <a href="admn_blotterreport.php" class="btn btn-secondary" style="color: white; width: 120px; height: 40px; font-size: 14px; border-radius:5px; margin-bottom: 5px; margin-left: auto; margin-right: auto;">Reset</a>

   <!-- TABLE -->
   <div class="table-responsive">
      <table class="table table-bordered table-striped">

         <thead>
            <tr>
               <th>Control #</th>
               <th>Complainant</th>
               <th>Complaint</th>
               <th>Contact</th>
               <th>Date Filed</th>
               <th style="width: 12%;"> View Details </th>
               <th style="width: 10%;"> Status </th>
               <th style="width: 20%;"> Update Status </th>
            </tr>
         </thead>

         <tbody>

            <?php foreach ($view as $data): ?>

               <tr>

                  <td><?= $data['control_no'] ?></td>
                  <td><?= ($data['lname'] ?? '') . ', ' . ($data['fname'] ?? '') ?></td>
                  <td><?= $data['type'] ?? '' ?></td>
                  <td><?= $data['contact'] ?? '' ?></td>
                  <td><?= !empty($data['timeapplied']) ? date('M d Y h:i A', strtotime($data['timeapplied'])) : '' ?></td>
                  <td>
                     <button
                        type="button"
                        class="view-details-btn"
                        data-toggle="modal"
                        data-target="#blotterDetailsModal"
                        style="background-color:#0d6efd;color:#fff;border:1px solid #0d6efd;border-radius:5px;padding:6px 12px;cursor:pointer;"
                        data-id_blotter="<?= htmlspecialchars($data['id_blotter'], ENT_QUOTES) ?>"
                        data-control-no="<?= htmlspecialchars($data['control_no'], ENT_QUOTES) ?>"
                        data-id_resident="<?= htmlspecialchars($data['id_resident'], ENT_QUOTES) ?>"
                        data-lname="<?= htmlspecialchars($data['lname'], ENT_QUOTES) ?>"
                        data-fname="<?= htmlspecialchars($data['fname'], ENT_QUOTES) ?>"
                        data-mi="<?= htmlspecialchars($data['mi'], ENT_QUOTES) ?>"
                        data-age="<?= htmlspecialchars($data['age'], ENT_QUOTES) ?>"
                        data-houseno="<?= htmlspecialchars($data['houseno'], ENT_QUOTES) ?>"
                        data-street="<?= htmlspecialchars($data['street'], ENT_QUOTES) ?>"
                        data-brgy="<?= htmlspecialchars($data['brgy'], ENT_QUOTES) ?>"
                        data-municipal="<?= htmlspecialchars($data['municipal'], ENT_QUOTES) ?>"
                        data-contact-detail="<?= htmlspecialchars($data['contact'], ENT_QUOTES) ?>"
                        data-narrative="<?= htmlspecialchars($data['narrative'], ENT_QUOTES) ?>"
                        data-timeapplied="<?= htmlspecialchars($data['timeapplied'], ENT_QUOTES) ?>"
                        data-status="<?= htmlspecialchars($data['status'], ENT_QUOTES) ?>"
                        data-rlname="<?= htmlspecialchars($data['rlname'], ENT_QUOTES) ?>"
                        data-rfname="<?= htmlspecialchars($data['rfname'], ENT_QUOTES) ?>"
                        data-rmi="<?= htmlspecialchars($data['rmi'], ENT_QUOTES) ?>"
                        data-rage="<?= htmlspecialchars($data['rage'], ENT_QUOTES) ?>"
                        data-rcontact="<?= htmlspecialchars($data['rcontact'], ENT_QUOTES) ?>"
                        data-raddress="<?= htmlspecialchars($data['raddress'], ENT_QUOTES) ?>"
                        data-case_type="<?= htmlspecialchars($data['type'], ENT_QUOTES) ?>"
                        data-type="<?= htmlspecialchars($data['type'], ENT_QUOTES) ?>"
                        data-date="<?= htmlspecialchars($data['date'], ENT_QUOTES) ?>"
                        data-time="<?= htmlspecialchars($data['time'], ENT_QUOTES) ?>"
                        data-location="<?= htmlspecialchars($data['location'], ENT_QUOTES) ?>"
                        data-witness="<?= htmlspecialchars($data['witness'], ENT_QUOTES) ?>"
                     >
                        View Details
                     </button>
                  </td>
                  <?php include('include_statuses4.php'); ?>
                  <td style="width:180px;">
                     <form method="POST" action="update_status.php">

                        <input type="hidden" name="id_blotter" value="<?= $data['id_blotter']; ?>">

                        <select name="status" class="form-control form-control-sm" onchange="this.form.submit()">
                           <option value="PENDING" <?= $data['status'] == 'PENDING' ? 'selected' : '' ?>>PENDING</option>
                           <option value="UNDER REVIEW" <?= $data['status'] == 'UNDER REVIEW' ? 'selected' : '' ?>>UNDER REVIEW</option>
                           <option value="RECORDED" <?= $data['status'] == 'RECORDED' ? 'selected' : '' ?>>RECORDED</option>
                           <option value="ONGOING" <?= $data['status'] == 'ONGOING' ? 'selected' : '' ?>>ONGOING</option>
                           <option value="RESOLVED" <?= $data['status'] == 'RESOLVED' ? 'selected' : '' ?>>RESOLVED</option>
                           <option value="CLOSED" <?= $data['status'] == 'CLOSED' ? 'selected' : '' ?>>CLOSED</option>
                           <option value="CANCELLED" <?= $data['status'] == 'CANCELLED' ? 'selected' : '' ?>>CANCELLED</option>
                           <option value="DELETED" <?= $data['status'] == 'DELETED' ? 'selected' : '' ?>>DELETED</option>

                        </select>

                     </form>
                  </td>
               </tr>

            <?php endforeach; ?>

         </tbody>
      </table>
   </div>

</div>

<!-- View Details Modal -->
<div class="modal fade" id="blotterDetailsModal" tabindex="-1" role="dialog" aria-labelledby="blotterDetailsModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="blotterDetailsModalLabel">Blotter Details</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <div class="row mb-3">
               <div class="col-md-6">
                  <p><strong>Control #:</strong> <span id="detail_control_no"></span></p>
                  <p><strong>Complainant:</strong> <span id="detail_complainant"></span></p>
                  <p><strong>Middle Initial:</strong> <span id="detail_mi"></span></p>
                  <p><strong>Age:</strong> <span id="detail_age"></span></p>
                  <p><strong>Address:</strong> <span id="detail_address"></span></p>
                  <p><strong>Barangay:</strong> <span id="detail_brgy"></span></p>
                  <p><strong>Municipal:</strong> <span id="detail_municipal"></span></p>
                  <p><strong>Contact:</strong> <span id="detail_contact_detail"></span></p>
               </div>
               <div class="col-md-6">
                  <p><strong>Complaint:</strong> <span id="detail_case_type"></span></p>
                  <p><strong>Date Filed:</strong> <span id="detail_timeapplied"></span></p>
                  <p><strong>Status:</strong> <span id="detail_status"></span></p>
                  <p><strong>Response Person:</strong> <span id="detail_rlname"></span></p>
                  <p><strong>Response First Name:</strong> <span id="detail_rfname"></span></p>
                  <p><strong>Response MI:</strong> <span id="detail_rmi"></span></p>
                  <p><strong>Response Age:</strong> <span id="detail_rage"></span></p>
                  <p><strong>Response Contact:</strong> <span id="detail_rcontact"></span></p>
                  <p><strong>Response Address:</strong> <span id="detail_raddress"></span></p>
               </div>
            </div>
            <hr>
            <div class="row">
               <div class="col-md-6">
                  <p><strong>Incident Date:</strong> <span id="detail_date"></span></p>
               </div>
               <div class="col-md-6">
                  <p><strong>Incident Time:</strong> <span id="detail_time"></span></p>
                  <p><strong>Location:</strong> <span id="detail_location"></span></p>
                  <p><strong>Witness:</strong> <span id="detail_witness"></span></p>
                  <p><strong>Narrative:</strong> <span id="detail_narrative"></span></p>
               </div>
            </div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         </div>
      </div>
   </div>
</div>
<script>
   document.querySelectorAll('.view-details-btn').forEach(function(button) {
      button.addEventListener('click', function() {
         document.getElementById('detail_control_no').textContent = this.dataset.controlNo || '';
         document.getElementById('detail_complainant').textContent = this.dataset.lname + ', ' + this.dataset.fname || '';
         document.getElementById('detail_mi').textContent = this.dataset.mi || '';
         document.getElementById('detail_age').textContent = this.dataset.age || '';
         document.getElementById('detail_address').textContent = this.dataset.houseno + ', ' + this.dataset.street || '';
         document.getElementById('detail_brgy').textContent = this.dataset.brgy || '';
         document.getElementById('detail_municipal').textContent = this.dataset.municipal || '';
         document.getElementById('detail_contact_detail').textContent = this.dataset.contactDetail || '';
         document.getElementById('detail_case_type').textContent = this.dataset.type || '';
         document.getElementById('detail_timeapplied').textContent = this.dataset.timeapplied || '';
         document.getElementById('detail_status').textContent = this.dataset.status || '';
         document.getElementById('detail_rlname').textContent = this.dataset.rlname || '';
         document.getElementById('detail_rfname').textContent = this.dataset.rfname || '';
         document.getElementById('detail_rmi').textContent = this.dataset.rmi || '';
         document.getElementById('detail_rage').textContent = this.dataset.rage || '';
         document.getElementById('detail_rcontact').textContent = this.dataset.rcontact || '';
         document.getElementById('detail_raddress').textContent = this.dataset.raddress || '';
         document.getElementById('detail_date').textContent = this.dataset.date || '';
         document.getElementById('detail_time').textContent = this.dataset.time || '';
         document.getElementById('detail_location').textContent = this.dataset.location || '';
         document.getElementById('detail_witness').textContent = this.dataset.witness || '';
         document.getElementById('detail_narrative').textContent = this.dataset.narrative || '';
      });
   });

   document.getElementById('exportExcelBtn').addEventListener('click', function() {
      // Select the table
      let table = document.querySelector('.table');

      // Convert table to a CSV format
      let csv = [];
      for (let row of table.rows) {
         let rowData = [];
         for (let cell of row.cells) {
            // Escape double quotes
            let cellText = cell.innerText.replace(/"/g, '""');
            rowData.push(`"${cellText}"`);
         }
         csv.push(rowData.join(','));
      }

      // Create a Blob with CSV data
      let csvFile = new Blob([csv.join('\n')], {
         type: 'text/csv'
      });

      // Create a temporary download link
      let downloadLink = document.createElement('a');
      downloadLink.download = 'resident_blotter_records.csv';
      downloadLink.href = window.URL.createObjectURL(csvFile);
      downloadLink.style.display = 'none';

      document.body.appendChild(downloadLink);
      downloadLink.click();
      document.body.removeChild(downloadLink);
   });
</script>
<?php include('dashboard_sidebar_end.php'); ?>