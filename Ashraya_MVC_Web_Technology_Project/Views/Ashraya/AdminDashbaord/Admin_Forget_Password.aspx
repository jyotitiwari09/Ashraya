<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin Update Password</title>
  <link rel="stylesheet" href="logincss.css">
  <!-- <link rel="stylesheet" href="customer.css"> -->
  <link rel="stylesheet" href="democustprofile.css">
    <link href="../../../Contents/CSS3/AdminDashboard/ForgetPassword/democustprofile.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/ForgetPassword/logincss.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script runat="server">
        public string Msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Msg = ViewBag.Msg;
            if (Msg == "Error4")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "NoMatch();", true);
            }
            else  if (Msg == "Update")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Update();", true);
            }
            else if( Msg == "UpdateFail")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "UpdateFail();", true);
            }
        }
        </script>
    <script src="../../../Contents/Javascript/AdminForgetPassword.js"></script>
</head>
<body>
  <div class="main">
   <div class="wrapper" style="z-index:1;">
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
          
             <li>
            <a href="#" class="desktop-link">Admin&nbsp;&nbsp;&nbsp;</a>
            <input type="checkbox" id="show-features">
            <label for="show-features">Admin</label>
            <ul>
                 <li><a href='<%= Url.Action("AdminDashboard", "Ashraya") %>'>Dashboard</a></li>
                <li><a href='<%= Url.Action("VerficationData", "Ashraya") %>'>Documents</a></li>
                <li><a href='<%= Url.Action("AdminProfileUpdate", "Ashraya") %>'>Change Password</a></li>
              <li><a href='<%= Url.Action("Logout", "Ashraya") %>'>Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>  
  </div>
  <div class="register">
    <header>Update Password</header>

    <form runat="server" Name="FP" id="FP">
        <div class="form first">
           <div class="fields">
                    <div class="input-field">
                        <label>Old Password</label>
                      <input type="password" placeholder="Enter Your Old  Password" required="required" maxlength="15"  id="AOP" name="AOP"  runat="server">
                    </div>
                    <div class="input-field">
                        <label>New Password</label>
                        <input type="password" placeholder="Enter Your New  Password" required="required" maxlength="15"  id="ANP" name="ANP" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_-])(?=.*[^\da-zA-Z]).{8,15}$" title="Use 8 to 15 characters with a mix of letters, numbers & symbols" runat="server">
                    </div>
				<div class="input-field">
                        <label>Confirm Password</label>
                        <input type="password" placeholder="Enter Your Confirm  Password" required="required" maxlength="15"  id="ACP" name="ACP" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_-])(?=.*[^\da-zA-Z]).{8,15}$" title="Use 8 to 15 characters with a mix of letters, numbers & symbols" runat="server">
                    </div>
                  
                <button class="nextBtn">
                    <span class="btnText">Update</span>
                    <i class="uil uil-navigator"></i>
                </button>
          
        </div>
    </form>
</div>
  </div>
  
</body>
</html>