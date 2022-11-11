using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class Contacts
    {
        public String Res1 { get; set; }
        public void Contactus(String Name, String Email, String Msg)
        {
            bool a = string.IsNullOrEmpty(Name), b = string.IsNullOrEmpty(Email), c = string.IsNullOrEmpty(Msg);
            if (a == true || b == true || c == true)
            {
                 return;
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString2"].ConnectionString);
                SqlCommand cmd = new SqlCommand("Insert Into Contactus Values('" + Name + "','" + Email + "','" + Msg + "',GETDATE())", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();



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
                    MailMessage message = new MailMessage("syaser327@outlook.com", Email); 
                    message.Subject = "Contact Us Details Fom Ashraya";
                   message.Body =
                        // "Name    :" + FirstName + "<br>" +
           "<table  style='font-family:Bahnschrift;border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
   " <thead style='background: linear-gradient(135deg,#eb5d5d,hsl(28, 100%, 50%, 0.537));color: #ffffff;text-align: left;font-weight: bold;'>" +
    "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
      "  </tr>" +
     " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "  <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Name</th>" +
       " <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;color: #ffef00'>" + Name + "</th>" +
        "</tr>" +
         "   <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
          "      <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Email</th>" +
           "     <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;color: #ffef00'>" + Email + "</th>" +
           " </tr>" +
           " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
            "    <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Message</th>" +
             "   <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;color: #ffef00'>" + Msg + "</th>" +
            "</tr>" +
            " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
            "    <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>To Know More Click Here</th>" +
             "   <th colspan='2' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;color: #ffef00'>" + "https://bookmypg.co.in/" + "</th>" +
            "</tr>" +
    "</thead>" +
  "</table>";
                   message.IsBodyHtml = true;
                   client.Send(message);
                    Res1 = "success";
                    // return Content(FirstName,LastName,Phone, Email, gender, Address,DOB,Username,Password,CPassword);
                 }
                catch (Exception)
                {
                    Res1 = "successx";
                 }
}
        }

    }
}