<?php
// Get total engagement metrics
$engagementData = getTotalEngagement();

// Check if there was an error
if (isset($engagementData['error'])) {
    echo '<div class="error">Error loading data: ' . htmlspecialchars($engagementData['error']) . '</div>';
} else {
?>
<div class="stat-grid">
    <div class="stat-item">
        <div class="stat-label">Total Posts</div>
        <div class="stat-value"><?php echo number_format($engagementData['posts']); ?></div>
    </div>
    
    <div class="stat-item">
        <div class="stat-label">Total Reactions</div>
        <div class="stat-value"><?php echo number_format($engagementData['reacts']); ?></div>
    </div>
    
    <div class="stat-item">
        <div class="stat-label">Total Comments</div>
        <div class="stat-value"><?php echo number_format($engagementData['comments']); ?></div>
    </div>
    
    <div class="stat-item">
        <div class="stat-label">Total Shares</div>
        <div class="stat-value"><?php echo number_format($engagementData['shares']); ?></div>
    </div>
    
    <div class="stat-item">
        <div class="stat-label">Total Engagement</div>
        <div class="stat-value highlight"><?php echo number_format($engagementData['total_engagement']); ?></div>
    </div>
    
    <div class="stat-item">
        <div class="stat-label">Total Users</div>
        <div class="stat-value"><?php echo number_format($engagementData['users']); ?></div>
    </div>
</div>
<?php } ?>