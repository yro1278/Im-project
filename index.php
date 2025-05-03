<?php
require_once 'db_functions.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Social Media Dashboard</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <header>
        <h1>Social Media Dashboard</h1>
    </header>
    
    <main>
        <div class="dashboard-container">
            <!-- Total Engagement Section -->
            <section class="dashboard-card" id="total-engagement">
                <h2>Total Engagement</h2>
                <div class="card-content">
                    <?php include 'total_engagement.php'; ?>
                </div>
            </section>
            
            <!-- Posts Over Time Section -->
            <section class="dashboard-card" id="posts-over-time">
                <h2>Posts Over Time</h2>
                <div class="card-content">
                    <?php include 'posts_over_time.php'; ?>
                </div>
            </section>
            
            <!-- Top Users Section -->
            <section class="dashboard-card" id="top-users">
                <h2>Top 10 Users by Post Count</h2>
                <div class="card-content">
                    <?php include 'top_users.php'; ?>
                </div>
            </section>
            
            <!-- User Metrics Section -->
            <section class="dashboard-card" id="user-metrics">
                <h2>User Engagement Metrics</h2>
                <div class="card-content">
                    <?php include 'user_metrics.php'; ?>
                </div>
            </section>
        </div>
    </main>
    
    <footer>
        <p>Social Media Dashboard &copy; <?php echo date('Y'); ?></p>
    </footer>
</body>
</html>