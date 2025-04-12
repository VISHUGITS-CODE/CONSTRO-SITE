<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<link rel="stylesheet" type="text/css" href="front.css">
		<script type="module" src="https://unpkg.com/ionicons@5.4.0/dist/ionicons/ionicons.esm.js"></script>
</head>
<body>
	<div class="main">
		<div class="navigationbar">
		    <div class="icon">
                         <img src="img/logo.png" alt="Hanu Builders Logo" />
		    	
		    </div>
		    <div class="navbar">
		    	<ul>
		    		<li><a href="#">HOME</a></li>
		    		<li><a href="#">PHOTOS</a></li>
		    		<li><a href="#">SERVICE</a></li>
		    		<li><a href="#">CONTACT</a></li>
		    		<li><a href="#">ABOUT US</a></li>
                                <li><a href="#" id="login-btn">LOGIN</a></li>
		    	</ul>
		    </div>
		</div>
		<div class="content">
			<h1>Building Dreams,<br><span>One Brick</span><br>At A Time!</h1>
    <p>We at Hanu Builders take pride in transforming visions into reality. From state-of-the-art skyscrapers to cozy homes, we lay the foundation for your future with precision, passion, and excellence.</p>
			
	</div>
           
            
            
		<div class="login">
    <!-- Content of the login division -->
    <span class="close-btn" id="close-btn">&times;</span>
    <h1>LOGIN !</h1>
    <form action="VerifyUser" method="get">
        <input type="text" name="email" placeholder="Enter the Email/UID">
        <input type="password" name="pwd" placeholder="Enter the password">
        <select class="scroll" name="utype">
                            <option>Admin</option>
                            <option>State-Admin</option>
                            <option>End-User</option>
                        </select>  /* 
        <input type="submit" value="Sign in" />
    </form>
    <p class="acc">Don't have an account<br>
        <a href="registration.jsp">click here</a>,to sign up
    </p>
    <p class="social">Login with</p>
    <div class="gg">
        <a href="#"><ion-icon name="logo-facebook"></ion-icon></a>
        <a href="#"><ion-icon name="logo-instagram"></ion-icon></a>
        <a href="#"><ion-icon name="logo-twitter"></ion-icon></a>
        <a href="#"><ion-icon name="logo-google"></ion-icon></a>
        <a href="#"><ion-icon name="logo-skype"></ion-icon></a>
    </div>
</div>
             <script>
// Get the login button and the login box
const loginBtn = document.getElementById('login-btn');
const loginBox = document.querySelector('.login');

// Open the login box when the login button is clicked
loginBtn.addEventListener('click', () => {
    loginBox.classList.add('active'); // Add the active class to show the box
});

// Close the login box when clicking outside of it
document.addEventListener('click', (event) => {
    if (!loginBox.contains(event.target) && event.target !== loginBtn) {
        loginBox.classList.remove('active'); // Remove the active class to hide the box
    }
});
	 </script>
<section class="portfolio" id="portfolio">
    <div class="portfolio-header">
        <h2>Our Portfolio</h2>
        <p>Take a look at some of our finest construction projects.</p>
    </div>
    <div class="portfolio-gallery">
        <div class="portfolio-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEMurVurLWjUFF9am2ZP4HMOX5Jq7RGmOApA&s" alt="High-rise Construction">
            <h3>High-Rise Building</h3>
            <p>An innovative high-rise with sustainable materials.</p>
        </div>
        <div class="portfolio-item">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtPPbztZJ5wnmscxpz6l1hAh7Z3O9xoDFPPQ&s" alt="Road Construction">
            <h3>House Construction</h3>
            <p>Efficiently built with precision and durability.</p>
        </div>
        <div class="portfolio-item">
            <img src="https://bsmedia.business-standard.com/_media/bs/img/article/2019-07/08/full/1562605599-2561.jpg" alt="Big Construction">
            <h3>Big Project</h3>
            <p>Spanning with cutting-edge engineering.</p>
        </div>
    </div>
</section>


</body>
</html>