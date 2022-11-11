<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Owner Dashboard</title>
    <link href="../../../Contents/CSS3/OwnerDashboard/logincss.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/customerbooking.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select P.Name AS PGName,P.Location as PGLocation ,P.Img1 as PGImage,R.RoomType AS Room,R.Price AS RoomPrice,R.Img1 AS RoomImage  From PG P,Room R,Registration_Table RT Where(RT.ID=P.Owner_ID) AND (R.PGID=P.ID)  AND (RT.Role='Owner') AND (RT.ID='"+Session["ID"].ToString()+"') ;", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }

        }
      }
</script>
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
          <th>PG Name</th>
          <th>Location</th>
          <th>PG Image </th>
          <th>Room</th>
          <th>Price</th>
          <th>Room Image </th>
        </tr>
      </thead>
      <tbody>
        <tr>
               <td data-label="PG Name"><%#Eval("PGName")%></td>
            <td data-label="Location"><%#Eval("PGLocation")%></td>
            <td data-label="PG Image" style="align-items:center;"><img src="../../../Contents/Images/PG/<%#Eval("PGImage")%>"></td>
            <td data-label="Room"><%#Eval("Room")%></td>
             <td data-label="Price"><%#Eval("RoomPrice")%></td>
          <td data-label="Room Image" style="align-items:center;"><img src="../../../Contents/Images/Rooms/<%#Eval("RoomImage")%>"></td>
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