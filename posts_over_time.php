<?php
// Get posts over time data (last 12 months)
$postsOverTime = getPostsOverTime(12);

// Check if there was an error
if (isset($postsOverTime['error'])) {
    echo '<div class="error">Error loading data: ' . htmlspecialchars($postsOverTime['error']) . '</div>';
} else {
    // Check if we have data
    if (empty($postsOverTime)) {
        echo '<div class="no-data">No post data available for the selected time period.</div>';
    } else {
        // Extract months and post counts for the table
        $months = [];
        $counts = [];
        
        foreach ($postsOverTime as $record) {
            $date = new DateTime($record['month'] . '-01');
            $months[] = $date->format('M Y');
            $counts[] = (int)$record['post_count'];
        }
        
        // Calculate max value for scaling the chart height
        $maxCount = max($counts) > 0 ? max($counts) : 1;
?>
<div class="chart-container">
    <table class="time-chart">
        <thead>
            <tr>
                <th>Month</th>
                <th>Posts</th>
                <th>Chart</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($postsOverTime as $index => $record): 
                $date = new DateTime($record['month'] . '-01');
                $barHeight = ($record['post_count'] / $maxCount) * 100;
            ?>
            <tr>
                <td><?php echo $date->format('M Y'); ?></td>
                <td><?php echo $record['post_count']; ?></td>
                <td>
                    <div class="bar-container">
                        <div class="bar" style="height: <?php echo $barHeight; ?>%"></div>
                    </div>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
<?php
    }
}
?>