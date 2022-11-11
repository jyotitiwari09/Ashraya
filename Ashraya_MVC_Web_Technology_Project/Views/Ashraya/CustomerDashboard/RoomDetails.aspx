<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Room Details</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link href="../../../Contents/CSS3/CustomerProfile/logincss%20(1).css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/CustomerDashboard/customer.css" rel="stylesheet" />
    <link href="../../../Contents/CSS3/CustomerDashboard/RoomDetails.css" rel="stylesheet" />
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
        <form runat="server" id='RoomBookPage' name='RoomBookPage'>
              <div class="house">
             <div class="house-img">
                 <img src="edphil.jpg" >
             </div>
             <div class="house-info">
                <p>private villa</p> 
                <h3>deulux room</h3>
                <p>1bedroom/1bathroom/</p>
                <div class="house-price">
                    <p>guest</p>
                    <h4>200<span>/day</span></h4>
                    <input type="date" />
                    <input type="date" />
                    <input type="text" />
                </div>
                <div class="book">
                    <input type="submit" value="Book" class="bn3" name='Transfer' id='Transfer'/>        
                </div>
             </div>
         </div>
     </form>
    </body>
    </html>