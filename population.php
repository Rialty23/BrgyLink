<?php
error_reporting(E_ALL ^ E_WARNING);
ini_set('display_errors', 0);

require('classes/resident.class.php');
include_once 'dbcon.php';

function build_local_ai_variants(array $aiInput): array
{
    $total = (int)($aiInput['total_residents'] ?? 0);
    $gender = $aiInput['gender'] ?? [];
    $maleCount = (int)($gender['male_count'] ?? 0);
    $femaleCount = (int)($gender['female_count'] ?? 0);
    $malePercent = (float)($gender['male_percent'] ?? 0);
    $femalePercent = (float)($gender['female_percent'] ?? 0);
    $diff = (float)($gender['difference_percent'] ?? 0);
    $dominantGender = (string)($gender['dominant'] ?? '');

    $ageGroups = $aiInput['age_groups'] ?? ['0-14' => 0, '15-49' => 0, '50-59' => 0, '60+' => 0];
    $agePerc = $aiInput['age_percentages'] ?? ['0-14' => 0, '15-49' => 0, '50-59' => 0, '60+' => 0];
    $dominantAgeGroup = (string)($aiInput['dominant_age_group'] ?? '');

    $a0 = (int)($ageGroups['0-14'] ?? 0);
    $a1 = (int)($ageGroups['15-49'] ?? 0);
    $a2 = (int)($ageGroups['50-59'] ?? 0);
    $a3 = (int)($ageGroups['60+'] ?? 0);

    $p0 = (float)($agePerc['0-14'] ?? 0);
    $p1 = (float)($agePerc['15-49'] ?? 0);
    $p2 = (float)($agePerc['50-59'] ?? 0);
    $p3 = (float)($agePerc['60+'] ?? 0);

    $dominantAgeLabel = $dominantAgeGroup !== '' ? $dominantAgeGroup : 'N/A';
    $dominantGenderLabel = $dominantGender !== '' ? $dominantGender : 'N/A';

    $variant1 = "Summary:\n" .
        "- Total residents recorded: {$total}.\n" .
        "- Gender split: {$maleCount} Male ({$malePercent}%) vs {$femaleCount} Female ({$femalePercent}%).\n" .
        "- Largest age bracket: {$dominantAgeLabel}.\n\n" .
        "Trends:\n" .
        "- Working-age population (15–49) is {$a1} ({$p1}%), indicating strong household workforce presence.\n" .
        "- Senior population (60+) is {$a3} ({$p3}%), which may drive healthcare and assistance demand.\n\n" .
        "Observations:\n" .
        "- {$dominantGenderLabel} population is higher by {$diff}%.\n" .
        "- Age distribution counts: 0–14={$a0}, 15–49={$a1}, 50–59={$a2}, 60+={$a3}.\n\n" .
        "Recommendations:\n" .
        "- Strengthen programs for the dominant group ({$dominantAgeLabel}) while monitoring smaller brackets for gaps.\n" .
        "- Keep sex values standardized (Male/Female) during encoding to ensure accurate reporting.";

    $variant2 = "Summary:\n" .
        "- Current population entries: {$total}.\n" .
        "- Gender composition is close with a {$diff}% difference (Dominant: {$dominantGenderLabel}).\n\n" .
        "Trends:\n" .
        "- Children (0–14): {$a0} ({$p0}%) — impacts daycare/school support needs.\n" .
        "- Prime working ages (15–49): {$a1} ({$p1}%) — impacts employment and livelihood programs.\n" .
        "- Seniors (60+): {$a3} ({$p3}%) — impacts senior benefits and medical outreach.\n\n" .
        "Observations:\n" .
        "- Male: {$maleCount} ({$malePercent}%), Female: {$femaleCount} ({$femalePercent}%).\n" .
        "- The highest concentration sits in {$dominantAgeLabel}, suggesting where most services will be utilized.\n\n" .
        "Recommendations:\n" .
        "- Prioritize resource planning around {$dominantAgeLabel} while keeping targeted support for 60+ residents.\n" .
        "- Add validation on resident age/sex fields to reduce inconsistent entries.";

    $variant3 = "Summary:\n" .
        "- Total residents in the database: {$total}.\n" .
        "- Gender distribution: {$malePercent}% Male / {$femalePercent}% Female (Dominant: {$dominantGenderLabel}).\n\n" .
        "Trends:\n" .
        "- Age bracket shares: 0–14={$p0}%, 15–49={$p1}%, 50–59={$p2}%, 60+={$p3}%.\n" .
        "- The leading bracket is {$dominantAgeLabel}, which likely represents the highest service demand.\n\n" .
        "Observations:\n" .
        "- If seniors (60+) continue to grow, expect increased requests for assistance, medical referrals, and documentation.\n" .
        "- If 0–14 is sizable, expect higher school-related certificate/clearance requests.\n\n" .
        "Recommendations:\n" .
        "- Use this breakdown to align budget and programs (youth support, livelihood, and senior services).\n" .
        "- Maintain periodic audits of resident records to keep analytics reliable.";

    return [$variant1, $variant2, $variant3];
}

