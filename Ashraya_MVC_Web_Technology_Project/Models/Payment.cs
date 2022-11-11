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
    public class Payment
    {
        public void BOOKPG(String RoomChoose, String CheckInDate, String CheckOutDate, String People, String CardName, String CardNo, String ExpiryMonth, String ExpiryYear, String CVV,String CID)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand Insert_Card = new SqlCommand("Insert Into Card Values('" + CardName + "','" + CardNo + "','" + CVV + "','" + ExpiryMonth + "','" + ExpiryYear + "',GETDATE(),'" + CID + "')", Con);
            SqlCommand SelectCardCID = new SqlCommand("Select ID From Card Where Customer_ID ='"+CID+"'",Con);
            Con.Open();
            Insert_Card.ExecuteNonQuery();
            int Card = Convert.ToInt32(SelectCardCID.ExecuteScalar().ToString());
            Con.Close();

            /*Enter Data To Database*/
          SqlCommand Insert_Booking = new SqlCommand("Insert Into Booking Values('" + RoomChoose + "','"+CID+"','" + CheckInDate+ "','" + CheckOutDate + "','" + People + "','"+Card+"',GETDATE())", Con);
          Con.Open();
          Insert_Booking.ExecuteNonQuery();
          Con.Close();
        }
    }
}