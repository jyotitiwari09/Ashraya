<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin</title>
    <link href="../../../Contents/CSS3/AdminDashboard/AdminDashboard/adminstyle.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/AdminDashboard/logincss.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/AdminDashboard/customer.css" rel="stylesheet" />
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    public string Message { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Message = ViewBag.Message;
        if (this.Message == "Empty")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " Empty();", true);
        }
        else
        {
            /*Connection Establishment*/
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand Customer = new System.Data.SqlClient.SqlCommand("Select Count(*) From Registration_Table Where Role='Customer';", Con);
            System.Data.SqlClient.SqlCommand Owner = new System.Data.SqlClient.SqlCommand("Select Count(*) From Registration_Table Where Role='Owner';", Con);
            System.Data.SqlClient.SqlCommand Room = new System.Data.SqlClient.SqlCommand("Select Count(*) From Room ;", Con);
            System.Data.SqlClient.SqlCommand Book = new System.Data.SqlClient.SqlCommand("Select Count(*) From Booking ;", Con);
            System.Data.SqlClient.SqlCommand PG = new System.Data.SqlClient.SqlCommand("Select Count(*) From PG;", Con);
            System.Data.SqlClient.SqlCommand Feedback = new System.Data.SqlClient.SqlCommand("Select Count(*) From Feedback;", Con);
            Con.Open();
            Customerx.InnerText = Customer.ExecuteScalar().ToString();
            Ownerx.InnerText = Owner.ExecuteScalar().ToString();
            Roomx.InnerText = Room.ExecuteScalar().ToString();
            Bookx.InnerText = Book.ExecuteScalar().ToString();
            PGx.InnerText = PG.ExecuteScalar().ToString();
            Feedbackx.InnerText = Feedback.ExecuteScalar().ToString();
            Con.Close();
        }
    }
</script>
    
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
  <div class="home-content">
    <div class="overview-boxes">
      <div class="box">
        <div class="right-side">
          <div class="box-topic">Customers</div>
          <div class="number" id="Customerx" runat="server"></div>
          <div> <a href='<%= Url.Action("AdminDeleteCustomer", "Ashraya") %>'> view more </a></div>
      </div>
      </div>
      <div class="box">
        <div class="right-side">
          <div class="box-topic">Owners</div>
          <div class="number" id="Ownerx" runat="server"></div>
          <div> <a href='<%= Url.Action("AdminDeleteOwner", "Ashraya") %>'> view more </a></div>
        </div>
        
      </div>
      <div class="box">
        <div class="right-side">
          <div class="box-topic">Pg</div>
          <div class="number" id="PGx" runat="server"></div>
          <div> <a href='<%= Url.Action("Display_All_PG", "Ashraya") %>'> view more </a></div>
          
        </div>
        
      </div>
      <div class="box">
        <div class="right-side">
          <div class="box-topic">Room</div>
          <div class="number" id="Roomx" runat="server"></div>
          <div> <a href='<%= Url.Action("Display_All_Rooms", "Ashraya") %>'> view more </a></div>
        </div>
        </div>

          <div class="box">
        <div class="right-side">
          <div class="box-topic">Bookings</div>
          <div class="number" id="Bookx" runat="server"></div>
          <div> <a href='<%= Url.Action("Display_All_Bookings", "Ashraya") %>'> view more </a></div>
        </div>
        </div>
      
          <div class="box">
        <div class="right-side">
          <div class="box-topic">Feedbacks</div>
          <div class="number" id="Feedbackx" runat="server"></div>
          <div> <a href='<%= Url.Action("Display_All_Feedbacks", "Ashraya") %>'> view more </a></div>
        </div>
        </div>
  </div>
  </div>
  </div>
  
</body>
</html>