<td>
<?php
$status = strtoupper(trim($view['status'] ?? ''));

// Mapping: status => [badge color hex, font awesome icon]
$statuses = [
    'PENDING'           => ['#FBBF24', 'fa-hourglass-half'],   // Yellow 500
    'PROCESSING'        => ['#3B82F6', 'fa-spinner'],          // Blue 500
    'APPROVED'          => ['#22C55E', 'fa-check-circle'],     // Green 500
    'REJECTED'          => ['#EF4444', 'fa-times-circle'],     // Red 500
    'READY FOR PICKUP'  => ['#A855F7', 'fa-box'],              // Purple 500
  'CLAIMED'           => ['#6B7280', 'fa-hand-holding'],     // Gray 500
  'DELETED'           => ['#111827', 'fa-archive'],          // Dark gray for archived/deleted rows
  'ARCHIVED'          => ['#111827', 'fa-archive']
];

if (isset($statuses[$status])) {
    [$color, $icon] = $statuses[$status];

    // Add spin animation for Processing status
    $spinClass = ($status === 'PROCESSING') ? 'fa-spin' : '';

    echo "<span class='badge d-inline-flex align-items-center px-3 py-2' style='gap:5px; background-color: $color; color: white;'>
            <i class='fas $icon $spinClass'></i>
            <span>$status</span>
          </span>";
} else {
    echo "<span class='badge badge-light border px-3 py-2'>
            <i class='fas fa-question-circle'></i> UNKNOWN
          </span>";
}
?>
</td>