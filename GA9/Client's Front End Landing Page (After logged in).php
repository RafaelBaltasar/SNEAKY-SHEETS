
<?php
// Get the username sent from the login form
$username = $_POST['username'] ?? 'Guest';
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GameHub - Dashboard</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-image: url("background.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: rgba(0,0,0,0.8);
            background-blend-mode: darken;
            color: white;
            min-height: 100vh;
        }

        header {
            background: rgba(0,0,0,0.75);
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            backdrop-filter: blur(3px);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        header h1 {
            font-size: 26px;
            letter-spacing: 2px;
        }

        nav a {
            color: white;
            margin: 0 12px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }

        nav a:hover {
            color: #00eaff;
        }

        .dashboard-welcome {
            padding: 70px 40px 30px;
            text-align: left;
        }

        .dashboard-welcome h2 {
            font-size: 42px;
            text-shadow: 0 0 8px rgba(0, 200, 255, 0.6);
        }

        .dashboard-welcome p {
            opacity: 0.85;
            font-size: 18px;
        }

        .quick-links {
            padding: 30px 40px;
            margin-top: 20px;
        }

        .quick-links h2 {
            font-size: 26px;
            margin-bottom: 20px;
            text-shadow: 0 0 8px rgba(255,255,255,0.3);
        }

        .link-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .link-box {
            background: rgba(255,255,255,0.08);
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            cursor: pointer;
            border: 1px solid rgba(255,255,255,0.08);
            transition: 0.3s;
            backdrop-filter: blur(4px);
        }

        .link-box:hover {
            transform: translateY(-6px);
            background: rgba(0, 150, 255, 0.25);
            border-color: #00d5ff;
        }

        .link-box h3 {
            margin-bottom: 8px;
            font-size: 20px;
        }

        .recommended {
            padding: 40px 60px 60px;
        }

        .recommended h2 {
            font-size: 26px;
            margin-bottom: 10px;
        }

        .recommend-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 30px;
        }

        .game-card {
            position: relative;
            height: 120px;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            transition: 0.3s;
            border: 1px solid rgba(255,255,255,0.18);
            margin-top: 20px;
        }

        .game-card:hover {
            transform: translateY(-6px);
            border-color: #00eaff;
        }

        .game-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(70%);
            transition: 0.3s;
        }

        .game-card:hover img {
            filter: brightness(50%);
        }

        .game-card p {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 18px;
            font-weight: bold;
            color: white;
            text-shadow: 0 0 10px rgba(0,0,0,0.9);
        }
    </style>
</head>
<body>

    <header>
        <h1>GameHub</h1>
        <nav>
            <a href="client_dashboard.php">Dashboard</a>
            <a href="products.php">Products</a>
            <a href="cart.php">My Cart</a>
            <a href="orders.php">My Orders</a>
            <a href="profile.php">Profile</a>
            <a href="landingpage.php" style="color: rgb(255,77,77);">Logout</a>
        </nav>
    </header>

    <section class="dashboard-welcome">

        <h2>Welcome Back, 
            <?php 
            echo htmlspecialchars($username); 
            ?>!</h2>

        <p>Here's your personalized dashboard. Explore, shop, and stay up-to-date with the latest gaming items.</p>
    </section>

    <section class="quick-links">
        <h2>Your Activity</h2>
        <div class="link-grid">

            <div class="link-box" onclick="location.href='wishlist.php'">
                <h3>Wishlist</h3>
                <p>Items you saved for later</p>
            </div>

            <div class="link-box" onclick="location.href='rewards.php'">
                <h3>Rewards & Points</h3>
                <p>Earn badges and discounts</p>
            </div>

            <div class="link-box" onclick="location.href='recent.php'">
                <h3>Recently Viewed</h3>
                <p>Review items you checked before</p>
            </div>

            <div class="link-box" onclick="location.href='recommended.php'">
                <h3>For You</h3>
                <p>Personalized suggestions</p>
            </div>

        </div>
    </section>

    <section class="recommended">
        <h2>Recommended for You</h2>

        <div class="recommend-grid">

            <div class="game-card">
                <img src="eldenringname.jpg" alt="Elden Ring">
                <p>Elden Ring</p>
            </div>

            <div class="game-card">
                <img src="leagueoflegends1.JPG" alt="League of Legends">
                <p>League Of Legends</p>
            </div>

            <div class="game-card">
                <img src="valorant1.jpg" alt="VALORANT">
                <p>VALORANT</p>
            </div>

        </div>
    </section>

</body>
</html>