<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mutual Fund Platform</title>
    <style>
        /* Basic reset to remove margins/padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Smooth scroll behavior */
        html {
            scroll-behavior: smooth;
        }

        /* Navbar container */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
            padding: 5px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .logo-img {
            height: 40px;
            width: 160px;
            object-fit: contain;
            cursor: pointer;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            justify-content: center;
            flex-grow: 1;
        }

        .navbar ul li {
            margin: 0 15px;
        }

        .navbar ul li a {
            text-decoration: none;
            color: #34495E;
            font-size: 16px;
            padding: 10px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .navbar ul li a:hover {
            background-color: #3498DB;
            color: white;
            border-radius: 4px;
        }

        .auth-buttons {
            display: flex;
            gap: 10px;
        }

        .auth-button {
            padding: 8px 15px;
            color: white;
            background-color: #3498DB;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .auth-button:hover {
            background-color: #2980B9;
        }

        .video-container {
            position: relative;
            width: 100vw;
            height: 100vh;
            overflow: hidden;
        }

        video {
            width: 100vw;
            height: 100vh;
            object-fit: cover;
        }

        .overlay-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 48px;
            font-family: 'Arial', sans-serif;
            font-weight: bold;
            text-align: center;
        }

        /* About Us Section */
        #about {
            padding: 50px;
            background-color: #f7f7f7;
            display: flex;
            justify-content: space-between;
            align-items: center;
            opacity: 0;
            transform: translateY(50px);
            transition: all 1s ease;
        }

        #about.show {
            opacity: 1;
            transform: translateY(0);
        }

        #about .about-text {
            flex: 1;
            padding-right: 20px;
            opacity: 0;
            transform: translateX(-50px);
            transition: opacity 1s ease, transform 1s ease;
        }

        #about.show .about-text {
            opacity: 1;
            transform: translateX(0);
        }

        #about h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #34495E;
        }

        #about p {
            font-size: 18px;
            color: #7f8c8d;
            line-height: 1.6;
        }

        /* About Us image */
        .about-img {
            max-width: 100%;
            height: auto;
            flex: 1;
            opacity: 0;
            transform: translateX(50px);
            transition: opacity 1s ease, transform 1s ease;
        }

        #about.show .about-img {
            opacity: 1;
            transform: translateX(0);
        }

        /* Services Section */
        #services {
            padding: 50px;
            background-color: #fff;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            opacity: 0;
            transform: translateY(50px);
            transition: all 1s ease;
        }

        #services.show {
            opacity: 1;
            transform: translateY(0);
        }

        .service-card {
            background-color: #d4edda;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 350px; /* Increased card size */
            height: 450px; /* Adjusted height */
            margin: 20px;
            padding: 20px;
            text-align: center;
            position: relative;
            opacity: 0;
        }

        /* Add animations to each card */
        .service-card:nth-child(1) {
            animation: slideInFromLeft 1s forwards;
        }

        .service-card:nth-child(2) {
            animation: slideInFromRight 1s forwards;
        }

        .service-card:nth-child(3) {
            animation: slideInFromBottom 1s forwards;
        }

        .service-card:nth-child(4) {
            animation: slideInFromTop 1s forwards;
        }

        @keyframes slideInFromLeft {
            from {
                transform: translateX(-100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideInFromRight {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideInFromBottom {
            from {
                transform: translateY(100%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes slideInFromTop {
            from {
                transform: translateY(-100%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Service card images */
        .service-card img {
            max-width: 100%;
            height: 250px; /* Adjust the image height */
            object-fit: cover;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .service-card h3 {
            font-size: 24px;
            color: #34495E;
            margin-bottom: 10px;
        }

        .service-card p {
            font-size: 16px;
            color: #7f8c8d;
        }
        #contact {
            padding: 50px;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            align-items: center;
            opacity: 0;
            transform: translateY(50px);
            transition: all 1s ease;
            width: 100%;
        }

        #contact.show {
            opacity: 1;
            transform: translateY(0);
        }

        #contact h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #34495E;
            text-align: center;
        }

        #contact p {
            font-size: 18px;
            color: #7f8c8d;
            line-height: 1.6;
            max-width: 800px; /* Set a maximum width for better readability */
            text-align: center;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }

        /* Animation for appearing text step by step */
        #contact.show p {
            opacity: 1;
            transform: translateY(0);
        }

        /* Contact Info Cards */
        .contact-card {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
            width: 80%; /* Adjust for laptop screen */
            max-width: 800px;
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 1s ease, transform 1s ease;
        }

        #contact.show .contact-card {
            opacity: 1;
            transform: translateY(0);
        }

        .contact-card-icon {
            font-size: 32px;
            color: #3498db;
            margin-right: 20px;
        }

        .contact-card h3 {
            font-size: 18px;
            color: #34495E;
            margin-bottom: 5px;
        }

        .contact-card p {
            font-size: 16px;
            color: #7f8c8d;
        }

        .contact-card-content {
            display: flex;
            align-items: center;
        }

        /* Icons Styling */
        .fa {
            font-family: 'Font Awesome 5 Free'; /* Font Awesome Icon Library */
            font-weight: 900;
        }

        .fa-map-marker-alt:before {
            content: "\f3c5";
        }

        .fa-phone-alt:before {
            content: "\f879";
        }

        .fa-envelope:before {
            content: "\f0e0";
        }
        /* Footer */
        footer {
            background-color: #34495E;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 5px;
        }

        footer p {
            margin: 5px ;
            font-size: 14px;
        }

        footer a {
            color: #f39c12;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
        
    </style>
    <script>
        // JavaScript to handle scroll event and trigger the animation
        window.addEventListener('scroll', function () {
            var aboutSection = document.getElementById('about');
            var servicesSection = document.getElementById('services');
            var contactSection = document.getElementById('contact'); // Added contact section
            var aboutPosition = aboutSection.getBoundingClientRect().top;
            var servicesPosition = servicesSection.getBoundingClientRect().top;
            var contactPosition = contactSection.getBoundingClientRect().top;
            var screenPosition = window.innerHeight / 1.7;

            if (aboutPosition < screenPosition) {
                aboutSection.classList.add('show');
            }
            if (servicesPosition < screenPosition) {
                servicesSection.classList.add('show');
            }
            if (contactPosition < screenPosition) { // Trigger contact section
                contactSection.classList.add('show');
            }
        });

        // Scroll to About Us section smoothly and offset the position
        function scrollToAboutUs() {
            var aboutSection = document.getElementById('about');
            var yOffset = -50; // Adjust this value if needed to fine-tune the positioning
            var y = aboutSection.getBoundingClientRect().top + window.pageYOffset + yOffset;

            window.scrollTo({
                top: y,
                behavior: 'smooth'
            });
        }

        // Scroll to Services section smoothly and offset the position
        function scrollToServices() {
            var servicesSection = document.getElementById('services');
            var yOffset = -50; // Adjust this value if needed to fine-tune the positioning
            var y = servicesSection.getBoundingClientRect().top + window.pageYOffset + yOffset;

            window.scrollTo({
                top: y,
                behavior: 'smooth'
            });
        }
        function scrollToContactUs() {
            var contactSection = document.getElementById('contact');
            var yOffset = -100; // Adjust this value to bring Contact Us in the middle
            var y = contactSection.getBoundingClientRect().top + window.pageYOffset + yOffset;

            window.scrollTo({
                top: y,
                behavior: 'smooth'
            });
        }
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        }

    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="javascript:void(0);" onclick="scrollToTop()">

            <img src="images/logoo.png" alt="Logo" class="logo-img" />
        </a>
        <div class="toggle" onclick="toggleNavbar()">&#9776;</div>
        <ul id="navbar-links">
            <li><a class="active" href="javascript:void(0);" onclick="scrollToTop()">Home</a></li>
            <li><a href="javascript:void(0);" onclick="scrollToAboutUs()">About Us</a></li>
            <li><a href="javascript:void(0);" onclick="scrollToServices()">Services</a></li>
            <li><a href="javascript:void(0);" onclick="scrollToContactUs()">Contact Us</a></li> <!-- Updated link -->
        </ul>
        <div class="auth-buttons">
        
        <button class="auth-button" onclick="window.location.href='/login.jsp'">Login</button>
        <button class="auth-button" onclick="window.location.href='/register.jsp'">Register</button>
        </div>


    </div>

    <!-- Video with Overlay Text -->
    <div class="video-container">
        <video autoplay muted loop>
            <source src="videos/video2.mp4" type="video/mp4">
        </video>
        <div class="overlay-text">
            "Invest in mutual funds with wisdom. It’s not about timing the market, it’s about time in the market."
        </div>
    </div>

    <!-- About Us Section -->
    <div id="about">
        <div class="about-text">
            <h2>About Us</h2>
            <p>
                Welcome to the world of investment! At the crossroads of financial growth and security, we offer a carefully curated suite of Mutual Funds, Corporate Deposits, and diverse investment solutions, designed to meet the varied goals and risk appetites of every investor. Whether you're a seasoned investor or just starting your financial journey, we believe that smart, strategic investing can transform your future.

                We are committed to empowering you with informed decisions by offering a wide range of mutual fund options tailored to your unique financial goals. Our platform provides transparent insights, data-driven guidance, and a focus on sustainable growth, so that your investments grow with wisdom and purpose.
            </p>
        </div>
        <img src="images/about-us1.png" alt="About Us" class="about-img">
    </div>

    <!-- Services Section -->
    <div id="services">
        <div class="service-card">
            <img src="images/service1.png" alt="Service 1">
            <h3>India's Most Trusted Digital Wealth Management Firm</h3>
            <p>15-year track record | Over 25 Lakh clients | INR 15,400+ Crs AUM</p>
        </div>
        <div class="service-card">
            <img src="images/service2.png" alt="Service 2">
            <h3>Personalized Guidance For Life</h3>
            <p>Tech-enabled human advice | Dedicated Relationship Manager | 24/7 Robo Investment Assistance - Money Mitr | Periodic Portfolio Reviews through ATOM</p>
        </div>
        <div class="service-card">
            <img src="images/service3.png" alt="Service 3">
            <h3>Best-In-Class Research</h3>
            <p>Insights straight from our Research Desk | Unparalleled access to Macro Themes and MicroTrends</p>
        </div>
        <div class="service-card">
            <img src="images/service4.png" alt="Service 4">
            <h3>One Platform For All Your Financial Needs</h3>
            <p>Mutual Funds | Stock Broking | Insurance | NPS | Corporate Deposits | Single Account For Your Whole Family</p>
        </div>
    </div>
    
     <div id="contact">
        <h2>Contact Us</h2>
        <p>InvestWise is a product of Wealth India Financial Services Private Limited, a company with a proven track record of innovation in the financial services industry  and is known and respected in the financial markets for its expert knowledge levels, industry best practice, customer management skills, old fashioned true honesty and the goodwill of the customers.</p>

        <div class="contact-card">
            <div class="contact-card-content">
                <i class="fas fa-map-marker-alt contact-card-icon"></i>
                <div>
                    <h3>Head Office</h3>
                    <p>Wealth India Financial Services Pvt. Ltd.,<br>3rd Floor, Uttam Building, No. 38 and 39, Whites Road, Royapettah, Chennai - 600014.</p>
                </div>
            </div>
        </div>

        <div class="contact-card">
            <div class="contact-card-content">
                <i class="fas fa-phone-alt contact-card-icon"></i>
                <div>
                    <h3>Phone</h3>
                    <p>044 - 61104100</p>
                </div>
            </div>
        </div>

        <div class="contact-card">
            <div class="contact-card-content">
                <i class="fas fa-envelope contact-card-icon"></i>
                <div>
                    <h3>Email</h3>
                    <p>investwise@gmail.com</p>
                </div>
            </div>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2024 Mutual Fund Platform. All rights reserved.</p>
        <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
    </footer>
    

</body>
</html>
