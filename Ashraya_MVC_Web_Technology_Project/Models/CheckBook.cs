using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class CheckBook
    {
        public string Data { get; set; }
        public void CheckBeforeBook(String ID)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            SqlCommand Cmd = new SqlCommand("Select Count(*) From Booking WHERE Room_ID = '" + ID + "'", Con);
            Con.Open();
            int temp = Convert.ToInt32(Cmd.ExecuteScalar().ToString());
            Con.Close();
            if(temp>=1)
            {
                Data = "Exists";
                return;
            }
            else
            {
                Data = "Book";
            }
        
        }
    }
}