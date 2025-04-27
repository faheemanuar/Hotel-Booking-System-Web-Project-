<%-- 
    Document   : addFeedbackCust
    Created on : Jun 27, 2024, 11:55:29 PM
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
            
             .rating {
                display: inline-block;
              }

            .rating input {
              display: none;
            }

            .rating label {
              float: right;
              cursor: pointer;
              color: #fff;
              transition: color 0.3s;
            }

            .rating label:before {
              content: '\2605';
              font-size: 30px;
            }

            .rating input:checked ~ label,
            .rating label:hover,
            .rating label:hover ~ label {
              color: orange;
              transition: color 0.3s;
            }
                </style>
            </head>
            <header>
                <div class="logo">
                    <img src="marmorislogo.png" width="125px">
                </div>

            </header>

<body>
    <main>
        
        <form method="post" action="SaveFeedbackServlet">
            <h1 class="title">Feedback Customer</h1>
            
            <div class="section">
                <label for="username">Username</label><br>
                <input type="text" name="username" placeholder="Enter Username" required>
            </div>
            
            <div class="section">
                <label for="customer_email">Email</label><br>
                <input type="email" name="customer_email" placeholder="Enter Email" required>
            </div>
            <div class="section">
                <label for="message">Message</label><br><br>
                <textarea name="message" placeholder="Enter Message" required></textarea>
            </div>
            <br>
            <br>
            <label>Rating</label>
            <br>
                <div class="rating">
                    <input value="5" name="rating" id="star5" type="radio">
                    <label for="star5"></label>
                    <input value="4" name="rating" id="star4" type="radio">
                    <label for="star4"></label>
                    <input value="3" name="rating" id="star3" type="radio">
                    <label for="star3"></label>
                    <input value="2" name="rating" id="star2" type="radio">
                    <label for="star2"></label>
                    <input value="1" name="rating" id="star1" type="radio">
                    <label for="star1"></label>
                </div>
            <br>
            <br><!-- comment -->
            <br>
            <div class="button-container">
                <button id="cancelBtn" type="reset" class="submitBtn" onclick="window.location.href='HomepageCustomer.jsp'">CANCEL</button>
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

