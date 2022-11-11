<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Profile Update</title>
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerProfile/democustprofile.css">
  <!-- <link rel="stylesheet" href="customer.css"> -->
  <link rel="stylesheet" href="../../../Contents/CSS3/CustomerProfile/logincss.css">
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script runat="server">
        public string SelectFirstName { get; set; }
        public string SelectLastName { get; set; }
        public string SelectDOB { get; set; }
        public string SelectEmail { get; set; }
        public string SelectMob { get; set; }
        public string SelectGender { get; set; }
        public string SelectUsername { get; set; }
        public string SelectPassword { get; set; }
        public string SelectCPassword { get; set; }
        public string SelectAddress { get; set; }
        public string Message { get; set; }
        public string IDStore { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IDStore = ViewBag.IDStore;
            
            /*Connection Establishment*/
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            
            /*Select ALL Columns To Store In */
            System.Data.SqlClient.SqlCommand FirstNameCmd = new System.Data.SqlClient.SqlCommand("Select FirstName From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand LastNameCmd = new System.Data.SqlClient.SqlCommand("Select LastName From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand DOBCmd = new System.Data.SqlClient.SqlCommand("Select DOB From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand EmailCmd = new System.Data.SqlClient.SqlCommand("Select Email From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand MobCmd = new System.Data.SqlClient.SqlCommand("Select Phone From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand GenderCmd = new System.Data.SqlClient.SqlCommand("Select Gender From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand UsernameCmd = new System.Data.SqlClient.SqlCommand("Select Username From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand PasswordCmd = new System.Data.SqlClient.SqlCommand("Select Password From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            //System.Data.SqlClient.SqlCommand CPasswordCmd = new System.Data.SqlClient.SqlCommand("Select CPassword From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
            System.Data.SqlClient.SqlCommand AddressCmd = new System.Data.SqlClient.SqlCommand("Select Address From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);

            
            
            /*Execute */
            Con.Open();
            SelectFirstName = FirstNameCmd.ExecuteScalar().ToString();
            SelectLastName = LastNameCmd.ExecuteScalar().ToString();
            SelectDOB = DOBCmd.ExecuteScalar().ToString();
            SelectEmail = EmailCmd.ExecuteScalar().ToString();
            SelectMob = MobCmd.ExecuteScalar().ToString();
            SelectGender = GenderCmd.ExecuteScalar().ToString();
            SelectUsername = UsernameCmd.ExecuteScalar().ToString();
            SelectPassword = PasswordCmd.ExecuteScalar().ToString();
            SelectAddress = AddressCmd.ExecuteScalar().ToString();
            Con.Close();
            fn.Value = SelectFirstName;
            ln.Value = SelectLastName;
            dobupt.Value = SelectDOB;
            mail_u.Value = SelectEmail;
            mob.Value = SelectMob;
            Gender.Value = SelectGender;
            username_u.Value = SelectUsername;
            pass_u.Value = SelectPassword;
            cpass_u.Value = SelectPassword;
            add_u.Value = SelectAddress;
            
            /*Pop Up Box Call*/
            this.Message = ViewBag.Message;
            if (this.Message == "Update")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Update();", true);
            }
            else if (this.Message == "PassNoMatch")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PassFail();", true);
            }
        }
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/UpdateRegistration.js"></script>
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
    <header>My Profile</header>

    <form runat="server" id='updateowner' name='updateowner' style="overflow-y:scroll;">
        <div class="form first">
            <div class="details personal">
                <span class="title">Personal Details</span>

                <div class="fields">
                    <div class="input-field">
                        <label>First Name</label>
                        <input type="text" id='fn' name='fn' readonly="readonly" placeholder="Enter your first name" runat="server" required="required" >
                    </div>
                    <div class="input-field">
                        <label>Last Name</label>
                        <input type="text" id='ln' name='ln' readonly="readonly" placeholder="Enter your first name" runat="server" required="required">
                    </div>

                    <div class="input-field">
                        <label>Date of Birth</label>
                        <input type="date" runat="server" readonly="readonly"  id='dobupt' name='dobupt' placeholder="Enter birth date" required="required">
                    </div>

                    <div class="input-field">
                        <label>Email</label>
                        <input type="email" runat="server" readonly="readonly" id='mail_u' name='mail_u' placeholder="Enter your email" required="required">
                    </div>

                    <div class="input-field">
                        <label>Mobile Number</label>
                        <input type="text" runat="server" readonly="readonly"  maxlength ="10" id='mob' name='mob' placeholder='Phone '  pattern="[0-9]{10}" title="Please Enter 10 Digit Mobile Number" required="required" >
                    </div>

                    <div class="input-field">
                        <label>Gender</label>
                        <input type="text"  ID="Gender" name='Gender' readonly="readonly"  placeholder="Gender" runat="server" required="required">
                    </div>

                   
                </div>
            </div>

            <div class="details ID">

                <div class="fields">
                    <div class="input-field">
                        <label>Username</label>
                        <input type="text" id='username_u' readonly="readonly" name='username_u' placeholder="Enter username" runat="server" required="required">
                    </div>

                    <div class="input-field">
                        <label>Password</label>
                        <input type="text" id='pass_u'  name='pass_u' placeholder="Enter Password" required="required" runat="server"  pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_-])(?=.*[^\da-zA-Z]).{8,15}$" title="Use 8 to 15 characters with a mix of letters, numbers & symbols"  maxlength="15">
                    </div>

                    <div class="input-field">
                        <label>Confirm Password</label>
                        <input type="text" id='cpass_u' name='cpass_u' placeholder="Re-enter password" runat="server" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*?_-])(?=.*[^\da-zA-Z]).{8,15}$" title="Use 8 to 15 characters with a mix of letters, numbers & symbols" maxlength="15" required="required">
                    </div>

                    <div class="input-field">
                        <label>Address</label>
                        <input type="text" id='add_u' name='add_u' placeholder="Address" required="required" runat="server">
                    </div>
                </div>

                <button class="nextBtn" name="Option" id="Update" value="Update">
                    <span class="btnText" >Update</span>
                    <i class="uil uil-navigator"></i>
                </button>
           
            </div> 
        </div>
    </form>
</div>
  </div>
  
</body>
</html>