using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class ForgetPassword
    {
        public string Data { get; set; }
        public String RandomPassword { get; set; }
        public void New_password(String PasswordX)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand Email = new SqlCommand("Select Count(Email) From Registration_Table Where Email='" + PasswordX + "';", Con);
            Con.Open();
            int temp = Convert.ToInt32(Email.ExecuteScalar().ToString());
            Con.Close();
            if (temp == 1)
            {
                /*Generating Random Password*/
                /*Calling the Function*/
               //Updating User's Password

                RandomPassword = CreateRandomPassword().ToString();

                SqlCommand Update = new SqlCommand("Update Registration_Table SET Password='" + RandomPassword.ToString() + "'  Where Email='" + PasswordX + "';", Con);
                Con.Open();
                Update.ExecuteNonQuery();
                Con.Close();

                //Sending Mail
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                client.EnableSsl = true;
                client.Credentials = credential;
                MailMessage message = new MailMessage("syaser327@outlook.com", PasswordX);
                message.Subject = "New Generated Password For Your Mail";
                message.Body = "<table  style='font-family:Bahnschrift;border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
   " <thead style='background: linear-gradient(135deg,#eb5d5d,hsl(28, 100%, 50%, 0.537));color: #ffffff;text-align: left;font-weight: bold;'>" +
    "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
      "  </tr>" +
     " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "  <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: initial;'>Your New Password </td>" +
      "</tr>" +
           " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: chartreuse;'>" + RandomPassword.ToString() + "</td>" +
        "</tr>" +
    "</thead>" +
  "</table>";
                 message.IsBodyHtml = true;
                try
                {
                    Data = "Email";
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
                Data = "Invalid";
                return;
            }
        }


        // Default size of random password is 15  
        private static string CreateRandomPassword(int length = 15)
        {
            // Create a string of characters, numbers, special characters that allowed in the password  
            string validChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*?_-";
            Random random = new Random();

            // Select one random character at a time from the string  
            // and create an array of chars  
            char[] chars = new char[length];
            for (int i = 0; i < length; i++)
            {
                chars[i] = validChars[random.Next(0, validChars.Length)];
            }
            return new string(chars);
        }

        /*private static string CreateRandomPasswordWithRandomLength()
        {
            // Create a string of characters, numbers, special characters that allowed in the password  
            string validChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*?_-";
            Random random = new Random();

            // Minimum size 8. Max size is number of all allowed chars.  
            int size = random.Next(8, validChars.Length);

            // Select one random character at a time from the string  
            // and create an array of chars  
            char[] chars = new char[size];
            for (int i = 0; i < size; i++)
            {
                chars[i] = validChars[random.Next(0, validChars.Length)];
            }
            return new string(chars);
        }*/
    }
}