<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Payment</title>
    <link href="../../../Contents/CSS3/Payment/logincss.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/Payment/payment.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
        System.Data.SqlClient.SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand("Select FirstName From Registration_Table Where ID ='" + Session["ID"].ToString() + "'", con);
        System.Data.SqlClient.SqlCommand cmd2 = new System.Data.SqlClient.SqlCommand("Select Email From Registration_Table Where ID ='" + Session["ID"].ToString() + "'", con);
        System.Data.SqlClient.SqlCommand cmd3 = new System.Data.SqlClient.SqlCommand("Select Address From Registration_Table Where ID ='" + Session["ID"].ToString() + "'", con);
        con.Open();
        FN.Value = cmd1.ExecuteScalar().ToString();
        EE.Value = cmd2.ExecuteScalar().ToString();
        Adds.Value = cmd3.ExecuteScalar().ToString();
        con.Close(); 
    }
    
</script>
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
            <label for="show-features">Owner</label>
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
  <div class="payment">

    <form runat="server" id='PaymentPage' name='PaymentPage' style="top: 34px;position: relative;">

        <div class="prow">

            <div class="pcol">

                <h3 class="ptitle">billing address</h3>

                <div class="inputBox">
                    <span>Full name :</span>
                    <input type="text" readonly="readonly" runat="server"  id="FN" name="FN">
                </div>
                <div class="inputBox">
                    <span>Email :</span>
                    <input type="email" readonly="readonly" runat="server"  id="EE" name="EE">
                </div>
                <div class="inputBox">
                    <span>Address :</span>
                    <input type="text" readonly="readonly" runat="server" id="Adds"  name="Adds">
                </div>
                <div class="inputBox">
                        <span>Country :</span>
                        <input type="text" Value="India" readonly="readonly">
                    </div>


            </div>

            <div class="pcol">

                <h3 class="title">payment</h3>

                <div class="inputBox">
                    <span>cards accepted :</span>
                    <img src="../../../Contents/Images/Payment/card_img.png">
                </div>
                <div class="inputBox">
                    <span>Name on card :</span>
                    <input type="text" placeholder="Enter Card Name" pattern="[A-Za-z]*" title="Alphabets Only" runat="server" id='CardName' name='CardName'  required="required">
                </div>
                <div class="inputBox">
                    <span>Credit card number :</span>
                    <input type="text" placeholder="Card Number" pattern="[0-9]{16}" title="Please Enter A 16 Digit Card Number" runat="server" id='CardNo' name='CardNo' maxlength="16" required="required">
                </div>
                <div class="inputBox">
                    <span>Expiry month :</span>
                    <asp:DropDownList id='ExpiryMonth' name='ExpiryMonth' runat="server" required="required" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September </asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>Expiry Year :</span>
                        <input type="number" placeholder="Year" min="2025" max="2040" runat="server" id='ExpiryYear' name='ExpiryYear' required="required">
                    </div>
                    <div class="inputBox">
                        <span>CVV :</span>
                        <input type="text" placeholder="CVV" pattern="[0-9]{3}" title="Enter 3 Didgit CVV Number" runat="server" id='CVV' name='CVV' required="required" maxlength="3">
                    </div>
                </div>

            </div>
    
        </div>

        <input type="submit" value="proceed to checkout" class="submit-btn">

    </form>

</div>
  </div>
  
</body>
</html>