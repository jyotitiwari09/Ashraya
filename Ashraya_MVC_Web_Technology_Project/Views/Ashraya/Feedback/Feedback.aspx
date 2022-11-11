<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Feedback</title>
  <link rel="stylesheet" href="logincss.css">
  <link rel="stylesheet" href="contactus.css">
    <link href="../../../Contents/CSS3/Feedback/Feedbacks_CSS.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/Feedback/logincss.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script runat="server">
        public string Msg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Msg = ViewBag.Msg;
            if(this.Msg=="Success")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Success();", true);
            }

            /*Getting Email */
            System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand("Select Email from Registration_Table Where ID = '" + Session["ID"].ToString() + "'", con1);
            System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand("Select FirstName from Registration_Table Where ID = '" + Session["ID"].ToString() + "'", con1);
            con1.Open();
            Email.Value = cmd1.ExecuteScalar().ToString();
            FullName.Value = cmd2.ExecuteScalar().ToString();
            con1.Close();
            
        }
    </script>
    <script src="../../../Contents/Javascript/Feedback.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
            <a href="#" class="desktop-link">Customer</a>
            <input type="checkbox" id="show-features">
            <label for="show-features">Customer</label>
              <ul>
                 <li><a href='<%= Url.Action("Dashboard_Customer", "Ashraya") %>'>Dashboard</a></li>
                <li><a href='<%= Url.Action("Feedback", "Ashraya") %>'>Give Feedback</a></li>
                 <li><a href='<%= Url.Action("FeedbackRemove", "Ashraya") %>'>My Feedback</a></li>
                <li><a href='<%= Url.Action("CustomerProfile", "Ashraya") %>'>My Profile</a></li>
               <li><a href='<%= Url.Action("MyBookings", "Ashraya") %>'>My bookings</a></li>
                <li><a href='<%= Url.Action("Logout", "Ashraya") %>'>Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
    
  </div>
  <div class="container1">
      <div class="contact-form">
        <span class="circle one"></span>
        <span class="circle two"></span>

        <form runat="server" name='FeedbackForm' id='FeedbackForm'>
          <h3 class="title">Feedback</h3>
          <div class="input-container">
            <input type="text" name="FullName" id="FullName" placeholder="FullName" runat="server" class="input" pattern="[A-Za-z]*" title="Alphabets Only" required="required" readonly="readonly"/>
            <span>FullName</span>
          </div>
          <div class="input-container">
            <input type="email"  class="input" runat="server" id="Email" placeholder="Email" name="Email" required="required" readonly="readonly"/>
            <span>Email</span>
          </div>
         <div class="input-container textarea">
            <textarea name="Op" class="input" id="Op" runat="server" placeholder="Message" style="resize:none;" required="required"></textarea>
            <span>Message</span>
          </div>
          <input type="submit" value="Send" class="btn" />
        </form>
      </div>
    </div>
  </div>
 
</body>
</html>