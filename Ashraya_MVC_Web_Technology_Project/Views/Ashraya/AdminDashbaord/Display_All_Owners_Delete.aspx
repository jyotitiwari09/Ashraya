<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Display All Owners</title>
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/customer.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/customerbooking.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/logincss.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
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
    <script src="../../../Contents/Javascript/AdminDeleteCustomerAndOwner.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script runat="server">
    public string Message { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Message = ViewBag.Message;

        System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand Owner = new System.Data.SqlClient.SqlCommand("Select Count(*) From Registration_Table Where Role='Owner';", Con);
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
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select ID,FirstName,LastName,Email,Address,Date From Registration_Table WHERE Role='Owner';", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }

        }
        if (this.Message == "NoDelete")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "NoDeleteOwner();", true);
            return;
        }
        else if (this.Message == "Delete")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "Delete();", true);
        }
    }
</script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>
    <script src="../../../Contents/Javascript/AdminDeleteCustomerAndOwner.js"></script>
    <script src="../../../Contents/Javascript/NoData.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
        <div class="table_responsive" style="z-index:0;height: 341px;width: 100%;">
      <form runat="server" id='ADO' name='ADO'><!-- style="position: inherit;z-index: -1;margin-left: 4%;width: 91%;margin-top: 21%;">-->
      <asp:DataList ID="DataList1" runat="server">
          <ItemTemplate>

    <table>
      <thead>
        <tr>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Email</th>
          <th>Address</th>
          <th>Date of Registration</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="First Name"><%#Eval("FirstName") %></td>
          <td data-label="Last Name"><%#Eval("LastName") %></td>
          <td data-label="Email"><%#Eval("Email") %></td>
          <td data-label="Address"><%#Eval("Address") %></td>
          <td data-label="Date of Registration"><%#Eval("Date") %></td>
            <td>
            <span class="action_btn">
                <button type="submit"  style=" font-size: large;background-color: #00bcd4;color: white;border: 3px solid white;border-radius: 9px;padding: 7px;" value="<%#Eval("ID")%>" name='DeleteOwner' id='DeleteOwner'>Remove</button>
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
</body>
</html>
