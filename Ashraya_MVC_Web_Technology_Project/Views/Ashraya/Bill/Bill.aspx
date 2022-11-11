<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html>
<html>
<head>
	<title>Invoice</title>
    <link href="../../../Contents/CSS3/Bill/bill.css" rel="stylesheet" />
   <script runat="server">
       protected void Page_Load(object sender, EventArgs e)
       {
           /*Connection Establishment*/
           System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);

           /*Select ALL Columns To Store In */
           /*Customer Data*/
           System.Data.SqlClient.SqlCommand Name = new System.Data.SqlClient.SqlCommand("Select FirstName From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
           System.Data.SqlClient.SqlCommand Address = new System.Data.SqlClient.SqlCommand("Select Address From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
           System.Data.SqlClient.SqlCommand Phone = new System.Data.SqlClient.SqlCommand("Select Phone From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
           System.Data.SqlClient.SqlCommand Email= new System.Data.SqlClient.SqlCommand("Select Email From Registration_Table WHERE ID='" + Session["ID"].ToString() + "';", Con);
           
           /*PG Data*///pgname,location,roomtype,price,totalpeople
           System.Data.SqlClient.SqlCommand PGName = new System.Data.SqlClient.SqlCommand("Select P.Name From PG P,Room R,Booking B WHERE (P.ID=R.PGID) AND (B.Room_ID=R.ID) AND (R.ID='" + Session["RoomSelect"].ToString() + "');", Con);
           System.Data.SqlClient.SqlCommand PGLocation = new System.Data.SqlClient.SqlCommand("Select P.Location From PG P,Room R,Booking B WHERE (P.ID=R.PGID) AND (B.Room_ID=R.ID) AND (R.ID='" + Session["RoomSelect"].ToString() + "');", Con);

           /*Room Data*/
           System.Data.SqlClient.SqlCommand RoomType = new System.Data.SqlClient.SqlCommand("Select RoomType From Room Where ID='" + Session["RoomSelect"] .ToString()+ "';", Con);
           System.Data.SqlClient.SqlCommand RoomPrice = new System.Data.SqlClient.SqlCommand("Select Price From Room Where ID='" + Session["RoomSelect"].ToString() + "';", Con);

           /*Book Table Data*/
           System.Data.SqlClient.SqlCommand RoomPeople = new System.Data.SqlClient.SqlCommand("Select No_Of_People From Booking Where Room_ID='" + Session["RoomSelect"].ToString() + "';", Con);

           Con.Open();
           string data = Email.ExecuteScalar().ToString();
           CName.InnerText = Name.ExecuteScalar().ToString();
           ph.InnerText = Phone.ExecuteScalar().ToString();
           pri.InnerText = RoomPrice.ExecuteScalar().ToString();
           pl.InnerText = PGLocation.ExecuteScalar().ToString();
           pn.InnerText = PGName.ExecuteScalar().ToString();
           rt.InnerText = RoomType.ExecuteScalar().ToString();
           rp.InnerText = RoomPrice.ExecuteScalar().ToString();
           tp.InnerText = RoomPeople.ExecuteScalar().ToString();
           rpp.InnerText = RoomPrice.ExecuteScalar().ToString();
           rppp.InnerText = RoomPrice.ExecuteScalar().ToString();
           Con.Close();

           /*Date Of Booking*/
           DateTime aDate = DateTime.Now;
           DateToday.InnerText= aDate.ToString("MM/dd/yyyy");  
           
           /*Send Mail After Successful Booking*/
                 //Sending An Email
                try
                {
                    System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient("smtp-mail.outlook.com");
                    client.Port = 587;
                    client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                    client.EnableSsl = true;
                    client.Credentials = credential;
                    System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage("syaser327@outlook.com", data); 
                    message.Subject = "Booking Details Fom Ashraya";
                   message.Body ="<table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
      "  </tr>" +
            "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
        " <td colspan='3' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;font-size: initial;border-bottom: 1px solid #dddddd;'>Thank You For Choosing Us</td>" +
        "</tr>" +
           "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
        " <td colspan='3' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;font-size: initial;border-bottom: 1px solid #dddddd;'>Here are Your Booking Details</td>" +
        "</tr>" +
		   "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>"+aDate.ToString()+"</td>" +
        "</tr>" +
      "<tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
        "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Name</th>" +
        "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + CName.InnerText + "</th>" +
       " </tr>" +
       " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
        "    <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Phone</th>" +
        "    <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + ph.InnerText + "</th>" +
        "    </tr>" +
         "   <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
            "    <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Price</th>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + pri.InnerText + "</th>" +
            "</tr>" +
          "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
             "   <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Location</th>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + pl.InnerText + "</th>" +
          "  </tr>" +
            "<tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>PG Name</th>" +
                "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + pn.InnerText + "</th>" +
            "</tr>" +
            "<tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Room Type</th>" +
                "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + rt.InnerText + "</th>" +
            "</tr>" +
           " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>People</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + tp.InnerText + "</th>" +
           " </tr>" +
          "</tr>" +
    "</thead>" +
   " <tbody>" +
   " </tbody>" +
  "</table>";
                   message.IsBodyHtml = true;
                   client.Send(message);
                   // return Content(FirstName,LastName,Phone, Email, gender, Address,DOB,Username,Password,CPassword);
                }
                catch (Exception)
                {
                 
                }
           
           
       }
</script>
    <script src="../../../Contents/Javascript/pdfmake.min.js"></script>
    <script src="../../../Contents/Javascript/html2canvas.min.js"></script>
    <script src="../../../Contents/Javascript/Export.js"></script>
</head>
<body>

<div class="wrapper" >
    <input type="button" value="Export as PDF" onclick="Export();" id="x" />
    <a href='<%= Url.Action("Dashboard_Customer", "Ashraya") %>' style="color: #7d2ae8;
    border: 3px solid #7d2ae8;background: white;font-size: 9px;position: relative;top: -10px;font-size: medium;font-family: monospace;width: 115px;border-radius: 6px;text-decoration:none;">Back To Dashboard</a>
	<div class="invoice_wrapper" id="R">
		<div class="header">
			<div class="logo_invoice_wrap">
				<div class="logo_sec">
					<img src="../../../Contents/Images/Bill/logo.png" alt="code logo">
					<div class="title_wrap">
						<p class="title bold">ASHRAYA</p>
						<p class="sub_title">Privite Limited</p>
					</div>
				</div>
				<div class="invoice_sec">
					<p class="invoice bold">INVOICE</p>
					<p class="invoice_no">
						<span class="bold">Invoice</span>
					
					</p>
					<p class="date">
						<span class="bold">Date</span>
						<span id="DateToday" runat="server"></span>
					</p>
				</div>
			</div>
			<div class="bill_total_wrap">
				<div class="bill_sec">
					<p>Bill To</p> 
	          		<p class="bold name" id="CName" name="CName" runat="server"></p>
			        <span id="ph" name="ph" runat="server">
			           <br/>
			          </span>
				</div>
				<div class="total_wrap">
					<p>Total Due</p>
	          		<p class="bold price" id="pri" name="pri" runat="server"></p>
				</div>
			</div>
		</div>
		<div class="body">
			<div class="main_table">
				<div class="table_header">
					<div class="row">
						<div class="col col_des">PG</div>
                        <div class="col col_des">Room Type</div>
						<div class="col col_price">PRICE</div>
						<div class="col col_qty">TOTAL PEOPLE</div>
						<div class="col col_total">TOTAL</div>
					</div>
				</div>
				<div class="table_body">
					<div class="row">
					<div class="col col_des">
							<p class="bold" id="pl" name="pl" runat="server">betul</p>
							<p id="pn" name="pn" runat="server"></p>
						</div>
                        <div class="col col_price">
							<p name="rt" id="rt" runat="server"></p>
						</div>
						<div class="col col_price">
							<p name="rp" id="rp" runat="server"></p>
						</div>
						<div class="col col_qty">
							<p name="tp" id="tp" runat="server"></p>
						</div>
						<div class="col col_total">
							<p name="rpp" id="rpp" runat="server"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="paymethod_grandtotal_wrap">
				<div class="paymethod_sec">
					<p class="bold">Payment Method</p>
					<p>Visa, master Card and We accept Cheque</p>
				</div>
				<div class="grandtotal_sec">
			       	<p class="bold">
			            <span>Grand Total</span>
			            <span name="rppp" id="rppp" runat="server"></span>
			        </p>
				</div>
			</div>
		</div>
		<div class="footer">
			<p>Thank you and Best Wishes</p>
			<div class="terms">
		        <p class="tc bold">Terms & Coditions</p>
		        <p>no drill work allowed plz keep silent.in case of damages to bed u are liable to buy a new one<br>use protection at all time(helmet)kitni tarak hai be</p>
		    </div>
		</div>
	</div>
</div>


</body>
</html>