﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class Admin_Delete_Feedbacks
    {
        public string Messagexxx { get; set; }
        public void DFeedback(String DeleteFeedback)
        {
            /*Informing User Via Email*/
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand FetchCustomerCMD = new SqlCommand("Select Email From Feedback Where Feedback_ID ='" + DeleteFeedback + "';", Con);
            Con.Open();
            string S = FetchCustomerCMD.ExecuteScalar().ToString();
            Con.Close();


            //Sending Mail
            SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
            client.Port = 587;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
            client.EnableSsl = true;
            client.Credentials = credential;
            MailMessage message = new MailMessage("syaser327@outlook.com", S);
            message.Subject = "Feedback Removed By Admin";
            message.Body = "<table  style='font-family:Bahnschrift;border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
" <thead style='background: linear-gradient(135deg,#eb5d5d,hsl(28, 100%, 50%, 0.537));color: #ffffff;text-align: left;font-weight: bold;'>" +
"    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
 "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
  "  </tr>" +
       " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
 " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: red;'>Your Feedback Was Offensive</td>" +
    "</tr>" +
"</thead>" +
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

            /*Deleting  Data in Database*/
            SqlCommand DeleteCustomerCMD = new SqlCommand("Delete From Feedback Where Feedback_ID ='" + DeleteFeedback + "';", Con);
            Con.Open();
            DeleteCustomerCMD.ExecuteNonQuery();
            Con.Close();
            Messagexxx = "Delete";
        }
    }
}