<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Homepage</title>
    <link href="../../../Contents/CSS3/Homepage/StyleSheet1.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/Logins.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
        {
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select F.FullName,F.Opinion From Feedback F,Registration_Table RT Where(RT.Email=F.Email) AND (RT.Role='Customer'); ", con);
            //     cmd.CommandType = CommandType.TableDirect;
            con.Open();
            DataList1.DataSource = cmd.ExecuteReader();
            DataList1.DataBind();
            con.Close();
        }
    }
</script>
</head>
<body>
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
          <li><a href='<%= Url.Action("Signin", "Ashraya") %>'>Login</a></li>
        </ul>
      </div>
    </nav>
  </div>
     <div class="homee con" id="home">
    <div class="home-text">
        <h1>Find Your Next <br>Perfect Place To <br>Live.</h1>
        <a href='<%= Url.Action("Verifications", "Ashraya") %>' class="btn">Sign Up</a>
    </div>
  </div>
<div class="testimonials">
  <div class="inner">
    <h1>Testimonials</h1>
    <div class="border"></div>
          <div class="row">
     
              <asp:DataList ID="DataList1" runat="server">
                  <ItemTemplate>
      <div class="col">
        <div class="testimonial">
          
          <div class="name" style="border-bottom: solid;border-bottom-color: #00bcd4;border-bottom-width: 6px;"><%#Eval("FullName") %></div>
        

          <p><%#Eval("Opinion") %></p>
        </div>
      </div>
                      </ItemTemplate>
</asp:DataList>
    
    </div>
  </div>
</div>
<br />
</body>
</html>