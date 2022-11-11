<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Room Update</title>
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerProfile/democustprofile.css">
  <!-- <link rel="stylesheet" href="customer.css"> -->
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerProfile/logincss.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/UpdateRegistration.js"></script>
    <script runat="server">
        public string SelectFirstName { get; set; }
        public string SelectLastName { get; set; }
        public string Message { get; set; }
        public string IDStore { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IDStore = ViewBag.IDStore;
            
            /*Connection Establishment*/
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            
            /*Select ALL Columns To Store In */
            System.Data.SqlClient.SqlCommand PriceCmd = new System.Data.SqlClient.SqlCommand("Select Price From Room WHERE ID='" + Session["RoomSelectR"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand RoomTypeCmd = new System.Data.SqlClient.SqlCommand("Select RoomType From Room  WHERE ID='" + Session["RoomSelectR"].ToString() + "';", Con);
            
            /*Check For Null*/
            if (PriceCmd == null || RoomTypeCmd == null)
            {
                return;
            }
            else
            {
                /*Execute */
                Con.Open();
                SelectFirstName = PriceCmd.ExecuteScalar().ToString();
                SelectLastName = RoomTypeCmd.ExecuteScalar().ToString();
                Con.Close();
                PriceR.Value = SelectFirstName;
                RoomType.Value = SelectLastName;
            }
            
            /*Pop Up Box Call*/
            this.Message = ViewBag.Message;
            if (this.Message == "Update")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Update();", true);
            }
           if (this.Message == "CannotDeletex")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Removex();", true);
             }
            else if (this.Message == "PassNoMatch")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PassFail();", true);
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
  <div class="register" style="z-index:-1;margin-top:9%;">
    <header>Room Details</header>
     <form runat="server" name='RoomAddUD' id='RoomAddUD' >
        <div class="form first">
            <div class="details personal">
                <span class="title">Room Details</span>

                <div class="fields">
                   <div class="input-field">
                        <label>Price</label>
                        <input type="text" placeholder="Enter Price"  pattern="[0-9]{1,5}" title="Enter the Price" runat="server" required="required" name='PriceR' id='PriceR'>
                    </div>
					  <div class="input-field">
                        <label>Room Types</label>
						<select id="RoomType" name="RoomType" disabled="disabled" runat="server" required="required">
						<option></option>
						<option value="Single">Single</option>
						<option value="Double">Double</option>
						<option value="Triple">Triple</option>
						<option value="Quad">Quad</option>
						<option value="Queen">Queen</option>
						<option value="King">King</option>
						<option value="Twin">Twin</option>
						<option value="Double-double">Double-double</option>
						<option value="Studio">Studio</option>
						<option value="Master Suite">Master Suite</option>
						<option value="Mini-Suite or Junior Suite">Mini-Suite or Junior Suite</option>
						<option value="Connecting rooms">Connecting rooms</option>
						<option value="Adjoining rooms">Adjoining rooms</option>
						<option value="Adjacent rooms">Adjacent rooms</option>
						</select>
					
					</div>
                    </div>
            </div>
 
                <button class="nextBtn" name="Option" id="Update" value="Update">
                    <span class="btnText">Update  </span>
                    <i class="uil uil-navigator"></i>
                </button>
         
                 <button class="nextBtn" name="Option" id="Delete" value="Delete">
                    <span class="btnText">Delete  </span>
                    <i class="uil uil-navigator"></i>
                </button>
         
            </div> 
    </form>
</div>
  </div>
  
</body>
</html>