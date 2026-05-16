<?php 
session_start();
if (!isset($_SESSION['id_client'])) {
    echo "please login first";
   header("Refresh: 2; url=login.html");
    exit;
}
$host="sql110.byethost5.com";
   $username="b5_38989381";
   $password="2005mohamed";
   $database="b5_38989381_mohfoot";

$conn = mysqli_connect($host, $username, $password, $database);
if (!$conn) {
    echo "the connection failed";
    exit;
}
$coulor = isset($_POST['color']) ? implode(", ", $_POST['color']) : null;
$qont = $_POST['quantity'];
$pointure = $_POST['pointure']; 
$ctl=$_SESSION['id_client'];
$query = "INSERT INTO orders (client_id	,couleur, quantite, pointure) VALUES ($ctl,'$coulor', $qont, $pointure)";
$result = mysqli_query($conn, $query);

if ($result) {
    echo "successfull order";
} else {
    echo "error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
