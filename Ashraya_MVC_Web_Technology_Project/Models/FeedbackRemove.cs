using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class FeedbackRemove
    {
        public string Msg { get; set; }
        public void RemoveMsgs(String RemoveF)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
          
            /*Fetch EMail Based on Feedback ID*/
            SqlCommand CmdS = new SqlCommand("Select RT.Email From Registration_Table RT,Feedback F Where (RT.Email=F.Email) AND (F.Feedback_ID='" + RemoveF.ToString() + "');", Con);
            Con.Open();
            string temp = CmdS.ExecuteScalar().ToString();
            Con.Close();

            //Sending An Email
            try
            {
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                client.EnableSsl = true;
                client.Credentials = credential;
                MailMessage message = new MailMessage("syaser327@outlook.com", temp);
                message.Subject = "Feedback Deleted Fom Ashraya";
                message.Body =
                  "<table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
     "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>Feedback Removed</td>" +
        "</tr>" +
      "</tr>" +
    "</thead>" +
   " <tbody>" +
   " </tbody>" +
  "</table>";
                message.IsBodyHtml = true;
                client.Send(message);
                // Res1 = "success";
                // return Content(FirstName,LastName,Phone, Email, gender, Address,DOB,Username,Password,CPassword);
            }
            catch (Exception)
            {
                //Res1 = "successx";
            }

            SqlCommand Cmd = new SqlCommand("Delete From Feedback Where Feedback_ID='" + RemoveF.ToString() + "'", Con);
            Con.Open();
            Cmd.ExecuteNonQuery();
            Con.Close();
            Msg = "DeletedSuccessfully";

        }
    }
}