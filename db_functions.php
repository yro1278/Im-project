<?php
require_once 'config.php';

// Get total engagement counts
function getTotalEngagement() {
    global $conn;
    
    try {
        // Total posts
        $postsQuery = $conn->query("SELECT COUNT(*) as total_posts FROM posts");
        $totalPosts = $postsQuery->fetch(PDO::FETCH_ASSOC)['total_posts'];
        
        // Total reactions
        $reactsQuery = $conn->query("SELECT COUNT(*) as total_reacts FROM reacts");
        $totalReacts = $reactsQuery->fetch(PDO::FETCH_ASSOC)['total_reacts'];
        
        // Total comments
        $commentsQuery = $conn->query("SELECT COUNT(*) as total_comments FROM comments");
        $totalComments = $commentsQuery->fetch(PDO::FETCH_ASSOC)['total_comments'];
        
        // Total shares
        $sharesQuery = $conn->query("SELECT COUNT(*) as total_shares FROM shares");
        $totalShares = $sharesQuery->fetch(PDO::FETCH_ASSOC)['total_shares'];
        
        // Total users
        $usersQuery = $conn->query("SELECT COUNT(*) as total_users FROM users");
        $totalUsers = $usersQuery->fetch(PDO::FETCH_ASSOC)['total_users'];
        
        return [
            'posts' => $totalPosts,
            'reacts' => $totalReacts,
            'comments' => $totalComments,
            'shares' => $totalShares,
            'users' => $totalUsers,
            'total_engagement' => $totalReacts + $totalComments + $totalShares
        ];
    } catch(PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}

// Get posts over time data (by month)
function getPostsOverTime($months = 6) {
    global $conn;
    
    try {
        $query = $conn->prepare("
            SELECT 
                DATE_FORMAT(created_at, '%Y-%m') as month,
                COUNT(*) as post_count
            FROM 
                posts
            WHERE 
                created_at >= DATE_SUB(NOW(), INTERVAL ? MONTH)
            GROUP BY 
                DATE_FORMAT(created_at, '%Y-%m')
            ORDER BY 
                month ASC
        ");
        
        $query->execute([$months]);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}

// Get top 10 users by post count
function getTopUsersByPostCount() {
    global $conn;
    
    try {
        $query = $conn->query("
            SELECT 
                u.id,
                u.name,
                COUNT(p.id) as post_count
            FROM 
                users u
            JOIN 
                posts p ON u.id = p.user_id
            GROUP BY 
                u.id, u.name
            ORDER BY 
                post_count DESC
            LIMIT 10
        ");
        
        return $query->fetchAll(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}

// Get user metrics for a specific user or all users - Original function preserved for compatibility
function getUserMetrics($user_id = null) {
    global $conn;
    
    try {
        $whereClause = "";
        $params = [];
        
        if ($user_id !== null) {
            $whereClause = "WHERE u.id = ?";
            $params[] = $user_id;
        }
        
        $query = $conn->prepare("
            SELECT 
                u.id,
                u.name,
                u.gender,
                COUNT(DISTINCT p.id) as post_count,
                (SELECT COUNT(*) FROM reacts r JOIN posts p2 ON r.post_id = p2.id WHERE p2.user_id = u.id) as total_reacts,
                (SELECT COUNT(*) FROM comments c JOIN posts p3 ON c.post_id = p3.id WHERE p3.user_id = u.id) as total_comments,
                (SELECT COUNT(*) FROM shares s JOIN posts p4 ON s.post_id = p4.id WHERE p4.user_id = u.id) as total_shares
            FROM 
                users u
            LEFT JOIN 
                posts p ON u.id = p.user_id
            $whereClause
            GROUP BY 
                u.id, u.name, u.gender
            ORDER BY 
                post_count DESC
        ");
        
        $query->execute($params);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}

// Get user metrics with pagination support
function getUserMetricsPaginated($user_id = null, $limit = 10, $offset = 0) {
    global $conn;
    
    try {
        $whereClause = "";
        $params = [];
        
        if ($user_id !== null) {
            $whereClause = "WHERE u.id = ?";
            $params[] = $user_id;
        }
        
        // Add LIMIT and OFFSET to the query
        $limitClause = "LIMIT $limit OFFSET $offset";
        
        $query = $conn->prepare("
            SELECT 
                u.id,
                u.name,
                u.gender,
                COUNT(DISTINCT p.id) as post_count,
                (SELECT COUNT(*) FROM reacts r JOIN posts p2 ON r.post_id = p2.id WHERE p2.user_id = u.id) as total_reacts,
                (SELECT COUNT(*) FROM comments c JOIN posts p3 ON c.post_id = p3.id WHERE p3.user_id = u.id) as total_comments,
                (SELECT COUNT(*) FROM shares s JOIN posts p4 ON s.post_id = p4.id WHERE p4.user_id = u.id) as total_shares
            FROM 
                users u
            LEFT JOIN 
                posts p ON u.id = p.user_id
            $whereClause
            GROUP BY 
                u.id, u.name, u.gender
            ORDER BY 
                post_count DESC
            $limitClause
        ");
        
        $query->execute($params);
        return $query->fetchAll(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}

// Get detailed stats for a specific post
function getPostStats($post_id) {
    global $conn;
    
    try {
        $query = $conn->prepare("
            SELECT 
                p.id,
                p.content,
                p.created_at,
                u.name as author,
                (SELECT COUNT(*) FROM reacts WHERE post_id = p.id) as react_count,
                (SELECT COUNT(*) FROM comments WHERE post_id = p.id) as comment_count,
                (SELECT COUNT(*) FROM shares WHERE post_id = p.id) as share_count
            FROM 
                posts p
            JOIN 
                users u ON p.user_id = u.id
            WHERE 
                p.id = ?
        ");
        
        $query->execute([$post_id]);
        return $query->fetch(PDO::FETCH_ASSOC);
    } catch(PDOException $e) {
        return ['error' => $e->getMessage()];
    }
}
?>