<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>PG Update</title>
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerProfile/democustprofile.css">
    <link rel="stylesheet" href="../../../Contents/CSS3/MyBookings/customerbooking.css" />
  <!-- <link rel="stylesheet" href="customer.css"> -->
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerProfile/logincss.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script runat="server">
        public string Information { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand Owner = new System.Data.SqlClient.SqlCommand("Select Count(*) From PG WHERE Owner_ID='" + Session["ID"].ToString() + "'", Con);
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
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select P.ID,P.Name,P.Location,P.Img1 From PG P,Registration_Table R WHERE (R.ID=P.Owner_ID) AND (R.Role='Owner') AND (R.ID='" + Session["ID"].ToString() + "');", con);
                    //     cmd.CommandType = CommandType.TableDirect;
                    con.Open();
                    DataList1.DataSource = cmd.ExecuteReader();
                    DataList1.DataBind();
                    con.Close();
                }

            }
       
            
            /*Pop Up Box Call*/
            this.Information = ViewBag.Information;
            if (this.Information == "CannotDelete")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "CannotDelete();", true);
            }
            else if (this.Information == "CannotDelete2")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "CannotDelete2();", true);
            }
            else if (this.Information == "Delete")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Delete();", true);
            }
            
        }
    </script>
    <script>
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/DeletePG.js"></script>
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
     <style>
        .swal-modal {
    height: max-content;
    top: 32%;
    position: relative;
}
    </style>
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
<form runat="server" name='PGDEL' id='PGDEL' >
         <asp:DataList ID="DataList1" runat="server">
             <ItemTemplate>
                  
    <table>
      <thead>
        <tr>
          <th>Image</th>
          <th>Name</th>
          <th>Location</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="Image"><img src="../../../Contents/Images/PG/<%#Eval("Img1")%>"></td>
          <td data-label="Name"><%#Eval("Name")%></td>
          <td data-label="Location"><%#Eval("Location")%></td>
          <td>
            <span class="action_btn">
                <button type="submit" style=" font-size: large;background-color: #00bcd4;color: white;border: 3px solid white;border-radius: 9px;padding: 7px;"  Value="<%#Eval("ID")%>" id='pgdeleted' name='pgdeleted'>Remove</button>
            </span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
          
          </ItemTemplate>
         </asp:DataList>
    </form>
  </div>

      </div>
</body>
</html>