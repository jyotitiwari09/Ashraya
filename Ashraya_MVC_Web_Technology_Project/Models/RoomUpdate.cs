using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class RoomUpdate
    {
        public string Message { get; set; }
        public void Edit(String Price, String IDF, String Option)
        {
            if (Option == "Update")
            {
                SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
                SqlCommand Cmd = new SqlCommand("Update Room SET Price='" + Price + "' WHERE ID='" + IDF + "';", Con);
                Con.Open();
                Cmd.ExecuteNonQuery();
                Con.Close();
                Message = "Update";

                /*Fetch Email*/
                System.Data.SqlClient.SqlCommand Email = new System.Data.SqlClient.SqlCommand("  Select RT.Email From Room R,PG P,Registration_Table RT WHERE (RT.ID=P.Owner_ID) AND (RT.Role='Owner') AND(P.ID=R.PGID) AND (R.ID='" + IDF + "');", Con);
                Con.Open();
                string E = Email.ExecuteScalar().ToString();
                Con.Close();

                /*Date */
                DateTime aDate = DateTime.Now;

                //Sending Mail
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                client.EnableSsl = true;
                client.Credentials = credential;
                MailMessage message = new MailMessage("syaser327@outlook.com", E);
                message.Subject = "Room Updated From Ashraya";
                message.Body = "<table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
"<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
  "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
 "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
 "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
 " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>Room Updated on " + aDate.ToString("MM/dd/yyyy").ToString() + "</td>" +
    "</tr>" +
  "</tr>" +
"</thead>" +
" <tbody>" +
" </tbody>" +
"</table>";

                message.IsBodyHtml = true;
                try
                {
                    client.Send(message);

                }
                catch (SmtpException ex)
                {
                    //log exception or throw to upper layer as per your requirement
                }
                catch (Exception ex) //This will handle errors other than thrown feature other than SMTP
                {
                    //log exception or throw to upper layer as per your requirement
                }




            }
            if (Option == "Delete")
            {
                /*Check Room Bookings Before Deleting*/
                SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
                SqlCommand CheckRoom = new SqlCommand("Select Count(*) From Booking WHERE Room_ID = '"+IDF+"';", Con);
                Con.Open();
                int temp = Convert.ToInt32(CheckRoom.ExecuteScalar().ToString());
                Con.Close();
                if (temp == 1)
                {
                    Message = "CannotDeletex";  
                    //return;
                  

                }
                else
                {
                

                    /*Fetch Email*/
                    System.Data.SqlClient.SqlCommand Email = new System.Data.SqlClient.SqlCommand("Select RT.Email From Room R,PG P,Registration_Table RT WHERE (RT.ID=P.Owner_ID) AND (RT.Role='Owner') AND(P.ID=R.PGID) AND (R.ID='" + IDF + "');", Con);
                    Con.Open();
                    string E = Email.ExecuteScalar().ToString();
                    Con.Close();

                    /*Date */
                    DateTime aDate = DateTime.Now;

                    //Sending Mail
                    SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                    client.EnableSsl = true;
                    client.Credentials = credential;
                    MailMessage message = new MailMessage("syaser327@outlook.com", E);
                    message.Subject = "Account Updated From Ashraya";
                    message.Body = "<table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
     "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>Room Removed </td>" +
        "</tr>" +
      "</tr>" +
    "</thead>" +
   " <tbody>" +
   " </tbody>" +
  "</table>";

                    message.IsBodyHtml = true;
                    try
                    {
                        client.Send(message);

                    }
                    catch (SmtpException ex)
                    {
                        //log exception or throw to upper layer as per your requirement
                    }
                    catch (Exception ex) //This will handle errors other than thrown feature other than SMTP
                    {
                        //log exception or throw to upper layer as per your requirement
                    }

                    /*Room Delete*/
                    SqlCommand Cmd = new SqlCommand("Delete From Room WHERE ID='" + IDF + "';", Con);
                    Con.Open();
                    Cmd.ExecuteNonQuery();
                    Con.Close();
                    Message = "Delete";


                }
            }
        }
    }
}