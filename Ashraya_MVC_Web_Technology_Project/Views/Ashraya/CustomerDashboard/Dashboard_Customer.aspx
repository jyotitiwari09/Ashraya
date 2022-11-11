<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Data.DataSet>" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Customer DashBoard</title>
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerDashboard/logincss.css">
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerDashboard/customer.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    public string Data { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select R.ID AS ROOMID, P.Name,P.Location,R.Img1,R.RoomType,R.Price,R.AC,R.Television,R.Refridgerator From PG P,Room R WHERE (P.ID=R.PGID);", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }

        }

        this.Data = ViewBag.Data;
        if (this.Data == "Exists")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Exists();", true);
         }
        
        
      }

    protected void Transfer_Click(object sender, EventArgs e)
    {
        
    }
</script>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/CustomerDashboard.js"></script>
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
  <div class="carsfilter">
  <div class="list-container">
    <div class="left-col">
      <p>Rooms</p>
        <form runat="server" id='DashboardCustomers' name='DashboardCustomers'>
        <asp:DataList ID="DataList1" runat="server" >
            <ItemTemplate>
               <div class="house">
             <div class="house-img">
                 <img src="../../../Contents/Images/Rooms/<%#Eval("Img1")%>">
             </div>
             <div class="house-info">
                <h1><%#Eval("RoomType")%></h1>
                 <h4><%#Eval("Location")%></h4>
                <div class="house-price">
                    <p>guest</p>
                    <h4><%#Eval("Price")%><span>/day</span></h4>
                </div>
                <div class="book">
                    <button type="submit" class="bn3" value="<%#Eval("ROOMID") %>" id='Transfer' name='Transfer'>View Details</button>
                 </div>
             </div>
         </div>
                <br />
            </ItemTemplate>
        </asp:DataList>
    </form>
            </div>
      
</div>
</div>
  </div>
</body>
</html>