function fill_ai_placeholders(string $template, array $aiInput): string
{
    $total = (int)($aiInput['total_residents'] ?? 0);
    $gender = $aiInput['gender'] ?? [];
    $ageGroups = $aiInput['age_groups'] ?? [];
    $agePerc = $aiInput['age_percentages'] ?? [];

    $replacements = [
        '{total_residents}' => (string)$total,

        '{male_count}' => (string)((int)($gender['male_count'] ?? 0)),
        '{female_count}' => (string)((int)($gender['female_count'] ?? 0)),
        '{male_percent}' => (string)((float)($gender['male_percent'] ?? 0)),
        '{female_percent}' => (string)((float)($gender['female_percent'] ?? 0)),
        '{gender_difference_percent}' => (string)((float)($gender['difference_percent'] ?? 0)),
        '{gender_dominant}' => (string)($gender['dominant'] ?? ''),

        '{dominant_age_group}' => (string)($aiInput['dominant_age_group'] ?? ''),

        '{age_0_14_count}' => (string)((int)($ageGroups['0-14'] ?? 0)),
        '{age_15_49_count}' => (string)((int)($ageGroups['15-49'] ?? 0)),
        '{age_50_59_count}' => (string)((int)($ageGroups['50-59'] ?? 0)),
        '{age_60_plus_count}' => (string)((int)($ageGroups['60+'] ?? 0)),

        '{age_0_14_percent}' => (string)((float)($agePerc['0-14'] ?? 0)),
        '{age_15_49_percent}' => (string)((float)($agePerc['15-49'] ?? 0)),
        '{age_50_59_percent}' => (string)((float)($agePerc['50-59'] ?? 0)),
        '{age_60_plus_percent}' => (string)((float)($agePerc['60+'] ?? 0)),
    ];

    return strtr($template, $replacements);
}

// Auth
$userdetails = $bmis->get_userdata();
$bmis->validate_admin();

