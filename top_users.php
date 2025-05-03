<?php
// Get top 10 users by post count
$topUsers = getTopUsersByPostCount();

// Check if there was an error
if (isset($topUsers['error'])) {
    echo '<div class="error">Error loading data: ' . htmlspecialchars($topUsers['error']) . '</div>';
} else {
    // Check if we have data
    if (empty($topUsers)) {
        echo '<div class="no-data">No user data available.</div>';
    } else {
        // Find the highest post count for visualization scaling
        $maxPosts = 1;
        foreach ($topUsers as $user) {
            if ((int)$user['post_count'] > $maxPosts) {
                $maxPosts = (int)$user['post_count'];
            }
        }
?>
<div class="table-responsive">
    <table class="data-table">
        <thead>
            <tr>
                <th>Rank</th>
                <th>User</th>
                <th>Posts</th>
                <th>Distribution</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($topUsers as $index => $user): 
                $barWidth = ($user['post_count'] / $maxPosts) * 100;
            ?>
            <tr>
                <td><?php echo $index + 1; ?></td>
                <td><?php echo htmlspecialchars($user['name']); ?></td>
                <td><?php echo $user['post_count']; ?></td>
                <td>
                    <div class="bar-container horizontal">
                        <div class="bar" style="width: <?php echo $barWidth; ?>%"></div>
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