<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Room</title>
    <link href="../../../Contents/CSS3/MyBookings/customer.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/MyBookings/logincss.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/MyBookings/customerbooking.css" rel="stylesheet" />
          <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand Owner = new System.Data.SqlClient.SqlCommand("  Select COunt(*) From Room R,PG P WHERE (P.ID=R.PGID) AND (P.Owner_ID='" + Session["ID"].ToString() + "')", Con);
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
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("  Select  R.RoomType,R.Img1,R.Price, R.ID AS RoomID,P.* FRom Room R,Registration_Table RT, PG P WHERE (P.ID=R.PGID) AND (RT.ID='" + Session["ID"].ToString() + "');", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }

        }
      }
</script>
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
     <style>
        .swal-modal {
    height: max-content;
    top: 32%;
    position: relative;
}
    </style>
       <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>
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
            <a href="#" class="desktop-link">Owner&nbsp;&nbsp;&nbsp;</a>
            <input type="checkbox" id="show-features">
            <label for="show-features">Owner</label>
           <ul>
            <li><a href='<%= Url.Action("OwnerDashboard", "Ashraya") %>'>Dashboard</a></li>
            <li><a href='<%= Url.Action("OwnerProfile", "Ashraya") %>'>My Profile</a></li>
            <li><a href='<%= Url.Action("MyRoomMyPG", "Ashraya") %>'>My Rooms</a></li>
            <li><a href='<%= Url.Action("MyPGY", "Ashraya") %>'>My PG</a></li>
            <li><a href='<%= Url.Action("PGAdd", "Ashraya") %>'>Add PG</a></li>
            <li><a href='<%= Url.Action("RoomAdd", "Ashraya") %>'>Add Room</a></li>
            <li><a href='<%= Url.Action("Logout", "Ashraya") %>'>Logout</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>  
  </div>
  <div class="table_responsive" style="z-index:0;height: 341px;width: 100%;">
  <form runat="server" id="roomchangex" name="roomchangex" >
         <asp:DataList ID="DataList1" runat="server" >
            <ItemTemplate>
     <table>
      <thead>
        <tr>
          <th>Room Type</th>
          <th>Image</th>
          <th>Price</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td data-label="RoomType"><%#Eval("RoomType")%></td>
          <td data-label="Image"><img src="../../../Contents/Images/Rooms/<%#Eval("Img1")%>"></td>
          <td data-label="Price"><%#Eval("Price")%></td>
          <td>
            <span class="action_btn">
                    <button type="submit" value="<%#Eval("RoomID") %>" class="bn3" name='TransferR' id='TransferR'>More</button>
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