/* =========================
   AI ENDPOINT (AJAX HANDLER)
========================= */
if (isset($_GET['generate_ai'])) {

    header('Content-Type: application/json');

    require_once 'dbcon.php';

    $cacheKey = "resident_ai_analysis";

    // 🔍 Check existing cache
    $cacheQuery = mysqli_query($db_connection, "SELECT * FROM ai_analytics_cache WHERE cache_key='$cacheKey' LIMIT 1");
    $cacheData = mysqli_fetch_assoc($cacheQuery);

    if ($cacheData) {
        // Cache row exists
    } else {
        // Insert initial cache row
        mysqli_query($db_connection, "INSERT INTO ai_analytics_cache (cache_key, request_count, max_requests) VALUES ('$cacheKey', 0, 3)");
    }

    /* =========================
       COLLECT DATA
    ========================= */

    $residentsData = mysqli_query($db_connection, "SELECT * FROM tbl_resident");

    $totalResidents = 0;
    $maleCount = 0;
    $femaleCount = 0;

    $ageGroups = ['0-14' => 0, '15-49' => 0, '50-59' => 0, '60+' => 0];

    while ($r = mysqli_fetch_assoc($residentsData)) {

        $age = is_numeric($r['age']) ? intval($r['age']) : 0;
        $sex = ucfirst(strtolower(trim($r['sex'])));

        if ($age <= 14) $ageGroups['0-14']++;
        elseif ($age <= 49) $ageGroups['15-49']++;
        elseif ($age <= 59) $ageGroups['50-59']++;
        else $ageGroups['60+']++;

        $totalResidents++;
        if ($sex === 'Male') $maleCount++;
        if ($sex === 'Female') $femaleCount++;
    }

    // $aiInput = [
    //     "total_residents" => $totalResidents,
    //     "male" => $maleCount,
    //     "female" => $femaleCount,
    //     "age_groups" => $ageGroups
    // ];

    // Calculate percentages
    $totalSafe = ($totalResidents > 0) ? $totalResidents : 1;

    $malePercent = round(($maleCount / $totalSafe) * 100, 2);
    $femalePercent = round(($femaleCount / $totalSafe) * 100, 2);

    // Comparison difference
    $genderDifference = abs($malePercent - $femalePercent);
    $genderDominant = ($malePercent > $femalePercent) ? "Male" : "Female";

    // Age percentages
    $agePercentages = [];
    foreach ($ageGroups as $k => $v) {
        $agePercentages[$k] = round(($v / $totalSafe) * 100, 2);
    }

    // Dominant age group
    $dominantAgeGroup = array_keys($ageGroups, max($ageGroups))[0];

    $aiInput = [
        "total_residents" => $totalResidents,

        "gender" => [
            "male_count" => $maleCount,
            "female_count" => $femaleCount,
            "male_percent" => $malePercent,
            "female_percent" => $femalePercent,
            "difference_percent" => $genderDifference,
            "dominant" => $genderDominant
        ],

        "age_groups" => $ageGroups,
        "age_percentages" => $agePercentages,
        "dominant_age_group" => $dominantAgeGroup
    ];

    /* =========================
       RANDOMIZE RESPONSE FROM TABLE (TEMPLATES)
       - Pulls random template from ai_analytics_cache (v1..v10)
       - Fills placeholders using live DB metrics
       - Caches final rendered response under resident_ai_analysis
    ========================= */

    $scenarioKeys = [
        'resident_ai_analysis_v1',
        'resident_ai_analysis_v2',
        'resident_ai_analysis_v3',
        'resident_ai_analysis_v4',
        'resident_ai_analysis_v5',
        'resident_ai_analysis_v6',
        'resident_ai_analysis_v7',
        'resident_ai_analysis_v8',
        'resident_ai_analysis_v9',
        'resident_ai_analysis_v10'
    ];

    $inList = "'" . implode("','", $scenarioKeys) . "'";

    $prevText = $cacheData['ai_response'] ?? '';
    $aiText = '';
    $scenarioPicked = '';

    $tries = 0;
    while ($tries < 10) {
        $scenarioQuery = mysqli_query(
            $db_connection,
            "SELECT cache_key, ai_response FROM ai_analytics_cache WHERE cache_key IN ($inList) ORDER BY RAND() LIMIT 1"
        );
        $scenarioRow = $scenarioQuery ? mysqli_fetch_assoc($scenarioQuery) : null;

        if ($scenarioRow && !empty($scenarioRow['ai_response'])) {
            $scenarioPicked = $scenarioRow['cache_key'] ?? '';
            $aiText = fill_ai_placeholders($scenarioRow['ai_response'], $aiInput);
        } else {
            // Fallback: use local variants if scenario rows are missing
            $variants = build_local_ai_variants($aiInput);
            $idx = random_int(0, 2);
            $scenarioPicked = 'local_variant_' . ($idx + 1);
            $aiText = $variants[$idx];
        }

        if (empty($prevText) || $aiText !== $prevText) {
            break;
        }
        $tries++;
    }

    $currentCount = (int)($cacheData['request_count'] ?? 0);
    $maxRequests = (int)($cacheData['max_requests'] ?? 3);
    if ($maxRequests <= 0) {
        $maxRequests = 3;
    }

    // Keep randomizing forever by cycling the counter instead of hard-stopping.
    $newCount = ($currentCount >= $maxRequests) ? 1 : ($currentCount + 1);

    // Persist request count + latest response
    $escapedResponse = mysqli_real_escape_string($db_connection, $aiText);

    if ($cacheData) {
        mysqli_query(
            $db_connection,
            "UPDATE ai_analytics_cache SET request_count=$newCount, ai_response='$escapedResponse', last_generated=NOW(), updated_at=NOW() WHERE cache_key='$cacheKey'"
        );
    } else {
        mysqli_query(
            $db_connection,
            "UPDATE ai_analytics_cache SET request_count=1, ai_response='$escapedResponse', last_generated=NOW(), updated_at=NOW() WHERE cache_key='$cacheKey'"
        );
    }

    /* =========================
       SAVE TO CACHE
    ========================= */

    echo json_encode([
        "result" => $aiText,
        "cached" => false,
        "scenario" => $scenarioPicked,
        "data" => $aiInput
    ]);

    exit;
}
/* =========================
   NORMAL DATA DISPLAY
========================= */

