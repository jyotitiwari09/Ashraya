<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Add Room</title>
    <link href="../../../Contents/CSS3/OwnerDashboard/democustprofile.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/OwnerDashboard/logincss.css" rel="stylesheet" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script runat="server">
        protected String Message { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            /*For Login*/
            this.Message = ViewBag.Message;
             if (this.Message == "Done")
             {
                 Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Success();", true);
             }
            
        }
        </script>
    <script src="../../../Contents/Javascript/AddRoom.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
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
  <div class="register" style="z-index:-1;">
    <header>Add Room</header>

    <form runat="server" name="RoomAdd" id="RoomAdd" >
        <div class="form first">
            <div class="details personal">
                <span class="title">Room Details</span>

                <div class="fields">
                   <div class="input-field">
                        <label>Price</label>
                        <input type="text" placeholder="Enter Price" pattern="[0-9]{1,5}" title="Enter the Price" runat="server" required="required" name="Price" id="Price">
                    </div>
					  <div class="input-field">
                        <label>Room Types</label>
						<select id="RoomType" name="RoomType" runat="server" required="required">
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
                    <div class="input-field">
                        <label>Select PG</label>
                        <asp:DropDownList ID="select" name="select" runat="server" required="required" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AshrayaConnectionString %>' SelectCommand="SELECT * FROM [PG] WHERE ([Owner_ID] = @Owner_ID)">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="ID" DefaultValue="17044" Name="Owner_ID" Type="Int32"></asp:SessionParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    </div>
            </div>

            <div class="details ID">
                <span class="title">Add Images</span>
                <div class="fields">
                    <div class="input-field">
                        <label>Image 1</label>
                        <img style="height:100px;width:100px;border: 3px inset #ce4007;" id="pic1" />
                        <input type="file" accept="image/*" oninput="pic1.src=window.URL.createObjectURL(this.files[0])" required="required" runat="server" name="Img1" id="Img1">
                    </div>

                    <div class="input-field">
                        <label>Image 2</label>
                        <img style="height:100px;width:100px;border: 3px inset #ce4007;" id="pic2" />
                        <input type="file" accept="image/*" oninput="pic2.src=window.URL.createObjectURL(this.files[0])" required="required" runat="server" name="Img2" id="Img2">
                    </div>

                    <div class="input-field">
                        <label>Image 3</label>
                        <img style="height:100px;width:100px;border: 3px inset #ce4007;" id="pic3" />
                        <input type="file" accept="image/*" oninput="pic3.src=window.URL.createObjectURL(this.files[0])" required="required" runat="server" name="Img3" id="Img3">
                    </div>
					
                </div>
                <span class="title">Facilities</span>
                <div class="fields">
                    <div class="facilities">
                        <label>Television</label>
                        <input type="checkbox" value="YES" runat="server" id="Television" name="Television">
                    </div>

                    <div class="facilities">
                        <label>Refridgerator</label>
                        <input type="checkbox" value="YES" runat="server" name="Refridgerator" id="Refridgerator">
                    </div>

                    <div class="facilities">
                        <label>AC</label>
                        <input type="checkbox" value="YES" runat="server" name="AC" id="AC">
                    </div>
                  
                <button class="nextBtn">
                    <span class="btnText">Add Room + </span>
                    <i class="uil uil-navigator"></i>
                </button>
            </div> 
        </div>
    </form>
</div>
  </div>
  
</body>
</html>
