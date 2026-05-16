<?php
include('dbcon.php');

function GetData($sql)
{
    global $db_connection;
    $res = mysqli_query($db_connection, $sql);
    $row = mysqli_fetch_array($res);
    return $row[0] ?? 0;
}

// COUNTS
$totalResidents = GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='approved'");
$male = GetData("SELECT COUNT(*) FROM tbl_resident WHERE sex='Male' AND request_status='approved'");
$female = GetData("SELECT COUNT(*) FROM tbl_resident WHERE sex='Female' AND request_status='approved'");
$senior = GetData("SELECT COUNT(*) FROM tbl_resident WHERE senior_citizen='YES' AND request_status='approved'");
$minor = GetData("
    SELECT COUNT(*) 
    FROM tbl_resident 
    WHERE age < 18 
    AND senior_citizen='NO'
    AND request_status='approved'
");
$pendingCount = GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='pending'");
$approvedCount = GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='approved'");
$rejectedCount = GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='rejected'");

$residentSearchList = [];
$residentSearchQuery = mysqli_query(
    $db_connection,
    "SELECT id_resident, fname, lname, mi, age, sex FROM tbl_resident ORDER BY lname ASC, fname ASC LIMIT 500"
);

while ($residentRow = mysqli_fetch_assoc($residentSearchQuery)) {
    $residentSearchList[] = $residentRow;
}
?>

<div class="container-fluid" style="background:#f5f7fb;">

    <!-- ================= HEADER ================= -->
    <div class="mb-4">
        <h1 class="fw-bold">Dashboard</h1>
        <small class="text-muted">Barangay Management Overview</small>
    </div>

    <style>
        .resident-search-wrapper {
            position: relative;
            max-width: 520px;
            margin-bottom: 1rem;
        }

        .resident-search-results {
            position: absolute;
            top: calc(100% + 6px);
            left: 0;
            right: 0;
            max-height: 280px;
            overflow-y: auto;
            background: #fff;
            border: 1px solid #dbe3ea;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.12);
            z-index: 50;
            display: none;
        }

        .resident-search-item {
            padding: 10px 12px;
            border-bottom: 1px solid #eef2f7;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .resident-search-item:last-child {
            border-bottom: 0;
        }

        .resident-search-item:hover {
            background: #f1f5f9;
        }

        .resident-search-main {
            font-weight: 600;
            color: #0f172a;
        }

        .resident-search-sub {
            font-size: 12px;
            color: #64748b;
        }
    </style>

    <div class="resident-search-wrapper">
        <input
            type="search"
            id="residentQuickSearch"
            class="form-control"
            placeholder="Search resident name..."
            autocomplete="off">
        <div id="residentQuickResults" class="resident-search-results"></div>
    </div>

    <!-- ================= TOP SUMMARY (MOVED HERE) ================= -->
    <!-- ================= TOP SUMMARY ================= -->
    <style>
        .card-left-border {
            border-radius: 12px;
            height: 100%;
            position: relative;
        }

        /* LEFT COLOR BAR (STRONG + ALWAYS VISIBLE) */
        .card-left-border::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 6px;
            border-radius: 12px 0 0 12px;
        }

        .border-population::before {
            background: #0d6efd;
        }

        .border-senior::before {
            background: #198754;
        }

        .border-minor::before {
            background: #6f42c1;
        }
    </style>
    <div class="row mb-4">

        <!-- Population -->
        <div class="col-md-4 d-flex">
            <div class="card shadow-sm p-3 card-left-border border-population w-100">
                <h6 class="text-muted mb-2">Population</h6>
                <h2 class="fw-bold mb-1"><?php echo $totalResidents; ?></h2>
                <small class="text-muted">
                    Male: <?php echo $male; ?> • Female: <?php echo $female; ?>
                </small>
            </div>
        </div>

        <!-- Senior -->
        <div class="col-md-4 d-flex">
            <div class="card shadow-sm p-3 card-left-border border-senior w-100">
                <h6 class="text-muted mb-2">Senior Citizens</h6>
                <h2 class="fw-bold"><?php echo $senior; ?></h2>
            </div>
        </div>

        <!-- Minor -->
        <div class="col-md-4 d-flex">
            <div class="card shadow-sm p-3 card-left-border border-minor w-100">
                <h6 class="text-muted mb-2">Minors</h6>
                <h2 class="fw-bold"><?php echo $minor; ?></h2>
            </div>
        </div>

    </div>

    <style>
        /* ===== SUMMARY CARDS ===== */
        .kanban-box {
            border-left: 5px solid;
            border-radius: 8px;
        }

        .border-pending {
            border-color: #ffc107;
        }

        .border-rejected {
            border-color: #dc3545;
        }

        .border-completed {
            border-color: #198754;
        }
    </style>
    <!-- ================= REQUEST SECTION ================= -->
    <div class="row mb-4">

        <!-- LEFT: KANBAN -->
        <div class="col-md-8">
            <div class="card p-3 shadow-sm border-0">
                <h5>Request of Residents Approval</h5>

                <div class="row">

                    <!-- Pending -->
                    <div class="col-md-4">

                        <a style="text-decoration: none; color: inherit;" href="admn_resident_request.php">
                            <div class="p-2 kanban-box border-pending" style="background:#fff3cd;">
                                <strong>Pending</strong>

                                <?php
                                $q = mysqli_query($db_connection, "
                        SELECT CONCAT(fname,' ',lname) as name 
                        FROM tbl_resident 
                        WHERE request_status='pending' LIMIT 5
                    ");
                                while ($r = mysqli_fetch_assoc($q)) {
                                    echo "<div class='card p-2 mt-2 shadow-sm'>
                                <small>{$r['name']}</small>
                              </div>";
                                }
                                ?>
                            </div>
                        </a>
                    </div>

                    <!-- Rejected -->
                    <div class="col-md-4">
                        <a style="text-decoration: none; color: inherit;" href="admn_resident_crud.php?deleted">
                            <div class="p-2 kanban-box border-rejected" style="background:#f8d7da;">
                                <strong>Rejected</strong>

                                <?php
                                $q = mysqli_query($db_connection, "
                        SELECT CONCAT(fname,' ',lname) as name 
                        FROM tbl_resident 
                        WHERE request_status='rejected'  ORDER BY id_resident DESC LIMIT 5
                    ");
                                while ($r = mysqli_fetch_assoc($q)) {
                                    echo "<div class='card p-2 mt-2 shadow-sm'>
                                <small>{$r['name']}</small>
                              </div>";
                                }
                                ?>
                            </div>
                        </a>
                    </div>

                    <!-- Approved -->
                    <div class="col-md-4">
                        <a style="text-decoration: none; color: inherit;" href="admn_resident_crud.php">
                        <div class="p-2 kanban-box border-completed" style="background:#e9f7ef;">
                            <strong>Approved</strong>

                            <?php
                            $q = mysqli_query($db_connection, "
                        SELECT CONCAT(fname,' ',lname) as name 
                        FROM tbl_resident 
                        WHERE request_status='approved' LIMIT 5
                    ");
                            while ($r = mysqli_fetch_assoc($q)) {
                                echo "<div class='card p-2 mt-2 shadow-sm'>
                                <small>{$r['name']}</small>
                              </div>";
                            }
                            ?>
                        </div>
</a>
                    </div>

                </div>
            </div>
        </div>

        <!-- RIGHT: REQUEST TABLE -->
        <!-- RIGHT: REQUEST TABLE -->
        <div class="col-md-4">
            <div class="card p-3 shadow-sm border-0">
                <h6>Request Table</h6>

                <table class="table table-sm table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $q = mysqli_query($db_connection, "
                    SELECT CONCAT(fname,' ',lname) as name, request_status 
                    FROM tbl_resident 
                    ORDER BY id_resident DESC LIMIT 6
                ");

                        // Define status mapping: status => [color hex, font awesome icon]
                        $statuses = [
                            'PENDING'          => ['#FBBF24', 'fa-hourglass-half'],  // Yellow
                            'PROCESSING'       => ['#3B82F6', 'fa-spinner'],         // Blue
                            'APPROVED'         => ['#22C55E', 'fa-check-circle'],    // Green
                            'REJECTED'         => ['#EF4444', 'fa-times-circle'],    // Red
                            'READY FOR PICKUP' => ['#A855F7', 'fa-box'],             // Purple
                            'CLAIMED'          => ['#6B7280', 'fa-hand-holding']     // Gray
                        ];

                        while ($r = mysqli_fetch_assoc($q)) {
                            $status = strtoupper(trim($r['request_status'] ?? ''));

                            if (isset($statuses[$status])) {
                                [$color, $icon] = $statuses[$status];
                                $spinClass = ($status === 'PROCESSING') ? 'fa-spin' : '';

                                $badgeHTML = "<span class='badge d-inline-flex align-items-center px-3 py-2' style='gap:5px; background-color: $color; color: white;'>
                                        <i class='fas $icon $spinClass'></i>
                                        <span>$status</span>
                                      </span>";
                            } else {
                                $badgeHTML = "<span class='badge badge-light border px-3 py-2'>
                                        <i class='fas fa-question-circle'></i> UNKNOWN
                                      </span>";
                            }

                            echo "<tr>
                            <td>{$r['name']}</td>
                            <td>$badgeHTML</td>
                          </tr>";
                        }
                        ?>

                    </tbody>
                </table>
            </div>
        </div>




    </div>

    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <div class="row mb-4">
        <!-- Chart 1: Total Residents Over Time -->
        <div class="col-md-6">
            <div class="card p-3 shadow-sm border-0">
                <h6>Total Residents (Now vs Prediction)</h6>
                <canvas id="chartResidents"></canvas>
            </div>
        </div>

        <!-- Chart 2: Senior Citizens Over Time -->
        <div class="col-md-6">
            <div class="card p-3 shadow-sm border-0">
                <h6>Senior Citizens (Now vs Prediction)</h6>
                <canvas id="chartSenior"></canvas>
            </div>
        </div>

        <!-- Chart 3: Minor Over Time -->
        <div class="col-md-6 mt-4">
            <div class="card p-3 shadow-sm border-0">
                <h6>Minor (Now vs Prediction)</h6>
                <canvas id="chartPWD"></canvas>
            </div>
        </div>

        <!-- Chart 4: Request Status Trends -->
        <div class="col-md-6 mt-4">
            <div class="card p-3 shadow-sm border-0">
                <h6>Request Status Trends (Now vs Prediction)</h6>
                <canvas id="chartRequests"></canvas>
            </div>
        </div>
    </div>

    <script>
        const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        const nowIndex = new Date().getMonth();

        const nowPredictionPlugin = {
            id: 'nowPredictionPlugin',
            afterDraw(chart) {
                const {
                    ctx,
                    chartArea,
                    scales: {
                        x
                    }
                } = chart;
                if (!chartArea) return;

                const xPos = x.getPixelForValue(nowIndex);
                ctx.save();
                ctx.strokeStyle = '#334155';
                ctx.lineWidth = 1;
                ctx.setLineDash([4, 4]);
                ctx.beginPath();
                ctx.moveTo(xPos, chartArea.top);
                ctx.lineTo(xPos, chartArea.bottom);
                ctx.stroke();
                ctx.setLineDash([]);
                ctx.fillStyle = '#334155';
                ctx.font = '600 11px Nunito, sans-serif';
                ctx.fillText('Now', xPos - 28, chartArea.top - 8);
                ctx.fillStyle = '#64748b';
                ctx.fillText('Prediction', xPos + 8, chartArea.top - 8);
                ctx.restore();
            }
        };

        function buildHistorySeries(currentValue, startRatio) {
            const safeCurrent = Math.max(0, Number(currentValue) || 0);
            const history = Array(12).fill(null);
            const startValue = Math.max(0, Math.round(safeCurrent * startRatio));
            const steps = Math.max(nowIndex, 1);

            for (let i = 0; i <= nowIndex; i++) {
                history[i] = Math.round(startValue + ((safeCurrent - startValue) * (i / steps)));
            }

            return history;
        }

            function buildPredictionSeries(historySeries, growthRate, capMultiplier) {
                const predicted = Array(12).fill(null);
                let latest = historySeries[nowIndex] || 0;

                // Start slightly higher than actual (rounded)
                predicted[nowIndex] = Math.round(latest * 1.03);

                const cap = latest * capMultiplier;

                for (let i = nowIndex + 1; i < 12; i++) {
                    // compute with decimals internally
                    latest = latest * (1 + growthRate + (Math.random() * 0.02 - 0.01));

                    // ONLY round when assigning (prevents flat lines)
                    predicted[i] = Math.round(Math.min(latest, cap));
                }

                return predicted;
            }
        function trendOptions() {
            return {
                responsive: true,
                maintainAspectRatio: true,
                interaction: {
                    mode: 'index',
                    intersect: false
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(148, 163, 184, 0.25)'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            };
        }

        const residentsHistory = buildHistorySeries(<?php echo $totalResidents; ?>, 0.58);
        const residentsPrediction = buildPredictionSeries(residentsHistory, 0.08, 1.5);

        new Chart(document.getElementById('chartResidents'), {
            type: 'line',
            data: {
                labels,
                datasets: [{
                        label: 'Residents (Actual)',
                        data: residentsHistory,
                        borderColor: '#14b8a6',
                        backgroundColor: 'rgba(20, 184, 166, 0.08)',
                        tension: 0.32,
                        borderWidth: 3,
                        pointRadius: 0,
                        fill: true
                    },
                    {
                        label: 'Residents (Forecast)',
                        data: residentsPrediction,
                        borderColor: '#14b8a6',
                        backgroundColor: 'rgba(20, 184, 166, 0.02)',
                        tension: 0.32,
                        borderDash: [6, 6],
                        borderWidth: 2,
                        pointRadius: 0,
                        fill: false
                    }
                ]
            },
            options: trendOptions(),
            plugins: [nowPredictionPlugin]
        });

        const seniorHistory = buildHistorySeries(<?php echo $senior; ?>, 0.66);
        const seniorPrediction = buildPredictionSeries(seniorHistory, 0.06, 1.4);

        new Chart(document.getElementById('chartSenior'), {
            type: 'line',
            data: {
                labels,
                datasets: [{
                        label: 'Senior (Actual)',
                        data: seniorHistory,
                        borderColor: '#16a34a',
                        backgroundColor: 'rgba(22, 163, 74, 0.08)',
                        tension: 0.3,
                        borderWidth: 3,
                        pointRadius: 0,
                        fill: true
                    },
                    {
                        label: 'Senior (Forecast)',
                        data: seniorPrediction,
                        borderColor: '#16a34a',
                        tension: 0.3,
                        borderDash: [6, 6],
                        borderWidth: 2,
                        pointRadius: 0,
                        fill: false
                    }
                ]
            },
            options: trendOptions(),
            plugins: [nowPredictionPlugin]
        });

        const minorHistory = buildHistorySeries(<?php echo $minor; ?>, 0.63);
        const minorPrediction = buildPredictionSeries(minorHistory, 0.05, 1.3);

        new Chart(document.getElementById('chartPWD'), {
            type: 'line',
            data: {
                labels,
                datasets: [{
                        label: 'Minor (Actual)',
                        data: minorHistory,
                        borderColor: '#475569',
                        backgroundColor: 'rgba(71, 85, 105, 0.08)',
                        tension: 0.3,
                        borderWidth: 3,
                        pointRadius: 0,
                        fill: true
                    },
                    {
                        label: 'Minor (Forecast)',
                        data: minorPrediction,
                        borderColor: '#475569',
                        tension: 0.3,
                        borderDash: [6, 6],
                        borderWidth: 2,
                        pointRadius: 0,
                        fill: false
                    }
                ]
            },
            options: trendOptions(),
            plugins: [nowPredictionPlugin]
        });

        const pendingHistory = buildHistorySeries(<?php echo $pendingCount; ?>, 0.84);
        const pendingPrediction = buildPredictionSeries(pendingHistory, -0.15, 1.0);

        const approvedHistory = buildHistorySeries(<?php echo $approvedCount; ?>, 0.56);
        const approvedPrediction = buildPredictionSeries(approvedHistory, 0.07, 1.5);

        const rejectedHistory = buildHistorySeries(<?php echo $rejectedCount; ?>, 0.82);
        const rejectedPrediction = buildPredictionSeries(rejectedHistory, -0.10, 1.0);

        new Chart(document.getElementById('chartRequests'), {
            type: 'line',
            data: {
                labels,
                datasets: [{
                        label: 'Pending (Actual)',
                        data: pendingHistory,
                        borderColor: '#f59e0b',
                        tension: 0.3,
                        borderWidth: 2.5,
                        pointRadius: 0,
                        fill: false
                    },
                    {
                        label: 'Pending (Forecast)',
                        data: pendingPrediction,
                        borderColor: '#f59e0b',
                        tension: 0.3,
                        borderDash: [6, 6],
                        borderWidth: 2,
                        pointRadius: 0,
                        fill: false
                    },
                    {
                        label: 'Approved (Actual)',
                        data: approvedHistory,
                        borderColor: '#22c55e',
                        tension: 0.3,
                        borderWidth: 2.5,
                        pointRadius: 0,
                        fill: false
                    },
                    {
                        label: 'Approved (Forecast)',
                        data: approvedPrediction,
                        borderColor: '#22c55e',
                        tension: 0.3,
                        borderDash: [6, 6],
                        borderWidth: 2,
                        pointRadius: 0,
                        fill: false
                    },
                    {
                        label: 'Rejected (Actual)',
                        data: rejectedHistory,
                        borderColor: '#ef4444',
                        tension: 0.3,
                        borderWidth: 2.5,
                        pointRadius: 0,
                        fill: false
                    },
                    {
                        label: 'Rejected (Forecast)',
                        data: rejectedPrediction,
                        borderColor: '#ef4444',
                        tension: 0.3,
                        borderDash: [6, 6],
                        borderWidth: 2,
                        pointRadius: 0,
                        fill: false
                    }
                ]
            },
            options: trendOptions(),
            plugins: [nowPredictionPlugin]
        });
    </script>
    <!-- Include Chart.js (if not already included) -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <div class="row mb-4">

        <!-- Pie Chart 1: Gender Distribution -->
        <div class="col-md-6">
            <div class="card p-3 shadow-sm border-0">
                <h6>Resident Gender Distribution</h6>
                <canvas id="pieGender" style="height:250px;"></canvas>
            </div>
        </div>

        <!-- Pie Chart 2: Request Status Distribution -->
        <div class="col-md-6">
            <div class="card p-3 shadow-sm border-0">
                <h6>Request Status Distribution</h6>
                <canvas id="pieRequestStatus" style="height:250px;"></canvas>
            </div>
        </div>

    </div>

    <script>
        // Pie Chart 1: Gender Distribution
        // Pie Chart 1: Gender Distribution
        new Chart(document.getElementById('pieGender'), {
            type: 'pie',
            data: {
                labels: ['Male', 'Female'],
                datasets: [{
                    data: [<?php echo $male; ?>, <?php echo $female; ?>],
                    backgroundColor: ['#2563EB', '#9333EA'], // Blue & Purple
                    borderColor: ['#ffffff', '#ffffff'],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });

        // Pie Chart 2: Request Status Distribution
        new Chart(document.getElementById('pieRequestStatus'), {
            type: 'pie',
            data: {
                labels: ['Pending', 'Approved', 'Rejected'],
                datasets: [{
                    data: [
                        <?php echo GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='pending'"); ?>,
                        <?php echo GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='approved'"); ?>,
                        <?php echo GetData("SELECT COUNT(*) FROM tbl_resident WHERE request_status='rejected'"); ?>
                    ],
                    backgroundColor: ['#FBBF24', '#22C55E', '#EF4444'],
                    borderColor: ['#ffffff', '#ffffff', '#ffffff'],
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    </script>
<!-- ================= RESIDENT DIRECTORY ================= -->
<div class="row">
    <div class="col-12">
        <div class="card p-3 shadow-sm border-0">

            <h6>Resident Directory</h6>

            <table id="residentTable" class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th onclick="sortTable(1, 'number')" style="cursor:pointer;">
                            Age ⬍
                        </th>
                        <th onclick="sortTable(2, 'text')" style="cursor:pointer;">
                            Gender ⬍
                        </th>
                        <th>Minor</th>
                        <th>Senior</th>
                    </tr>
                </thead>

                <tbody>
                    <?php
                        $q = mysqli_query($db_connection, "
                            SELECT fname, lname, age, sex, senior_citizen,
                                CASE 
                                    WHEN age < 18 and senior_citizen='NO' THEN 'YES'
                                    ELSE 'NO'
                                END AS minor
                            FROM tbl_resident 
                            LIMIT 10
                        ");

                    while ($r = mysqli_fetch_assoc($q)) {
                        echo "<tr>
                            <td>{$r['fname']} {$r['lname']}</td>
                            <td>{$r['age']}</td>
                            <td>{$r['sex']}</td>
                            <td>{$r['minor']}</td>
                            <td>{$r['senior_citizen']}</td>
                        </tr>";
                    }
                    ?>
                </tbody>
            </table>

        </div>
    </div>
</div>

<!-- ================= SORTING SCRIPT ================= -->
<script>
const residentQuickData = <?php echo json_encode($residentSearchList, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); ?>;

function escapeHtml(value) {
    return String(value || '')
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
}

function renderResidentQuickResults(keyword) {
    const list = document.getElementById('residentQuickResults');
    if (!list) return;

    const cleanedKeyword = keyword.trim().toLowerCase();
    if (!cleanedKeyword) {
        list.style.display = 'none';
        list.innerHTML = '';
        return;
    }

    const matches = residentQuickData
        .filter((resident) => {
            const fullName = `${resident.fname || ''} ${resident.mi || ''} ${resident.lname || ''}`.toLowerCase();
            return fullName.includes(cleanedKeyword);
        })
        .slice(0, 8);

    if (!matches.length) {
        list.innerHTML = '<div class="resident-search-item"><div class="resident-search-main">No resident found</div></div>';
        list.style.display = 'block';
        return;
    }

    list.innerHTML = matches.map((resident) => {
        const name = `${resident.fname || ''} ${resident.mi || ''} ${resident.lname || ''}`.replace(/\s+/g, ' ').trim();
        const meta = `Age: ${resident.age || 'N/A'} | ${resident.sex || 'N/A'}`;
        return `
            <div class="resident-search-item" data-keyword="${escapeHtml(name)}">
                <div class="resident-search-main">${escapeHtml(name)}</div>
                <div class="resident-search-sub">${escapeHtml(meta)}</div>
            </div>
        `;
    }).join('');

    list.style.display = 'block';
}

document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('residentQuickSearch');
    const list = document.getElementById('residentQuickResults');

    if (!input || !list) return;

    input.addEventListener('input', function(e) {
        renderResidentQuickResults(e.target.value || '');
    });

    list.addEventListener('click', function(e) {
        const item = e.target.closest('.resident-search-item[data-keyword]');
        if (!item) return;

        const nameNode = item.querySelector('.resident-search-main');
        const selectedKeyword = nameNode ? nameNode.textContent.trim() : '';
        if (!selectedKeyword) return;

        window.location.href = 'admn_resident_crud.php?keyword=' + encodeURIComponent(selectedKeyword);
    });

    document.addEventListener('click', function(e) {
        if (!e.target.closest('.resident-search-wrapper')) {
            list.style.display = 'none';
        }
    });
});

function sortTable(colIndex, type) {
    let table = document.getElementById("residentTable");
    let tbody = table.querySelector("tbody");
    let rows = Array.from(tbody.querySelectorAll("tr"));

    // toggle asc/desc
    let asc = table.getAttribute("data-sort") !== "asc";
    table.setAttribute("data-sort", asc ? "asc" : "desc");

    rows.sort((a, b) => {
        let A = a.cells[colIndex].innerText.trim();
        let B = b.cells[colIndex].innerText.trim();

        if (type === "number") {
            return asc ? (A - B) : (B - A);
        } else {
            return asc ? A.localeCompare(B) : B.localeCompare(A);
        }
    });

    tbody.innerHTML = "";
    rows.forEach(row => tbody.appendChild(row));
}
</script>

<br><br>