$residentsData = mysqli_query($db_connection, "SELECT * FROM tbl_resident");

$totalResidents = 0;
$maleCount = 0;
$femaleCount = 0;

while ($r = mysqli_fetch_assoc($residentsData)) {
    $totalResidents++;
    if (strtolower($r['sex']) === 'male') $maleCount++;
    if (strtolower($r['sex']) === 'female') $femaleCount++;
}
$cacheKey = "resident_ai_analysis";

$cacheQuery = mysqli_query($db_connection, "SELECT * FROM ai_analytics_cache WHERE cache_key='$cacheKey' LIMIT 1");
$cacheData = mysqli_fetch_assoc($cacheQuery);

$savedAI = "";

if ($cacheData && !empty($cacheData['ai_response'])) {
    $savedAI = $cacheData['ai_response'];
}
?>
<?php
// Age groups for chart
$ageGroups = ['0-14' => 0, '15-49' => 0, '50-59' => 0, '60+' => 0];

$residentsData = mysqli_query($db_connection, "SELECT age, sex FROM tbl_resident");

while ($r = mysqli_fetch_assoc($residentsData)) {
    $age = intval($r['age']);

    if ($age <= 14) $ageGroups['0-14']++;
    elseif ($age <= 49) $ageGroups['15-49']++;
    elseif ($age <= 59) $ageGroups['50-59']++;
    else $ageGroups['60+']++;
}
?>
<?php include('dashboard_sidebar_start.php'); ?>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<div class="container-fluid">

    <div class="d-flex justify-content-end mb-3">
        <button class="btn" onclick="generateAI()"
            style="background-color:#6f42c1; border-color:#6f42c1; color:white;">
            Generate AI Insights
        </button>
    </div>

    <h1 class="text-center">Population & AI Analytics</h1>
    <hr>

    <!-- AI INSIGHTS -->
    <div class="card p-3 mb-4 shadow">
        <h5>AI Insights & Analytics</h5>
        <div id="aiResult">
            <?= !empty($savedAI) ? nl2br(htmlspecialchars($savedAI)) : "Click \"Generate AI Insights\" to analyze data." ?>
        </div>

        <div id="comparisonBox" class="mb-3"></div>
    </div>










    <!-- STATS -->
    <div class="row text-center mb-4">

        <div class="col-md-4">
            <div class="card bg-info text-white p-3">
                <h5>Total Residents</h5>
                <h3><?= $totalResidents ?></h3>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card bg-primary text-white p-3">
                <h5>Male</h5>
                <h3><?= $maleCount ?></h3>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card bg-danger text-white p-3">
                <h5>Female</h5>
                <h3><?= $femaleCount ?></h3>
            </div>
        </div>

    </div>


    <style>
        .chart-container {
            position: relative;
            width: 100%;
            height: 320px;
            /* same height for both */
            padding: 10px;
        }

        .card-body {
            padding: 1rem !important;
            /* ensures charts have breathing room */
        }
    </style>

    <div class="row mb-4">

        <!-- PIE CHART -->
        <div class="col-md-6 d-flex">
            <div class="card shadow w-100">
                <div class="card-header text-center font-weight-bold">
                    Gender Distribution
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="genderChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- LINE CHART -->
        <div class="col-md-6 d-flex">
            <div class="card shadow w-100">
                <div class="card-header text-center font-weight-bold">
                    Age Distribution
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="ageChart"></canvas>
                    </div>
                </div>
            </div>
        </div>


        <!-- BAR CHART -->
        <div class="col-md-6 d-flex">
            <div class="card shadow w-100">
                <div class="card-header text-center font-weight-bold">
                    Residents per Age Group
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="ageBarChart"></canvas>
                    </div>
                </div>
            </div>
        </div>


        <!-- POLAR AREA CHART -->
        <div class="col-md-6 d-flex">
            <div class="card shadow w-100">
                <div class="card-header text-center font-weight-bold">
                    Age Group Proportion
                </div>
                <div class="card-body">
                    <div class="chart-container">
                        <canvas id="agePolarChart"></canvas>
                    </div>
                </div>
            </div>
        </div>



    </div>
