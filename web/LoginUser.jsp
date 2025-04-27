<%-- 
    Document   : LoginUser
    Created on : Jun 19, 2024, 10:37:39 PM
    Author     : Aqiilah Mohd Noor
--%>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        <link rel="stylesheet" href="headerfooter.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                font-size: 15px;
                padding: 0;
                font-family: "Times New Roman", Times, serif;
            }
            .table-container {
                width: 95%;
                margin: 50px auto;
                display: flex;
                flex-direction: column;
                align-items: center; /* Center align form */
            }

            .title {
                text-align: center;
                font-size: 25px;
                
            }
            .container {
                display: block;
                margin: auto;
                max-width: 32%;
                padding: 30px;
                background-color: #2a629d;
                box-shadow: 5px 8px 10px black;
                opacity: 0.95;
                height: fit-content;
                border-radius: 45px;
            }
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
            }
            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }
            .button-container {
                display: flex;
                justify-content: space-between; /* Space buttons evenly */
                width: 100%;
            }
            #cancelBtn, #loginBtn {
                background-color: rgb(0, 0, 0);
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 48%; /* Adjust button width as needed */
                border-radius: 20px;
            }
            #cancelBtn:hover, #loginBtn:hover {
                opacity: 0.7;
            }

            @media only screen and (max-width: 768px) {
                .container {
                    max-width: 65%;
                    margin-top: 10%;
                    right: 15%;
                }
            }
            @media only screen and (min-width: 769px) and (max-width: 991px) {
                .container {
                    max-width: 45%;
                }
            }
            @media only screen and (min-width: 992px) and (max-width: 1199px) {
                .container {
                    max-width: 35%;
                }
            }
            .footer {
                background-color: #2a629d;
                padding: 10px;
                text-align: center;
                color: white;
                position: fixed;
                bottom: 0;
                width: 100%;
                box-shadow: 0 -1px 10px rgba(0, 0, 0, 0.1);
            }
            .footer a {
                color: white;
                text-decoration: none;
                margin: 0 10px;
            }
            .footer .about {
                display: inline-block;
                margin-right: 20px;
            }
            .footer .copyright {
                display: inline-block;
                margin-right: 20px;
            }
            .footer .social-media {
                display: inline-block;
            }
            .footer .social-media a {
                margin: 0 5px;
            }
            .footer .social-media img {
                width: 24px;
                height: 24px;
            }
        </style>
        
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="marmorislogo.png" width="125px">
            </div>
        </header>
    
        <div class="table-container">
            <form action="doLogin.jsp" method="post" class="container">
                <h1 class="title">Sign in</h1>
                <br>
                <label for="username"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>

                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
                <br>
                <div class="button-container">
                    <button id="cancelBtn" type="button" onclick="window.location.href='Homepage.jsp'">Cancel</button>
                    <input type="submit" id="loginBtn" value="Login">
                </div>
                
                <br>
            </form>
        </div>

        <footer class="footer">
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
        </footer>
    </body>    
</html>
