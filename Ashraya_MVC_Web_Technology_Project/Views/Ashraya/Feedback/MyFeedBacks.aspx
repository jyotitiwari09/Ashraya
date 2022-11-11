<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>My Feedbacks</title>

    <link href="../../../Contents/CSS3/MyFeedback/customer.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/MyFeedback/customerbooking.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/MyFeedback/logincss.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    //
    public string email { get; set; }
    public string Msg { get; set; } 

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand Email= new System.Data.SqlClient.SqlCommand("Select Email From Registration_Table  Where ID='"+Session["ID"].ToString() +"';", Con);
        Con.Open();
        string E = Email.ExecuteScalar().ToString();
        Con.Close();


        System.Data.SqlClient.SqlCommand Feedback = new System.Data.SqlClient.SqlCommand("Select Count(F.Feedback_ID) From Feedback F,Registration_Table R  Where (R.Email=F.Email) AND (F.Email='"+E.ToString()+"');", Con);
        Con.Open();
        int COunt_Feedback = Convert.ToInt32(Feedback.ExecuteScalar().ToString());
        Con.Close();
        
        if (COunt_Feedback == 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " Empty();", true);
        }
        else if (!IsPostBack)
        {
            /*Getting Email From ID*/
            System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            System.Data.SqlClient.SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand("Select Email from Registration_Table Where ID = '"+Session["ID"].ToString() +"'",con1); 
            con1.Open();
            email = cmd1.ExecuteScalar().ToString();
            con1.Close();
            
            
             using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select Feedback_ID,FullName,Email,Opinion,Date from Feedback Where Email='" + email.ToString() + "';", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }
            
            this.Msg = ViewBag.Msg;
            if (this.Msg == "DeletedSuccessfully")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "RemoveFeedback();", true);
             }

        }
    }
</script>
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
      <form runat="server" id='FeedbackRemoving' name='FeedbackRemoving'>
            <asp:DataList ID="DataList1" runat="server">
          <ItemTemplate>
     <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Message</th>
          <th>Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td data-label="Name"><%#Eval("FullName")%></td>
          <td data-label="Email"><%#Eval("Email") %></td>
          <td data-label="Message"><%#Eval("Opinion") %></td>
          <td data-label="Date"><%#Eval("Date") %></td>
          <td data-label="Action">
            <span class="action_btn">
              <button type="submit" style=" font-size: large;background-color: #00bcd4;color: white;border: 3px solid white;border-radius: 9px;padding: 7px;"  id='RemoveF' name='RemoveF' runat="server" value='<%#Eval("Feedback_ID") %>'>Remove</button>
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
