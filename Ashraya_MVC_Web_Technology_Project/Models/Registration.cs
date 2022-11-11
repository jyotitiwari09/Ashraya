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
    public class Registration
    {
        public String Response1 { get; set; }
        public void Registrations(String FirstName, String LastName, String Phone, String Email, String gender, String Address, String DOB, String Username, String Password, String Role)
        {
            //Connection Establishment
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            //Check if Phone,Email and UserName Already Exists or Not
            SqlCommand Select_Phone = new SqlCommand("Select Count(Phone) From Registration_Table Where Phone='" + Phone + "';", Con);
            SqlCommand Select_Email = new SqlCommand("Select Count(Email) From Registration_Table Where Email='" + Email + "';", Con);
            SqlCommand Select_Username = new SqlCommand("Select Count(Username) From Registration_Table Where Username='" + Username + "';", Con);
            Con.Open();
            int temp1 = Convert.ToInt32(Select_Phone.ExecuteScalar().ToString());
            int temp2 = Convert.ToInt32(Select_Email.ExecuteScalar().ToString());
            int temp3 = Convert.ToInt32(Select_Username.ExecuteScalar().ToString());
            Con.Close();
            if (temp1 == 1)
            {
                Response1 = "Error1";
                return;
            }
            else if (temp2 == 1)
            {
                Response1 = "Error2";
                return;
            }
            else if (temp3 == 1)
            {
                Response1 = "Error3";
                return;
            }
            else
            {
                //On Successful of Validation ...........Details Are Entered into Database 
                SqlCommand Insert_Cmd = new SqlCommand("Insert Into Registration_Table Values('" + FirstName + "','" + LastName + "','" + Phone + "','" + Email + "','" + gender + "','" + Address + "','" + DOB + "','" + Username + "','" + Password + "',GETDATE(),'"+Role+"')", Con);
                Con.Open();
                Insert_Cmd.ExecuteNonQuery();
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
                    MailMessage message = new MailMessage("syaser327@outlook.com", Email);
                    message.Subject = "Registration Details Fom Ashraya";
                    message.Body =
             " <table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
      "  </tr>" +
            "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
        " <td colspan='3' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;font-size: initial;border-bottom: 1px solid #dddddd;'>Thank You For Choosing Us</td>" +
        "</tr>" +
           "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
        " <td colspan='3' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;font-size: initial;border-bottom: 1px solid #dddddd;'>Here are Your Registration Details</td>" +
        "</tr>" +
      "<tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
        "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>First Name</th>" +
        "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + FirstName + "</th>" +
       " </tr>" +
       " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
        "    <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Last Name</th>" +
        "    <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + LastName + "</th>" +
        "    </tr>" +
         "   <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
            "    <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Email</th>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + Email + "</th>" +
            "</tr>" +
          "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
             "   <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Phone No</th>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + Phone + "</th>" +
          "  </tr>" +
            "<tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Address</th>" +
                "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + Address + "</th>" +
            "</tr>" +
            "<tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Date Of Birth</th>" +
                "<th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + DOB + "</th>" +
            "</tr>" +
           " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Gender</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + gender + "</th>" +
           " </tr>" +
           " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;'>Username</th>" +
              "  <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00'>" + Username + "</th>" +
           " </tr>" +
           " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
             "   <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;'>Password</th>" +
             "   <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00'>" + Password + "</th>" +
            "</tr>" +
             " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
             "   <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;'>Role</th>" +
             "   <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00'>" + Role + "</th>" +
            "</tr>" +
      "</tr>" +
    "</thead>" +
   " <tbody>" +
   " </tbody>" +
  "</table>";


                    message.IsBodyHtml = true;
                    client.Send(message);
                    Response1 = "success";
                 }
                catch (Exception)
                {
                    Response1 = "successx";
                 }
            }
        }
    }
}