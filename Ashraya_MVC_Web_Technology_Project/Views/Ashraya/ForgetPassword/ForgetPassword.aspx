<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Forget Password</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link href="../../../Contents/CSS3/Code.css" rel="stylesheet" />
    <script runat="server">
        public String Data { get; set; }
            
        protected void Page_Load(object sender, EventArgs e)
        {
            /*For OTP Verification*/
            this.Data = ViewBag.Data;
            if (this.Data == "Email")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Email();", true);
            }
             if (this.Data == "Invalid")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "WrongEmail();", true);
             return;
            }
           
        }
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/Code.js"></script>
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

  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        <img src="../../../Contents/Images/Homepage/Background/card.jpg" alt="">
        <div class="text">
          <span class="text-1">Setting new standards <br> for a modern lifestyle</span>
          <span class="text-2">Let's get connected</span>
        </div>
      </div>
      <div class="back">
        <img class="backImg" src="card.jpg" alt="">
        <div class="text">
          <span class="text-1">Setting new standards  <br> for a modern lifestyle.</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Enter Email</div>
          <form runat="server" name='PasswordNew' id='PasswordNew' >
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-image"></i>
                <input type="email"  style="margin-top:5% ;" name="PasswordX" id="PasswordX" runat="server" placeholder="Email"  required="required" /><br/>
                 </div>
             <div class="button input-box">
                <input type="submit" value="Submit" >
              </div>
            </div>
        </form>
      </div>
        
    </div>
  </div>
</div>
</body>
</html>