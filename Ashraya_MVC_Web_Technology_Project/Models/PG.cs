using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class PG
    {
        public string Message { get; set; }
        string FileName1;
        string FilePath1;
        string strFilePath1;

        string FileName2;
        string FilePath2;
        string strFilePath2;

        string FileName3;
        string FilePath3;
        string strFilePath3;

        public void PGAdd(String PGName, String PGLocation, String PGZip, HttpPostedFileBase Img1P, HttpPostedFileBase Img2P, HttpPostedFileBase Img3P,String ID)
        {
            /*Uploading Files */
            if (Img1P != null || Img2P != null || Img3P != null)
            {
                /*Declaring Variables*/
                string fileName1 = string.Empty;
                string fileName2 = string.Empty;
                string fileName3 = string.Empty;
                string fileName4 = string.Empty;
                string destinationPath1 = string.Empty;
                string destinationPath2 = string.Empty;
                string destinationPath3 = string.Empty;
                string destinationPath4 = string.Empty;

                /*Img 1*/
                fileName1 = Path.GetFileName(Img1P.FileName);
                destinationPath1 = Path.GetFullPath(Img1P.FileName);
                strFilePath1 = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Images/PG/"+fileName1;
                Img1P.SaveAs(strFilePath1);
                FileName1 = fileName1;
                FilePath1 = destinationPath1;


                /*Img 2*/
                fileName2 = Path.GetFileName(Img2P.FileName);
                destinationPath2 = Path.GetFullPath(Img2P.FileName);
                strFilePath2 = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Images/PG/" + fileName2;
                Img2P.SaveAs(strFilePath2);
                FileName2 = fileName2;
                FilePath2 = destinationPath2;


                /*Img 3*/
                fileName3 = Path.GetFileName(Img3P.FileName);
                destinationPath3 = Path.GetFullPath(Img3P.FileName);
                strFilePath3 = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Images/PG/" + fileName3;
                Img3P.SaveAs(strFilePath3);
                FileName3 = fileName3;
                FilePath3 = destinationPath3;
             }

            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand Insert_Cmd = new SqlCommand("Insert Into PG Values('" + PGName + "','" + PGLocation + "','" + PGZip + "','" + FileName1 + "','" + FileName2 + "','" + FileName3 + "',GETDATE(),'" + ID + "')", Con);
            Con.Open();
            Insert_Cmd.ExecuteNonQuery();
            Con.Close();
            Message = "Done";

            /*Fetch Email*/
            System.Data.SqlClient.SqlCommand Email = new System.Data.SqlClient.SqlCommand("Select Email From Registration_Table  Where ID='" + ID.ToString()+ "';", Con);
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
                message.Subject = "PG ADDED From Ashraya";
                message.Body = " <table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
     "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>PG DETAIL</td>" +
        "</tr>" +
            " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Name</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + PGName + "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Location</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + PGLocation + "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Zip Code</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + PGZip + "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Date Added</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + aDate.ToString("MM/dd/yyyy").ToString() + "</th>" +
           " </tr>" +
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
    }
}