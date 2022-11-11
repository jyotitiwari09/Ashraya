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
    public class PGDelete
    {
        public string Information { get; set; }
        public void PGDeletes(String pgdeleted,String Cattu)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            /*Check Room Before Delete PG*/
            SqlCommand CheckRoomBeforePgDelete = new SqlCommand("Select Count(P.ID) From PG P,Registration_Table RT,Room R Where (RT.ID=P.Owner_ID) AND (P.ID=R.PGID) AND (RT.ID='"+Cattu+"') AND (RT.Role='Owner') AND (P.ID='"+pgdeleted+"');", Con);
            Con.Open();
            int temp = Convert.ToInt32(CheckRoomBeforePgDelete.ExecuteScalar().ToString());
            Con.Close();
            if(temp>=1)
            {
                Information = "CannotDelete";
               // return;
            }
           else
            {
            

                   /*Fetch ID*/  
                System.Data.SqlClient.SqlCommand ID = new System.Data.SqlClient.SqlCommand("Select Owner_ID From PG  Where ID='" + pgdeleted + "';", Con);
                Con.Open();
                string E = ID.ExecuteScalar().ToString();
                Con.Close();

                /*Fetch Email*/ 
                System.Data.SqlClient.SqlCommand Email = new System.Data.SqlClient.SqlCommand("Select Email From Registration_Table  Where ID='" + E.ToString()+ "';", Con);
                Con.Open();
                string EE = Email.ExecuteScalar().ToString();
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
                MailMessage message = new MailMessage("syaser327@outlook.com", EE);
                message.Subject = "Account Updated From Ashraya";
                message.Body = "<table class='content-table' style='    border-collapse: collapse;margin: 25px 0;font-size: 0.9em;min-width: 400px;border-radius: 5px 5px 0 0;overflow-x: auto;box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);'>" +
    "<thead style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
      "    <tr style='background: #171c24;color: #ffffff;text-align: left; color: #fff;font-size: 30px;font-weight: 600;border-bottom: 1px solid #dddddd;'>" +
     "       <th colspan='4' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;'>Ashraya</th>" +
     "  <tr style='background: #171c24;color: #ffffff;text-align: left;font-weight: bold;'>" +
     " <td colspan='3' style='font-family:Bahnschrift;text-align:center;padding: 12px 15px;font-size: 22px;color: #ffef00;border-bottom: 1px solid #dddddd;'>PG Removed</td>" +
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

                /*Database*/
                SqlCommand Cmd = new SqlCommand("Delete From PG WHERE ID='" + pgdeleted + "';", Con);
                Con.Open();
                Cmd.ExecuteNonQuery();
                Con.Close();
                Information = "Delete";


            }
          
         }
    }
}