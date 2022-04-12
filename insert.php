<?php
error_reporting(E_ALL);
    $email = $_POST['email'];
    $location = $_POST['location'];

    if (!empty($email) || !empty($location)){
        $host = "localhost:3307";
        $dbUsername = "root";
        $dbPassword = "";
        $dbname = "mnmapp";

        $conn = new mysqli($host, $dbUsername, $dbPassword, $dbname);

        if (mysqli_connect_error()){
            die('Connect Error(' . mysqli_connect_errno(). ')' . mysqli_connect_error());
        }else{
            $SELECT = "SELECT email FROM users WHERE email = ? Limit 1";
            $INSERT = "INSERT INTO users (email, location) VALUES (?, ?)";

            $stmt = $conn->prepare($SELECT);
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $stmt->bind_result($email);
            $stmt->store_result();
            $rnum = $stmt->num_rows;

            if ($rnum==0){
                $stmt->close();

                $stmt = $conn->prepare($INSERT);
                $stmt->bind_param("ss", $email, $location);
                $stmt->execute();
                echo "New Record Inserted Successfully";
                header("Location: http://localhost/home.html");
            }else{
                echo "Someone already registerd with that username";
            }
            $stmt->close();
            $conn->close();
        }

    }else{
        echo "All Fields are Required";
        die();
    }

    while($row = mysqli_fetch_array($result))
    {
        $addresses[] = $row['email'];
    }
        $to = implode(", ", $addresses);
        $subject = 'Shark Notification';
        $message = 'hello';
        mail($to, "Your Subject", "A message set by you.", "If header information.");
?>