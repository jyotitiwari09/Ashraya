<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Verification Before Registration</title>
  <link rel="stylesheet" href="../../../Contents/CSS3/Verify.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
		 <script runat="server">
        protected String infox { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.infox = ViewBag.infox;
            if (this.infox == "Exists")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "exists();", true);
            }
            else if (this.infox == "CK")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify();", true);
            }
            else if (this.infox == "XXX")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "XXX();", true);
            }
         }
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/Verify.js"></script>
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
        <img src="card.jpg" alt="">
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
            <div class="title">Upload Document</div>
          <form runat="server" id='Verification_Register' name='Verification_Register' >
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-image"></i>
                <input type="file" style="margin-top:5% ;" accept="image/*,*.doc,*.docx,*.pdf" runat="server" name="fileupload" id="fileupload"  required="required"/><br/>
                 </div>
                <div class="input-box">
                <i class="fas fa-image"></i>
               <input type="email" style="margin-top:5% ;"  placeholder="Email" runat="server" name="Email_Verify" id="Email_Verify"  required="required"/>
                 </div>
            <div class="button input-box">
                <input type="submit" value="Generate OTP" >
              </div>
            </div>
        </form>
      </div>
        
    </div>
  </div>
</div>
</body>
</html>