</div>


</div>
<style>
    .border-left-primary {
        border-left: 5px solid #007bff;
    }

    .border-left-info {
        border-left: 5px solid #17a2b8;
    }

    .border-left-warning {
        border-left: 5px solid #ffc107;
    }

    .border-left-success {
        border-left: 5px solid #28a745;
    }

    .card h6 {
        font-weight: 600;
        margin-bottom: 10px;
    }
</style>


<script>
    function formatAIReport(text) {

        const sections = {
            summary: "",
            trends: "",
            observations: "",
            recommendations: ""
        };

        const summaryMatch = text.match(/Summary:(.*?)(Trends:|$)/is);
        const trendsMatch = text.match(/Trends:(.*?)(Observations:|$)/is);
        const observationsMatch = text.match(/Observations:(.*?)(Recommendations:|$)/is);
        const recommendationsMatch = text.match(/Recommendations:(.*)/is);

        if (summaryMatch) sections.summary = summaryMatch[1].trim();
        if (trendsMatch) sections.trends = trendsMatch[1].trim();
        if (observationsMatch) sections.observations = observationsMatch[1].trim();
        if (recommendationsMatch) sections.recommendations = recommendationsMatch[1].trim();

        return sections;
    }

    function renderReport(data) {

        const parsed = formatAIReport(data);

        return `
        <div class="row">

            <div class="col-md-6 mb-3">
                <div class="card p-3 shadow-sm border-left-primary">
                    <h6>📊 Summary</h6>
                    <p>${parsed.summary.replace(/\n/g, "<br>")}</p>
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <div class="card p-3 shadow-sm border-left-info">
                    <h6>📈 Trends</h6>
                    <p>${parsed.trends.replace(/\n/g, "<br>")}</p>
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <div class="card p-3 shadow-sm border-left-warning">
                    <h6>🔍 Observations</h6>
                    <p>${parsed.observations.replace(/\n/g, "<br>")}</p>
                </div>
            </div>

            <div class="col-md-6 mb-3">
                <div class="card p-3 shadow-sm border-left-success">
                    <h6>💡 Recommendations</h6>
                    <p>${parsed.recommendations.replace(/\n/g, "<br>")}</p>
                </div>
            </div>

        </div>
    `;
    }
