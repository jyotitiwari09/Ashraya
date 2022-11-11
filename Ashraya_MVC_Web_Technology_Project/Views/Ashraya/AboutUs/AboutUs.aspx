<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>About Us</title>
    <link href="../../../Contents/CSS3/Aboutuss.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/logincss.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>
  <div class="main">
  <div class="wrapper" style="z-index:1">
    <nav>
      <input type="checkbox" id="show-search">
      <input type="checkbox" id="show-menu">
      <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label>
      <div class="content">
      <div class="logo"><a href='<%= Url.Action("AdminLogin", "Ashraya") %>'>Ashraya</a></div>
        <ul class="links">
             <li><a href=<%= Url.Action("Index", "Ashraya") %>>Home</a></li>
         <li><a href=<%= Url.Action("AboutUS", "Ashraya") %>>About Us</a></li>
          <li><a href='<%= Url.Action("Contact", "Ashraya") %>'>Contact Us</a></li>
          <li><a href='<%= Url.Action("Signin", "Ashraya") %>'>Login</a></li>
        </ul>
      </div>
    </nav>
  </div>
  <div class="cardsbox">
    <div class="maindiv">
        <div class="profile-card">
            <div class="img">
                <img src="../../../Contents/Images/AboutUs/yaser.jpg" style="width:150px;height:160px">
              </div>
              <div class="caption">

                <h3>Yaser Shaikh</h3>
                <p>Back End Developer</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/ya5er_5haikh/"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                  </div>
              </div>
              
        </div>
        <div class="profile-card">
            <div class="img">
                <img src="../../../Contents/Images/AboutUs/seema.jpg" style="width:150px;height:160px">
            </div>
            <div class="caption">
              <h3>Seema Naik</h3>
              <p>Front End Developer</p>
             <div class="social-links">
               <a href="#"><i class="fab fa-facebook"></i></a>
               <a href="https://instagram.com/___seema__nyk_?igshid=YmMyMTA2M2Y="><i class="fab fa-instagram"></i></a>
               <a href="#"><i class="fab fa-twitter"></i></a>
             </div>
           </div>
         </div>
         <div class="profile-card">
            <div class="img">
                <img src="../../../Contents/Images/AboutUs/jyoti.jpg" style="width:150px;height:160px">
            </div>
            <div class="caption">
              <h3>Jyoti Tiwari</h3>
              <p>Database Developer</p>
             <div class="social-links">
               <a href="#"><i class="fab fa-facebook"></i></a>
               <a href="https://www.instagram.com/accounts/login/?next=/block.of.beauty/"><i class="fab fa-instagram"></i></a>
               <a href="#"><i class="fab fa-twitter"></i></a>
             </div>
           </div>
         </div>
         <div class="profile-card">
            <div class="img">
               <img src="../../../Contents/Images/AboutUs/edphil.jpg">
            </div>
            <div class="caption">
              <h3>Edphil Cardozo</h3>
              <p>Front End Developer</p>
             <div class="social-links">
               <a href="#"><i class="fab fa-facebook"></i></a>
               <a href="https://instagram.com/edphil_cardozo_30?igshid=YmMyMTA2M2Y="><i class="fab fa-instagram"></i></a>
               <a href="#"><i class="fab fa-twitter"></i></a>
             </div>
           </div>
         </div>
       </div>
  </div>
  </div>
    
</body>
</html>