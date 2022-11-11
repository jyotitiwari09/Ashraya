<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Verification</title>
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/customer.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/customerbooking.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/AdminDashboard/DisplayAllUsers/logincss.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    public string Message { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
            /*Deleting Data From Database*/
            System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand CMD1 = new System.Data.SqlClient.SqlCommand("Select Count(*) From VerificationTable;", Con);
            Con.Open();
            int temp = Convert.ToInt32(CMD1.ExecuteScalar().ToString());
            Con.Close();
            if (temp == 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " Empty();", true);
            }
            else if (Message == "Delete")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " Deleted();", true);
            }
            else if (!IsPostBack)
            {

                using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select VID,Email,FileUpload,VerificationStatus,Date from VerificationTable;", con);
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
        <div class="table_responsive" style="z-index: 0;height:400px;">
      <form runat="server" id='ACV' name='ACV'><!-- style="position: inherit;z-index: -1;margin-left: 4%;width: 91%;margin-top: 21%;">-->
      <asp:DataList ID="DataList1" runat="server">
          <ItemTemplate>

    <table style="z-index: -1;">
      <thead>
        <tr>
          <th>Email</th>
          <th>Verification Status</th>
           <th>Date of Registration</th>
           <th>Documents</th>
           <th>Delete Row</th>
          </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="Email"><%#Eval("Email") %></td>
          <td data-label="Verification Status"><%#Eval("VerificationStatus") %></td>
           <td data-label="Date of Registration"><%#Eval("Date") %></td>
            <td data-label="axtion">
            <span class="action_btn">
           		<a href="../../../Contents/Uploads/<%#Eval("FileUpload")%>" download="Ashraya_Verification_Document">Download</a>
                </span>
               </td>
            <td>
                   <span class="action_btn">
         <button style="text-decoration: none;
    color: #444;background: #fff;
    border: 1px solid red;
    display: inline-block;
    padding: 7px 20px;
    font-weight: bold;
    border-radius: 3px;
    transition: 0.3s ease-in-out;
" value='<%#Eval("VID") %>' type="submit" name='DeleteVVV' id='DeleteVVV'>Delete</button>
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
