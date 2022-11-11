using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class AdminLogin
    {
        public string A { get; set; }
        public int SessionData { get; set; }
        public void AL(String EA, String EP)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            /*Customer and Owner Logins Checkings*/
            SqlCommand AdminLogin = new SqlCommand("Select Count(*) From Registration_Table Where Email='" + EA + "';", Con);
            SqlCommand AdminLoginP = new SqlCommand("Select Count(*) From Registration_Table Where Email='" + EA + "' AND Password='" + EP + "' AND Role='Admin';", Con);
            Con.Open();
            int temp1 = Convert.ToInt32(AdminLogin.ExecuteScalar().ToString());
            int temp2 = Convert.ToInt32(AdminLoginP.ExecuteScalar().ToString());
            Con.Close();
            if(temp1==1)
            {
             
                if(temp2==1)
                {
                    SqlCommand SessionCmd = new SqlCommand("Select ID From Registration_Table Where Email='" + EA + "' AND Password='" + EP + "' AND Role='Admin';", Con);
                    Con.Open();
                    int SessionCmdInt = Convert.ToInt32(SessionCmd.ExecuteScalar().ToString());
                    Con.Close();
                    /*Session Data*/
                    SessionData = SessionCmdInt;
                    A = "Login";
                }
                else
                {
                    A = "PFail";
                    return;
                }
            }
            else
            {
                A = "EFail";
                return;
            }
        }
    }
}