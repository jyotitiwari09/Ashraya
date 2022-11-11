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
    public class Admin_Delete_Verification
    {
        public string Message { get; set; }
        public void ADC(String DeleteVVV)
        {
                /*Deleting Data From Database*/
                 SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
                SqlCommand CMD = new SqlCommand("Delete From VerificationTable Where VID ='" + DeleteVVV + "';", Con);
                Con.Open();
                CMD.ExecuteNonQuery();
                Con.Close();
                Message = "Delete";
          }
    }
}