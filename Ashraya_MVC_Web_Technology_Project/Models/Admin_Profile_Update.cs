using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class Admin_Profile_Update
    {
        public string Msg { get; set; }
        public void AdminPassword(String ID, String AOP, String ANP)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            /*Fetching Password*/
          /*  SqlCommand Select_Password_Admin= new SqlCommand("Select Password FRom Registration_Table Where ID='"+ID.ToString()+"' AND Role='Admin';", Con);
            Con.Open();
            string Select_Password = Select_Password_Admin.ExecuteScalar().ToString();
            Con.Close();
           * */

            /*Check If  Old Password is Matching Or Not*/
            SqlCommand Select_Passwords = new SqlCommand(" Select Count(*) From Registration_Table Where ID='"+ID.ToString()+"' AND Password='"+AOP+"';", Con);
            Con.Open();
            int temp1 =Convert.ToInt32( Select_Passwords.ExecuteScalar().ToString());
            Con.Close();

        /*If Old Password is True Then*/
            if(temp1==1)
            {
                SqlCommand Check1 = new SqlCommand("Update Registration_Table SET Password='"+ANP+"' WHERE ID='" + ID.ToString() + "';", Con);
                Con.Open();
                Check1.ExecuteNonQuery();
                Con.Close();
                Msg = "Update";

                /*Fetch Email*/
                SqlCommand Email = new SqlCommand("Select Email From Registration_Table WHERE ID='" + ID + "';", Con);
                Con.Open();
                string EE = Email.ExecuteScalar().ToString();
                Con.Close();


                //Sending Mail
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                client.EnableSsl = true;
                client.Credentials = credential;
                MailMessage message = new MailMessage("syaser327@outlook.com", EE);
                message.Subject = "Account Updated From Ashraya";
                message.Body = "<table  style='font-family:Bahnschrift;border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
   " <thead style='background: linear-gradient(135deg,#eb5d5d,hsl(28, 100%, 50%, 0.537));color: #ffffff;text-align: left;font-weight: bold;'>" +
    "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
      "  </tr>" +
           " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;'>Your Account Has been Updated </td>" +
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


            }
            else
            {
                Msg = "UpdateFail";
            }

        }
    }
}
  
