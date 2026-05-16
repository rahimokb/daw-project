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
   $firstname=$_POST['first_name'];
   $lastname=$_POST['last_name'];
   $age=$_POST['age'];
   $wilaya=$_POST['wilaya'];
   $phone=$_POST['phone_number'];
   $email=$_POST['email'];
   $addresse=$_POST['address'];
   $pass=$_POST['password'];
   $check ="SELECT * FROM clients WHERE email='$email'";//beh tchouf itha 7el men 9bel bhada email
  $res_check=mysqli_query($conn, $check);
   if (mysqli_num_rows($res_check)>0) {
     echo '<div style="padding: 10px; margin: 20px auto; max-width: 300px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 5px; text-align: center; font-family: Arial;">
    the account already exist</div>';
    header("Refresh: 3; url=login.html");//hada beh idik lsaf7a te3 log in
    exit;
}
   $test="INSERT INTO clients (fname,lname,age,wilaya,tel,email,addr,pass)VALUES('$firstname','$lastname',$age,'$wilaya',$phone,'$email','$addresse','$pass')";
   $result=mysqli_query($conn,$test);//beh id5el fe tableau
   if($result)
   {
      
    echo"successfull sign up";
    header("Refresh:3;url=les produits.html");
   }else{
    echo"error ";
   }
   mysqli_close($conn);
?>