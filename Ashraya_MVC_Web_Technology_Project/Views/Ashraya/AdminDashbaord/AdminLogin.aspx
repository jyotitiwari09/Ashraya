<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<!-- Created By CodingNepal - www.codingnepalweb.com -->
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login</title>
    <link href="../../../Contents/CSS3/AdminDashboard/AdminDashboard/logincss.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    public string A { get; set; }
  protected void Page_Load(object sender, EventArgs e)
  {
      this.A = ViewBag.A;
      if (this.A == "EFail")
      {
          Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Email_Error();", true);

      }
      else if (this.A == "PFail")
      {
          Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Password_Error();", true);
   
      }
  }
</script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/AdminLogin.js"></script>
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
        <img class="backImg" src="../../../Contents/Images/Homepage/Background/card.jpg" alt="">
        <div class="text">
          <span class="text-1">Setting new standards  <br> for a modern lifestyle.</span>
          <span class="text-2">Let's get started</span>
        </div>
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Login</div>
          <form runat="server" id="Alogin" name="Alogin">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="email" placeholder="Enter your email" required="required" id="EA" name="EA" runat="server">
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Enter your password" required="required" maxlength="15"  id="EP" name="EP" runat="server">
              </div>
                 <div class="text"><a href='<%= Url.Action("ForgetPassword", "Ashraya") %>'>Forgot password?</a></div>
              <div class="button input-box">
                <input type="submit" value="Submit">
              </div>
            </div>
        </form>
      </div>
        
    </div>
  </div>
</div>
</body>
</html>