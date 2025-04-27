<%-- 
    Document   : addCust
    Created on : Jun 21, 2024, 2:36:24 AM
    Author     : Aqiilah Mohd Noor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marmoris Hotel</title>
    <link rel="stylesheet" href="headerfooter.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        * {
                box-sizing: border-box;  
                font-size: 15px; 
                font-family: "Times New Roman", Times, serif;
            }
            main {
                width: 50%;
                margin: 30px auto;
                display: flex;
                flex-direction: column;
                align-items: center;    
                border-radius: 45px;
                background-color: #2a629d;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                padding: -60px; /* Add padding to the main container */
                
            }

            .title {
                text-align: center;
                font-size: 25px;
            }

            .section {
                margin: 20px 0;
                margin-bottom: -20px;
            }

            label {
                display: block;
                margin-bottom: -20px;
            }

            input[type="text"], input[type="password"], input[type="email"] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }

            input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
                background-color: #ddd;
                outline: none;
            }

            .button-container {
                display: flex;
                justify-content: space-between; /* Space buttons evenly */
                width: 100%;
                

            }

            .submitBtn {
                background-color: rgb(0, 0, 0);
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 48%; /* Adjust button width as needed */
                border-radius: 20px;
            }

            .submitBtn:hover {
                opacity: 0.7;
            }
                </style>
            </head>
            <body>
            <header>
                <div class="logo">
                    <img src="marmorislogo.png" width="125px">
                </div>

            </header>


    <main>
        
        <form method="post" action="SaveCustServlet">
            <h1 class="title">Sign Up</h1>
            <div class="section">
                <label for="customer_name">Name</label><br>
                <input type="text" name="customer_name" placeholder="Enter Name" required>
            </div>
            <div class="section">
                <label for="username">Username</label><br>
                <input type="text" name="username" placeholder="Enter Username" required>
            </div>
            <div class="section">
                <label for="password">Password</label><br>
                <input type="password" name="password" placeholder="Enter Password" required>
            </div>
            <div class="section">
                <label for="customer_email">Email</label><br>
                <input type="email" name="customer_email" placeholder="Enter Email" required>
            </div>
            <div class="section">
                <label for="customer_phoneNo">Phone No</label><br>
                <input type="text" name="customer_phoneNo" placeholder="Enter Phone Number" required>
            </div>
            <br>
            <div class="button-container">
                <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='Homepage.jsp'">CANCEL</button>
                <button id="submitBtn" type="submit" class="submitBtn">SUBMIT</button>
            </div>
            <br>
        </form>
    </main>

<footer>
        <div class="footer">
            <div class="about">
                <a href="about.jsp">ABOUT US</a>
            </div>
            <div class="copyright">
                Marmoris Hotel &copy;
                <script>document.write(new Date().getFullYear());</script>
            </div>
            <div class="social-media">
                <a href="https://www.facebook.com/icreateumtofficial">
                    <img src="bxl-facebook.svg" alt="Facebook"/>
                </a>
                <a href="https://x.com/IcreateUmt?s=09">
                    <img src="bxl-twitter.svg" alt="Twitter"/>
                </a>
                <a href="https://www.instagram.com/icreateumt/?r=nametag">
                    <img src="bxl-instagram.svg" alt="Instagram"/>
                </a>
                <a href="https://api.whatsapp.com/send/?phone=601158623277&text&type=phone_number&app_absent=0">
                    <img src="bxl-whatsapp.svg" alt="WhatsApp"/>
                </a>
            </div>
        </div>
    </footer>
    </body>
</html>

