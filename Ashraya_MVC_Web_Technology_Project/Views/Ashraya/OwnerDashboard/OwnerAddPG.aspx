<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Add PG</title>
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
    <script src="../../../Contents/Javascript/AddPG.js"></script>
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
    <header>Add PG</header>

    <form  runat="server" id="PGAdd" name="PGAdd" >
        <div class="form first">
            <div class="details personal">
                <span class="title">PG Details</span>

                <div class="fields">
                    <div class="input-field">
                        <label>PG Name</label>
                        <input type="text" runat="server" placeholder="Enter your PG name" required="required" name="PGName" id="PGName">
                    </div>
                    <div class="input-field">
                        <label>Location</label>
                        <input type="text"  placeholder="Enter PG location" required="required" runat="server" name="PGLocation" id="PGLocation">
                    </div>

                    <div class="input-field">
                        <label>Zip-Code</label>
                        <input type="text" placeholder="Enter zip-code" required="required" runat="server" name="PGZip" id="PGZip" pattern="[0-9]{6}" title="Enter 6 Digit Zip Code">
                    </div>

                   
                </div>
            </div>

            <div class="details ID">
                <span class="title">Add Images</span>
                <div class="fields">
                    

                    <div class="input-field">
                        <label>Image 1</label>
                        <img style="height:100px;width:100px;border: 3px inset #ce4007;" id="pic1" />
                        <input type="file" accept="image/*" oninput="pic1.src=window.URL.createObjectURL(this.files[0])" required="required" runat="server" name="Img1P" id="Img1P">
                    </div>

                    <div class="input-field">
                        <label>Image 2</label>
                        <img style="height:100px;width:100px;border: 3px inset #ce4007;" id="pic2" />
                        <input type="file" accept="image/*" oninput="pic2.src=window.URL.createObjectURL(this.files[0])"  required="required" runat="server" name="Img2P" id="Img2P">
                    </div>

                    <div class="input-field">
                        <label>Image 3</label>
                      <img style="height:100px;width:100px;border: 3px inset #ce4007;" id="pic3" />
                        <input type="file" accept="image/*" oninput="pic3.src=window.URL.createObjectURL(this.files[0])" required="required" runat="server" name="Img3P" id="Img3P">
                    </div>
                </div>

                <button class="nextBtn">
                    <span class="btnText">ADD PG +</span>
                    <i class="uil uil-navigator"></i>
                </button>
            </div> 
        </div>
    </form>
</div>
  </div>
  
</body>
</html>