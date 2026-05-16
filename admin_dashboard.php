<?php
// Ensure errors are displayed for debugging
ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_WARNING);

// Include required classes
include('classes/staff.class.php');
include('classes/resident.class.php');
include('classes/services.class.php');

// Get user data and validate admin status
$userdetails = $bmis->get_userdata();
$bmis->validate_admin();

// Count different types of residents
$rescount = $residentbmis->count_resident();
$rescountm = $residentbmis->count_male_resident();
$rescountf = $residentbmis->count_female_resident();
$rescountfh = $residentbmis->count_head_resident();
$rescountfm = $residentbmis->count_member_resident();
$rescountvoter = $residentbmis->count_voters();
$rescountsenior = $residentbmis->count_resident_senior();

// Count different requests and approvals
$reqscount = $residentbmis->count_approval();
$minorcount = $residentbmis->count_minor();
$pwdcount = $residentbmis->count_pwd();
$spcount = $residentbmis->count_single_parent();
$fourpscount = $residentbmis->count_fourps();
$indigentcount = $residentbmis->count_indigent();
$malcount = $residentbmis->count_malnourished();
$vacxcount = $residentbmis->count_vaccinated();
$pregnancycount = $residentbmis->count_pregnancy();
$residencycount = $residentbmis->count_residency();
$count = $residencycount['count'];
$color = $residencycount['color'];

// Count different types of permits and clearances
$bspermitcount = $residentbmis->count_bspermit();
$countbs = $bspermitcount['count'];
$colorbs = $bspermitcount['color'];

$clearancecount = $residentbmis->count_clearance();
$countbc = $clearancecount['count'];
$colorbc = $clearancecount['color'];

$indigencycount = $residentbmis->count_indigency();
$countindigency = $indigencycount['count'];
$colorindigency = $indigencycount['color'];

$blottercount = $residentbmis->count_blotter();
$countblotter = $blottercount['count'];
$colorblotter = $blottercount['color'];

// Add these lines after your existing count declarations
$osycount = $residentbmis->count_out_of_school_youth();
$lgbtqcount = $residentbmis->count_lgbtq();
$ipcommunitycount = $residentbmis->count_ip_community();
$count_hof = $residentbmis->count_hof();
?>

<style>
    /* Custom styles */
    .container-fluid {
        min-height: 80%;
    }

    .chart-container {
        display: flex;
        width: 100%;
        overflow-x: auto;
        /* Allow horizontal scrolling if charts overflow */
    }

    .chart-container canvas {
        max-width: 50%;
        /* Limit the width of each chart to 50% of the container */
        flex-shrink: 0;
        /* Prevent charts from shrinking */
    }

    .btn {
        margin-left: 10px;
    }

    @media (max-width: 768px) {
        .chart-container {
            flex-wrap: wrap;
        }

        .chart-container canvas {
            max-width: 100%;
            margin-bottom: 20px;
        }
    }
</style>

<?php
include('dashboard_sidebar_start.php');
?>






<!-- Begin Page Content -->
<div class="container-fluid">



    <?php include('admin_dashboard2.php'); ?>


</div>

<?php
include('dashboard_sidebar_end.php');
?>

</html>