<?php 
$host="sql110.byethost5.com";
   $username="b5_38989381";
   $password="2005mohamed";
   $database="b5_38989381_mohfoot";
   $conn=mysqli_connect($host,$username,$password,$database);
   if(!$conn){
      echo"the connection failed";
      exit;
   }
   $email=$_POST["email"];
   $pass=$_POST["mot_pass"];
 $query="SELECT* FROM clients WHERE email='$email'";
 $query1="SELECT* FROM clients WHERE  pass='$pass'";
 $result=mysqli_query($conn,$query);
 $test=mysqli_num_rows($result);
 if($test>0)
 {
       $result1=mysqli_query($conn,$query1);
       $test1=mysqli_num_rows($result1);
       if($test1>0){
         echo "succufull login";
       }else{
         echo"password not correct";
         header("Refresh: 2; url=login.html");
         exit;
       }
      $ligne=mysqli_fetch_array($result);
       session_start();
       $_SESSION['id_client'] = $ligne[0];
      header("Refresh: 2; url=les produits.html");
 }else{
   echo "please sign up";
    header("Refresh: 2; url=create_counte.html");
    exit;
 }
?>