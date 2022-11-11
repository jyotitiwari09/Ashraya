<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>My Bookings</title>
    <link href="../../../Contents/CSS3/MyBookings/customer.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/MyBookings/customerbooking.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/MyBookings/logincss.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    public string Msg { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand Owner = new System.Data.SqlClient.SqlCommand("Select Count(B.Booking_ID) From Booking B,Registration_Table R  Where (R.ID=B.Customer_ID) AND (B.Customer_ID='" + Session["ID"].ToString() + "');", Con);
        Con.Open();
        int COunt_Owner = Convert.ToInt32(Owner.ExecuteScalar().ToString());
        Con.Close();
        if (COunt_Owner == 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " Empty();", true);
        }
        else if (!IsPostBack)
        {

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select B.Booking_ID,R.RoomType,P.Name,R.Img1,P.Location, B.Check_In_Date,B.Check_Out_Date,B.No_Of_People   From Room R,PG P,Booking B,Registration_Table RT  Where (RT.ID=P.Owner_ID) AND (P.ID=R.PGID) AND (R.ID=B.Room_ID) AND ( B.Customer_ID='" + Session["ID"].ToString() + "');", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }

        
            if (this.Msg == "Success")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Success();", true);
            }
        }
    }
</script>
    <script src="../../../Contents/Javascript/MYbooking.js"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/MyFeedback.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>
    <style>
        .swal-modal {
    height: fit-content;
    position: relative;
    top: 33%;
}
        .swal-overlay {
  background-color: rgb(0,0,0,0.9);
}
    </style>
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
  <div class="table_responsive" style="z-index:0;height: 341px;width: 100%;">
      <form runat="server" id='DeleteBook' name='DeleteBook'>
      <asp:DataList ID="DataList1" runat="server">
          <ItemTemplate>
    <table>
      <thead>
        <tr>
          <th>Room Type</th>
          <th>PG</th>
          <th>Location</th>
          <th>Image</th>
          <th>Check-In-Date</th>
          <th>Check-Out-Date</th>
          <th>No of People</th>
          <th>Click Number To Delete Booking</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="Room Type"><%#Eval("RoomType") %></td>
          <td data-label="PG"><%#Eval("Name") %></td>
          <td data-label="Location"><%#Eval("Location") %></td>
          <td data-label="Image"><img src="../../../Contents/Images/Rooms/<%#Eval("Img1") %>" alt=""></td>
          <td data-label="Check In Date"><%#Eval("Check_In_Date") %></td>
          <td data-label="Check Out Date"><%#Eval("Check_Out_Date") %></td>
          <td data-label="No Of People"><%#Eval("No_Of_People") %></td>
          <td data-label="Action">
            <span class="action_btn">
            <button type="submit" style=" font-size: large;background-color: #00bcd4;color: white;border: 3px solid white;border-radius: 9px;padding: 7px;" value="<%#Eval("Booking_ID")%>" name='DeleteBooking' id='DeleteBooking'>Remove</button>
             </span>
          </td>
        </tr>
      </tbody>
    </table>
              </ItemTemplate>
          </asp:DataList>
          </form>
  </div>
</div>
</body>
</html>