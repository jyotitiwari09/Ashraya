<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Contact US</title>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
     <script runat="server">
        protected String Res1 { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Res1 = ViewBag.Res1;
            if(Res1=="success")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "success();", true);
            }
            if (Res1 == "successx")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "successx();", true);
            }
        }
    </script>
<link rel="stylesheet" href="../../../Contents/CSS3/logincssx.css">
  <link rel="stylesheet" href="../../../Contents/CSS3/ContactUs.css">
    <script src="../../../Contents/Javascript/ContactUs.js"></script>
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
  <div class="container1">
      
    <div class="form">
      <div class="contact-info">
        <h3 class="title">Let's make something awesome together</h3>
        <p class="text">
          Our team is happy to answer your questions.Fill out the form and we will be in touch as soon as possible
        </p>

        <div class="info">
          <div class="information">
           
            <p>Goa University,<br>MCA department,<br>Taligao - Goa</p>
            
          </div>
          <div class="information">
            
            <p>group9@unigoa.ac.in.com</p>
          </div>
          <div class="information">
            
            <p>+91 9455787895</p>
          </div>
        </div>

        <div class="social-media">
          <p>Connect with us :</p>
          <div class="social-icons">
            <a href="https://www.facebook.com/goauniversityofficial/">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="https://twitter.com/goauniversity?lang=en">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="https://www.instagram.com/goauniversityofficial/?hl=en">
              <i class="fab fa-instagram"></i>
            </a>
            <a href="https://in.linkedin.com/company/goauniversity">
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div><br>
        </div>
      </div>

      <div class="contact-form">
        <span class="circle one"></span>
        <span class="circle two"></span>

        <form runat="server" id='Contact' name='Contact' autocomplete="off">
          <h3 class="title">Contact us</h3>
          <div class="input-container">
            <input type="text" name="Name" id="Name" class="input" runat="server" required="required" placeholder="FullName"/>
           </div>
          <div class="input-container">
            <input type="email" name="Email" id="Email" class="input" runat="server" required="required" placeholder="Email"/>
           </div>
          <div class="input-container textarea">
            <textarea name="Msg" class="input" id="Msg" runat="server" required="required" placeholder="Message"></textarea>
           </div>
          <input type="submit" value="Submit" class="btn" />
        </form>
      </div>
    </div>
  </div>
</div>
   
</body>
</html>