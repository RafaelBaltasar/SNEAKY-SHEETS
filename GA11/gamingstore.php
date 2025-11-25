<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection
$conn = mysqli_connect("localhost", "root", "", "gamestore");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT * FROM products";
$result = mysqli_query($conn, $sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gaming Store Items</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #0b0b0b, #1a1a1a);
        margin: 0;
        padding: 0;
        color: #fff;
        overflow-x: hidden;
    }

    .intro {
        width: 100%;
        height: 100vh;
        background: #000;
        position: fixed;
        top: 0;
        left: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 999;
        animation: fadeOut 1.5s ease 2.5s forwards;
    }

    .intro h1 {
        font-size: 70px;
        color: #00f5ff;
        text-shadow: 0 0 15px #00eaff, 0 0 40px #00eaff;
        opacity: 0;
        animation: fadeIn 2s ease forwards, glowPulse 2s infinite alternate;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.8); }
        to { opacity: 1; transform: scale(1); }
    }

    @keyframes fadeOut {
        from { opacity: 1; }
        to { opacity: 0; visibility: hidden; }
    }

    @keyframes glowPulse {
        0% { text-shadow: 0 0 15px #00eaff; }
        100% { text-shadow: 0 0 25px #00eaff, 0 0 45px #00eaff; }
    }

    .content {
        padding: 120px 40px;
    }

    h2.section-title {
        text-align: center;
        font-size: 45px;
        color: #00f5ff;
        text-shadow: 0 0 15px #00eaff;
        opacity: 0;
        animation: fadeSlideDown 1s ease forwards 3s;
    }

    @keyframes fadeSlideDown {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 30px;
        opacity: 0;
        animation: fadeSlideUp 1s ease forwards 3.5s;
    }

    @keyframes fadeSlideUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card {
        background: #121212;
        padding: 20px;
        border-radius: 15px;
        border: 1px solid #1f1f1f;
        box-shadow: 0 0 18px rgba(0, 255, 255, 0.1);
        transition: 0.25s ease-in-out;
    }

    .card:hover {
        transform: translateY(-6px);
        box-shadow: 0 0 25px #00eaff;
        border-color: #00eaff;
    }

    .card h3 {
        color: #00eaff;
        font-size: 22px;
        margin-bottom: 10px;
        text-shadow: 0 0 6px #00eaff;
    }

    .price {
        font-size: 24px;
        color: #2aff7b;
        font-weight: bold;
        margin: 10px 0;
    }

    .card p {
        color: #d4d4d4;
        font-size: 14px;
        line-height: 1.5;
    }

    .category {
        margin-top: 10px;
        color: #bbbbbb;
        font-size: 13px;
    }

    /* Buttons */
    .btn {
        margin-top: 15px;
        background: #00eaff;
        padding: 10px;
        border-radius: 8px;
        color: black;
        font-weight: bold;
        text-align: center;
        cursor: pointer;
        display: block;
        text-decoration: none;
        transition: 0.2s;
    }

    .btn:hover {
        background: #00ffff;
        box-shadow: 0 0 10px #00eaff;
    }

    .cart-btn {
        background: #2aff7b;
    }

    .cart-btn:hover {
        background: #4dff9b;
        box-shadow: 0 0 10px #2aff7b;
    }
</style>
</head>

<body>

<div class="intro">
    <h1>GAMING STORE</h1>
</div>

<div class="content">

<h2 class="section-title">Available Products</h2>

<div class="product-grid">

<?php
if (mysqli_num_rows($result) > 0) {

    while ($row = mysqli_fetch_assoc($result)) {

        switch ($row['categories_id']) {
            case 1: $cat = "Consoles"; break;
            case 2: $cat = "PC Gaming"; break;
            case 3: $cat = "Peripherals"; break;
            case 4: $cat = "Accessories"; break;
            default: $cat = "Other";
        }
?>

    <div class="card">
        <h3><?= $row['product_name'] ?></h3>
        <div class="price">₱<?= number_format($row['price'], 2) ?></div>
        <p><?= $row['description'] ?></p>
        <p class="category">Category: <?= $cat ?></p>

        <a class="btn">View Item</a>
        <a class="btn cart-btn">Add to Cart</a>
    </div>

<?php
    }
}
?>

</div>
</div>

</body>
</html>
