<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Validation</title>

    <!-- program path ---------------->
<script>
    function validateform(){
        var name = document.forms["myform"]["firstname"].value;
        var email = document.forms["myform"]["email"].value;
        var nic = document.forms["myform"]["nic"].value;
        var tel = document.forms["myform"]["tel"].value;
        var pass = document.forms["myform"]["pass"].value;
        var repass = document.forms["myform"]["repass"].value;
       document.getElementById("error").style.color = "red";

        if(name == "" | email == "" | nic =="" | tel == "" | pass == "" | repass == ""){
            document.getElementById('error').innerHTML = "required fields are must be fielled out";
            return false;
        } 
        else if(name.length > 20){
            document.getElementById('errname').innerHTML = "name must be no more than 20 Letters";
            return false;

        }
        else if(pass.length >= 8){
            document.getElementById('errpass').innerHTML = "Password must contain min 8 chars cant enter more than 8";
            return false;

        }
       else if(pass != repass){
            document.getElementById('errrepass').innerHTML = "password is not same plese check the password again";
            return false;
        }
        }
            function passmatch(){
                var pass = document.forms["myform"]["pass"].value;
                var repass = document.forms["myform"]["repass"].value;
                if(pass == repass){
                    
                    document.getElementById("errrepass").innerHTML = "password is matching!";
					document.getElementById("errrepass").style.color="green";
                }else{
                    
                    document.getElementById("errrepass").innerHTML = "password is not matching!";
					document.getElementById("errrepass").style.color="red";
            }
         

     }

</script>

</head>
<body>

<!-- design----------------------------->

    <div style="width: 500px; height:auto; padding:30px; background:#10101010; margin: 30px auto;">
    <div id="error"></div>

    <form action="connect.php" method="POST" name="myform" onsubmit="return validateform()" >
    
        <p>Name     : <input type = "text" id="firstname" name="firstname" title="Only string and spaces and no more 20 charcters allowed"  ><span id="errname"></span></p>
        <p>Email    : <input type = "email" id="email" name="email" ><span id="errrepassmail"></span></p>
        <p>NIC No   : <input type = "text" id="nic" name="nic" pattern="[a-zA-Z0-9]{10,12}" title="only numbers and string allowed"></p>
        <p>Telephone No: <input type = "text" id="tel" name="tel" pattern="[0-9]{10}" title="numbers are allowed" ></p>
        <p>password: <input type = "password" id="pass" name="pass"  ><span id="errpass"></span></p>
        <p>Re Enter Password: <input type = "password" id="repass" name="repass" onkeyup="passmatch()"><span id="errrepass"></span></p>
        <p><input type="submit" name="submit" id="submit"></p>

    </form>
    </div>
</body>
</html>



<?php 
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "formexplain";

    
        $firstname = $_POST['firstname'];
        $email = $_POST['email'];
        $nic = $_POST['nic'];
        $tel = $_POST['tel'];
        $pass = $_POST['pass'];


    //database connect

    $conn = new mysqli('localhost','root','','formexplain');
    if($conn->connect_error){
    //if error
        die('connection failed : '.$conn->connection_error);

    }else{
        $stmt = $conn->prepare("insert into registration(firstname, email, nic, tel, pass) values(?,?,?,?,?)");

        $stmt->bind_param("sssis",$firstname, $email, $nic, $tel, $pass);
        $stmt->execute(); 
        echo "Registeration Sucessfully...";
        $stmt->close();
        $conn->close();

    }



?>
