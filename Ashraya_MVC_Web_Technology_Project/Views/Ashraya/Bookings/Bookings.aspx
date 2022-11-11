<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Booking</title>
    <link href="../../../Contents/CSS3/Bookings/customerroombooking.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/Bookings/logincss.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.2.min.js"></script>

    <script runat="server">
     protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString))
            {
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("Select R.ID,R.Img1,R.Img2,R.Img3,P.Img1 AS PImg1,P.Img2 AS PImg2,P.Img3 AS PImg3,R.Television,R.AC,R.Refridgerator From Room R,PG P Where (P.ID=R.PGID) AND (R.ID='" + Session["RoomSelect"].ToString() + "');", con);
                //     cmd.CommandType = CommandType.TableDirect;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }

        }
      }
    </script>
<script src="../../../Contents/Javascript/Booking.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body onload="Confirm();">
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
  <div class="register" style="z-index: -1;">
    <header>Book Room</header>

    <form runat="server" name='BookPG' id='BookPG' onsubmit="return HJ();">
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
        <div class="form first">
            <div class="details personal">
                <span class="title">Room Images</span>

                <div class="fields">
                    <div class="input-field">
                        <!-- <label>Room Id</label> -->
                        <img src="../../../Contents/Images/Rooms/<%#Eval("Img1")%>" style="height: 150px; width: 150px;"/>
                    </div>
                    <div class="input-field">
                        <!-- <label>Room Id</label> -->
                        <img src="../../../Contents/Images/Rooms/<%#Eval("Img2")%>" style="height: 150px; width: 150px;"/>
                    </div>
                    <div class="input-field">
                        <!-- <label>Room Id</label> -->
                        <img src="../../../Contents/Images/Rooms/<%#Eval("Img3")%>" style="height: 150px; width: 150px;"/>
                    </div>
              </div>
            </div>
            <br /><br />
            <div class="details personal">
                <span class="title">PG Images</span>

                <div class="fields">
                    <div class="input-field">
                        <!-- <label>Room Id</label> -->
                        <img  src="../../../Contents/Images/PG/<%#Eval("Img1")%>" style="height: 150px; width: 150px;">
                    </div>
                    <div class="input-field">
                        <!-- <label>Room Id</label> -->
                        <img  src="../../../Contents/Images/PG/<%#Eval("Img2")%>" style="height: 150px; width: 150px;">
                    </div>
                    <div class="input-field">
                        <!-- <label>Room Id</label> -->
                        <img  src="../../../Contents/Images/PG/<%#Eval("Img3")%>" style="height: 150px; width: 150px;">
                    </div>
               </div>
            </div>
            <br /><br>
            <div class="details ID">
                
                <span class="title">Facilities Available</span>
                <div class="fields">
                   <table>
                       <tr>
                           <th>AC</th>
                           <th>Refridgerator</th>
                           <th>TV</th>
                       </tr>
                       <tr>
                           <td><%#Eval("AC")%></td>
                           <td><%#Eval("Refridgerator")%></td>
                           <td><%#Eval("Television")%></td>
                       </tr>
                   </table>
                </div>
                <br /><br />
              
                 <br /><br /> 
                <button type="submit" value="<%#Eval("ID")%>"  name='TransferX' id='TransferX' style="border: 3px solid #7d2ae8;background-color: #7d2ae8;color: white;border-radius: 82px;font-size: 15px;">Book</button>
               </div> 
        </div>
                  </ItemTemplate>
                </asp:DataList>
        <span class="title">Booking Details</span>
                <div class="fields" id="XS" syle="top: 1185px;">
                    

                    <div class="input-field">
                        <label>Check-in</label>
                        <input type="date"  runat="server" name='CheckInDate' id='CheckInDate' required="required">
                    </div>

                    <div class="input-field">
                        <label>check-out</label>
                        <input type="date" runat="server" name='CheckOutDate' id='CheckOutDate' required="required">
                    </div>

                    <div class="input-field">
                        <label>No of People</label>
                        <input type="number" name='People' id='People' min="1" max="6" runat="server" required="required">
                    </div>
                </div>
    </form>
</div>
  </div>
  
</body>
</html>