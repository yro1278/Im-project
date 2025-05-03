<?php
// Pagination settings
$records_per_page = 10; // Number of users per page
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // Current page
$page = max(1, $page); // Ensure page is at least 1

// Get user filter if specified
$selectedUserId = isset($_GET['user_id']) ? (int)$_GET['user_id'] : null;

// Get total number of users for pagination
$totalUsers = 0;
try {
    $countQuery = $conn->prepare("
        SELECT COUNT(*) as count 
        FROM users u
        " . ($selectedUserId !== null ? "WHERE u.id = ?" : "")
    );
    
    if ($selectedUserId !== null) {
        $countQuery->execute([$selectedUserId]);
    } else {
        $countQuery->execute();
    }
    
    $totalUsers = $countQuery->fetch(PDO::FETCH_ASSOC)['count'];
} catch(PDOException $e) {
    // If count fails, we'll just use 0 as fallback
}

// Calculate total pages
$total_pages = ceil($totalUsers / $records_per_page);

// Adjust current page if it's beyond the total pages
$page = min($page, max(1, $total_pages));

// Calculate offset for SQL query
$offset = ($page - 1) * $records_per_page;

// Get user metrics data with pagination
$userMetrics = getUserMetricsPaginated($selectedUserId, $records_per_page, $offset);

// Check if there was an error
if (isset($userMetrics['error'])) {
    echo '<div class="error">Error loading data: ' . htmlspecialchars($userMetrics['error']) . '</div>';
} else {
    // Check if we have data
    if (empty($userMetrics)) {
        echo '<div class="no-data">No user metrics available.</div>';
    } else {
        // Get all users for the filter dropdown
        $allUsers = [];
        try {
            $query = $conn->query("SELECT id, name FROM users ORDER BY name");
            $allUsers = $query->fetchAll(PDO::FETCH_ASSOC);
        } catch(PDOException $e) {
            // Silently fail, we'll just not show the filter
        }
?>
<!-- User filter if there are users -->
<?php if (!empty($allUsers)): ?>
<div class="filter-container">
    <form method="get" action="">
        <label for="user-filter">Filter by User:</label>
        <select name="user_id" id="user-filter" onchange="this.form.submit()">
            <option value="">All Users</option>
            <?php foreach ($allUsers as $user): ?>
            <option value="<?php echo $user['id']; ?>" <?php echo ($selectedUserId == $user['id']) ? 'selected' : ''; ?>>
                <?php echo htmlspecialchars($user['name']); ?>
            </option>
            <?php endforeach; ?>
        </select>
        <?php if (isset($_GET['page'])): ?>
        <input type="hidden" name="page" value="1">
        <?php endif; ?>
    </form>
</div>
<?php endif; ?>

<div class="table-responsive">
    <table class="data-table">
        <thead>
            <tr>
                <th>User</th>
                <th>Gender</th>
                <th>Posts</th>
                <th>Reactions</th>
                <th>Comments</th>
                <th>Shares</th>
                <th>Total Engagement</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($userMetrics as $user): 
                $totalEngagement = $user['total_reacts'] + $user['total_comments'] + $user['total_shares'];
            ?>
            <tr>
                <td><?php echo htmlspecialchars($user['name']); ?></td>
                <td><?php echo htmlspecialchars($user['gender']); ?></td>
                <td><?php echo $user['post_count']; ?></td>
                <td><?php echo $user['total_reacts']; ?></td>
                <td><?php echo $user['total_comments']; ?></td>
                <td><?php echo $user['total_shares']; ?></td>
                <td><?php echo $totalEngagement; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>

<!-- Pagination controls -->
<?php if ($total_pages > 1): ?>
<div class="pagination">
    <?php 
    // Previous page link
    if ($page > 1): 
        $prevParams = $_GET;
        $prevParams['page'] = $page - 1;
        $prevQueryString = http_build_query($prevParams);
    ?>
        <a href="?<?php echo $prevQueryString; ?>" class="page-link">&laquo; Previous</a>
    <?php else: ?>
        <span class="page-link disabled">&laquo; Previous</span>
    <?php endif; ?>
    
    <?php 
    // Page numbers
    $start_page = max(1, $page - 2);
    $end_page = min($total_pages, $page + 2);
    
    for ($i = $start_page; $i <= $end_page; $i++): 
        $pageParams = $_GET;
        $pageParams['page'] = $i;
        $pageQueryString = http_build_query($pageParams);
    ?>
        <?php if ($i == $page): ?>
            <span class="page-link current"><?php echo $i; ?></span>
        <?php else: ?>
            <a href="?<?php echo $pageQueryString; ?>" class="page-link"><?php echo $i; ?></a>
        <?php endif; ?>
    <?php endfor; ?>
    
    <?php 
    // Next page link
    if ($page < $total_pages): 
        $nextParams = $_GET;
        $nextParams['page'] = $page + 1;
        $nextQueryString = http_build_query($nextParams);
    ?>
        <a href="?<?php echo $nextQueryString; ?>" class="page-link">Next &raquo;</a>
    <?php else: ?>
        <span class="page-link disabled">Next &raquo;</span>
    <?php endif; ?>
    
    <div class="pagination-info">
        Page <?php echo $page; ?> of <?php echo $total_pages; ?> (<?php echo $totalUsers; ?> users)
    </div>
</div>
<?php endif; ?>
<?php
    }
}
?>