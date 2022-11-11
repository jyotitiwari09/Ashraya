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
    public class Room
    {
        public string Message { get; set; }
        public string Extensions { get; set; }
        string FileName1;
        string FilePath1;
        string strFilePath1;

        string FileName2;
        string FilePath2;
        string strFilePath2;

        string FileName3;
        string FilePath3;
        string strFilePath3;

        public void ShowRooms(String Price, String RoomType, HttpPostedFileBase Img1, HttpPostedFileBase Img2, HttpPostedFileBase Img3, String Television, String Refridgerator, String AC, String select)
        {

            /*Uploading Files */
            if (Img1 != null || Img2 != null || Img3 != null )
            {
                /*Declaring Variables*/
                string fileName1 = string.Empty;
                string fileName2 = string.Empty;
                string fileName3 = string.Empty;
                string destinationPath1 = string.Empty;
                string destinationPath2 = string.Empty;
                string destinationPath3 = string.Empty;
           
                    /*Img 1*/
                    fileName1 = Path.GetFileName(Img1.FileName);
                    destinationPath1 = Path.GetFullPath(Img1.FileName);
                    strFilePath1 = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Images/Rooms/" + fileName1;
                    Img1.SaveAs(strFilePath1);
                    FileName1 = fileName1;
                    FilePath1 = destinationPath1;
             
                    /*Img 2*/
                    fileName2 = Path.GetFileName(Img2.FileName);
                    destinationPath2 = Path.GetFullPath(Img2.FileName);
                    strFilePath2 = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Images/Rooms/" + fileName2;
                    Img2.SaveAs(strFilePath2);
                    FileName2 = fileName2;
                    FilePath2 = destinationPath2;
             

                 /*Image 3*/
                
                fileName3 = Path.GetFileName(Img3.FileName);
                destinationPath3 = Path.GetFullPath(Img3.FileName);
                strFilePath3 = "Y:/Ashraya_MVC_Web_Technology_Project/Ashraya_MVC_Web_Technology_Project/Contents/Images/Rooms/" + fileName3;
                Img3.SaveAs(strFilePath3);
                FileName3 = fileName3;
                FilePath3 = destinationPath3;
              
                
            }

            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand Insert_Cmd = new SqlCommand("Insert Into Room Values('" + Price + "','" + RoomType + "','" + FileName1 + "','" + FileName2 + "','" + FileName3 + "','" + Television + "','" + Refridgerator + "','" + AC + "','" + select + "',GETDATE());", Con);
            Con.Open();
            Insert_Cmd.ExecuteNonQuery();
            Con.Close();
            Message = "Done";

            /*Fetch Email*/
            System.Data.SqlClient.SqlCommand Email = new System.Data.SqlClient.SqlCommand("  Select RT.Email From Room R,PG P,Registration_Table RT WHERE (RT.ID=P.Owner_ID) AND (RT.Role='Owner') AND(P.ID=R.PGID) AND (P.ID='"+select+"');", Con);
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
            message.Subject = "Room Added From Ashraya";
            message.Body = "<table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
     "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>ROOM DETAIL</td>" +
        "</tr>" +
            " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Room Type</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + RoomType+ "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>TV</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + Television  + "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Refridgerator</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + Refridgerator + "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>AC</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + AC + "</th>" +
           " </tr>" +
               " <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;border-bottom: 1px solid #dddddd;'>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;';>Date Added</th>" +
               " <th colspan='2' style='text-align:center;padding: 12px 15px;font-family:Bahnschrift;color: #ffef00';>" + aDate.ToString("MM/dd/yyyy").ToString()  + "</th>" +
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