</script>
<script>
    // function generateAI() {
    //     const output = document.getElementById("aiResult");
    //     output.innerHTML = "Generating AI insights...";

    //     fetch("?generate_ai=1")
    //         .then(res => res.json())
    //         .then(data => {
    //             if (data.result) {
    //                 output.innerHTML = renderReport(data.result);
    //             } else {
    //                 output.innerHTML = "Failed to generate insights.";
    //             }
    //         })
    //         .catch(() => {
    //             output.innerHTML = "Error generating insights.";
    //         });
    // }

    function generateAI() {
        const output = document.getElementById("aiResult");
        const comparisonBox = document.getElementById("comparisonBox");

        output.innerHTML = "Generating AI insights...";
        comparisonBox.innerHTML = "";

        fetch("?generate_ai=1")
            .then(res => res.json())
            .then(data => {
                if (data.result) {
                    output.innerHTML = renderReport(data.result);

                    // 🔥 AUTO COMPARISON DISPLAY
                    if (data.data) {
                        const g = data.data.gender;

                        comparisonBox.innerHTML = `
                        <div class="card p-3 shadow-sm border-left-primary text-center">
                            <strong>
                                ${g.dominant} population is higher by ${g.difference_percent}%
                            </strong><br>
                            (${g.male_percent}% Male vs ${g.female_percent}% Female)
                        </div>
                    `;
                    }

                } else {
                    output.innerHTML = "Failed to generate insights.";
                }
            })
            .catch(() => {
                output.innerHTML = "Error generating insights.";
            });
    }
</script>
<script>
    // PHP → JS
    const maleCount = <?= $maleCount ?>;
    const femaleCount = <?= $femaleCount ?>;

    const ageLabels = <?= json_encode(array_keys($ageGroups)) ?>;
    const ageData = <?= json_encode(array_values($ageGroups)) ?>;

    const commonOptions = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'bottom'
            }
        },
        layout: {
            padding: 10
        }
    };

    // Doughnut Chart
    new Chart(document.getElementById('genderChart'), {
        type: 'doughnut',
        data: {
            labels: ['Male', 'Female'],
            datasets: [{
                data: [maleCount, femaleCount],
                backgroundColor: ['#4e73df', '#e74a3b'],
                borderColor: '#ffffff',
                borderWidth: 2
            }]
        },
        options: commonOptions
    });

    // Line Chart
    new Chart(document.getElementById('ageChart'), {
        type: 'line',
        data: {
            labels: ageLabels,
            datasets: [{
                label: 'Residents',
                data: ageData,
                borderColor: '#1cc88a',
                backgroundColor: 'rgba(28,200,138,0.1)',
                fill: true,
                tension: 0.2, // smoother curve
                pointRadius: 5,
                pointBackgroundColor: '#1cc88a'
            }]
        },
        options: commonOptions
    });

    // Bar Chart
    new Chart(document.getElementById('ageBarChart'), {
        type: 'bar',
        data: {
            labels: ageLabels,
            datasets: [{
                label: 'Residents',
                data: ageData,
                backgroundColor: '#36b9cc'
            }]
        },
        options: commonOptions
    });


    new Chart(document.getElementById('agePolarChart'), {
        type: 'polarArea',
        data: {
            labels: ageLabels,
            datasets: [{
                label: 'Residents',
                data: ageData,
                backgroundColor: ['#1cc88a', '#36b9cc', '#f6c23e', '#e74a3b']
            }]
        },
        options: commonOptions
    });
</script>
<?php include('dashboard_sidebar_end.php'); ?>