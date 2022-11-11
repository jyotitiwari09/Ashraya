using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.IO;
using System.Web;
using System.Data;
using System.Net.Mail;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class VerificationOfRegistration
    {
        string FileName;
        string FilePath;
        string strFilePath;
        static String activationcode;
        public String Message { get; set; }
        public String infox { get; set; }
        // public void Verify(String FirstName, String LastName, String Phone, String Email, String gender, String Address, String DOB, String Username, String Password, String CPassword,String Role,String FileUpload1)
        public void Verify(HttpPostedFileBase file_Uploader, String Email_Verify)
        {
            /*Check if Email Exists Already In Registration Table*/
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand Select_Email = new SqlCommand("Select Count(Email) From Registration_Table Where Email='" + Email_Verify + "';", Con);
            Con.Open();
            int temp = Convert.ToInt32(Select_Email.ExecuteScalar().ToString());
            Con.Close();
            if (temp == 1)
            {
                infox = "Exists";
                return;
            }
            else
            {
                /*Uploading Files */
                if (file_Uploader != null)
                {
                    string fileName = string.Empty;
                    string destinationPath = string.Empty;
                    fileName = Path.GetFileName(file_Uploader.FileName);
                    destinationPath = Path.GetFullPath(file_Uploader.FileName);
                    strFilePath = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Uploads/" + fileName;
                    file_Uploader.SaveAs(strFilePath);
                    FileName = fileName;
                    FilePath = destinationPath;
                }


                Random random = new Random();
                activationcode = random.Next(1001, 9999).ToString();
                String query = "Insert into VerificationTable values('" + Email_Verify + "','" + FileName + "','Unverified','" + activationcode + "',GETDATE())";
                String mycon = ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(mycon);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();


                //Sending Mail
                SmtpClient client = new SmtpClient("smtp-mail.outlook.com");
                client.Port = 587;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                System.Net.NetworkCredential credential = new System.Net.NetworkCredential("syaser327@outlook.com", "Ankola@327");
                client.EnableSsl = true;
                client.Credentials = credential;
                MailMessage message = new MailMessage("syaser327@outlook.com", Email_Verify);
                message.Subject = "Activation Code to Verify Email Address";
                message.Body = "<table  style='font-family:Bahnschrift;border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
   " <thead style='background: linear-gradient(135deg,#eb5d5d,hsl(28, 100%, 50%, 0.537));color: #ffffff;text-align: left;font-weight: bold;'>" +
    "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
      "  </tr>" +
     " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "  <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: initial;'>Your OTP is </td>" +
      "</tr>" +
           " <tr style='border-bottom: 1px solid #dddddd;background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: chartreuse;'>" + activationcode + "</td>" +
        "</tr>" +
    "</thead>" +
  "</table>";
                message.IsBodyHtml = true;
                try
                {
                    infox = "CK";
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
        }
    }
}