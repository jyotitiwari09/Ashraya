<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Registration</title>
    <script runat="server">
        protected String Response1 { get; set; }
        protected String ResponseMail { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            /*For Registration*/
           this.Response1 = ViewBag.Response1;
            this.ResponseMail = ViewBag.ResponseMail;
            /*Looking For Duplicates*/
            if (this.Response1 == "Error4")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Password_Match();", true);
            }
            else if (this.Response1 == "Error1")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "phonerror();", true);
            }
            else  if (this.Response1 == "Error2")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "emailerror();", true);
            }
            else  if (this.Response1 == "Error3")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "usernameerror();", true);
            }
          else if (this.Response1 == "success")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "success();", true);
            }
            else if (this.Response1 == "successx")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "successx();", true);
            }
        
        }
    </script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="../../../Contents/CSS3/Registrations.css" rel="stylesheet" />
    <script src="../../../Contents/Javascript/Registration.js"></script>
</head>
</head>
<body onload="Confirm();">
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
      </div>
      <div class="back">
        <img class="backImg" src="../../../Contents/Images/Homepage/Background/card.jpg" alt="">
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
            <div class="signup-form1">
                <div class="title">Signup</div>
               <form id='register' class="over" runat="server" name='register' onsubmit="return Password_Match();">
                 <div class="input-boxes">
                    <div class="input-box">
                      <i class="fas fa-user"></i>
                     <input type='text' runat="server" id="FirstName" pattern="[A-Za-z]*" title="Alphabets Only" placeholder='First Name' required="required">
                    </div>
                    <div class="input-box">
                        <i class="fas fa-user"></i>
                      <input type='text' runat="server"  id="LastName" pattern="[A-Za-z]*" title="Alphabets Only" placeholder='Last Name ' required="required">
                      </div>
                    <div class="input-box">
                        <i class="fas fa-phone"></i>
                     <input type='text' runat="server" class='input-field' id="Phone" maxlength="10" placeholder='Phone '  pattern="[0-9]{10}" title="Please Enter 10 Digit Mobile Number" required="required">
                      </div>
                      <div class="input-box">
                        <i class="fas fa-phone"></i>
                        <input type="hidden" runat="server" class='input-field' id="Email" placeholder='Email Id' value='<% = ResponseMail%>' >                      
                        </div>
                       <div class="input-box"  id="SelectRole">
                        <i class="fas fa-user"></i>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Register As : <select ID="Role" runat="server" required="required" title="Please Select Your Role">
                 <option></option>
                  <option value="Customer">Customer</option>
                  <option value="Owner">Owner</option>
             </select>
                      </div>
                     <div class="input-box">
                        <i class=""></i>
                       <label id="M">Male  </label><input type="radio" runat="server" class='input-field' name="gender" id="Male" value="Male" required="required">
             <label id="F">Female  </label><input type="radio" runat="server" class='input-field' name="gender" id="Female" value="Female" required="required">
                      </div>
                       <div class="input-box">
                        <i class="far fa-map"></i>
                        <input type="text"  runat="server" class='input-field' id="Address" placeholder='Address' required="required">
                        </div>
                       <div class="input-box">
                       <i class="fas fa-birthday-cake"></i>
                       <input type="date" id="DOB"  runat="server"  required="required">
                        </div>
                       <div class="input-box">
                        <i class="fas fa-user"></i>
                         <input type="text"  id="Username" Placeholder="Username" runat="server"   required="required">
                        </div>
                       <div class="input-box">
                        <i class="far fa-keyboard"></i>
                       <input type='password' runat="server" id="Password" placeholder='Enter Password'  pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_-])(?=.*[^\da-zA-Z]).{8,15}$" title="Use 8 to 15 characters with a mix of letters, numbers & symbols" required="required" maxlength="15">
                        </div>
                       <div class="input-box">
                        <i class="far fa-keyboard"></i>
                         <input type='password' runat="server" class='input-field' id="CPassword" placeholder='Confirm Password'   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_-])(?=.*[^\da-zA-Z]).{8,15}$" title="Use 8 to 15 characters with a mix of letters, numbers & symbols" required="required" maxlength="15">
                        </div>
                    <div class="button input-box">
                      <input type="submit" id="reg"   name="submit" value="Register" />
                    </div>
                  <div class="text sign-up-text">Already have an account? <a href='<%= Url.Action("Signin", "Ashraya") %>'>Login now</div>
                    </div>
                 </form>
            </div>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AshrayaConnectionString %>" SelectCommand="SELECT * FROM [Customer_Registration_Table]"></asp:SqlDataSource>
            </div>
  </div>
</div>
</body>
</html>