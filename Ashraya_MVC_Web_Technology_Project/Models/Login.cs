using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class Login
    {
        public String Msg { get; set; }
        public int SessionData { get; set; }
        public void Logins(String Email_S,String Password_S)
        {
            SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString);
            /*Customer and Owner Logins Checkings*/
            SqlCommand Select_Email_Customer = new SqlCommand("Select Count(Email) From Registration_Table Where Email='" + Email_S + "' AND Role='Customer';", Con);
            SqlCommand Select_Email_Owner = new SqlCommand("Select Count(Email) From Registration_Table Where Email='" + Email_S + "' AND Role='Owner';", Con);
            Con.Open();
            int Customer_Login_Email = Convert.ToInt32(Select_Email_Customer.ExecuteScalar().ToString());
            int Owner_Login_Email = Convert.ToInt32(Select_Email_Owner.ExecuteScalar().ToString());
            Con.Close();
            if (Customer_Login_Email == 1 || Owner_Login_Email==1)
            {
                SqlCommand Select_Pass_Customer = new SqlCommand("Select Count(Password) From Registration_Table Where Email='" + Email_S + "' AND Password='" + Password_S + "' AND Role='Customer';", Con);
                SqlCommand Select_Pass_Owner = new SqlCommand("Select Count(Password) From Registration_Table Where Email='" + Email_S + "' AND Password='" + Password_S + "' AND Role='Owner';", Con);
                
                Con.Open();
                int Customer_Login_Password = Convert.ToInt32(Select_Pass_Customer.ExecuteScalar().ToString());
                int Owner_Login_Password = Convert.ToInt32(Select_Pass_Owner.ExecuteScalar().ToString());
                Con.Close();
                
                if (Customer_Login_Password == 1 )
                {
                    SqlCommand SessionCmd = new SqlCommand("Select ID From Registration_Table Where Email='" + Email_S + "' AND Password='" + Password_S + "';", Con);
                    Con.Open();
                    int SessionCmdInt = Convert.ToInt32(SessionCmd.ExecuteScalar().ToString());
                    Con.Close();
                    /*Session Data*/SessionData = SessionCmdInt;
                    Msg = "Success_Customer";
                 }
                else if(Owner_Login_Password == 1)
                {
                    SqlCommand SessionCmd = new SqlCommand("Select ID From Registration_Table Where Email='" + Email_S + "' AND Password='" + Password_S + "';", Con);
                    Con.Open();
                    int SessionCmdInt = Convert.ToInt32(SessionCmd.ExecuteScalar().ToString());
                    Con.Close();
                    /*Session Data*/
                    SessionData = SessionCmdInt;
                    Msg = "Success_Owner";
                }
                else
                {
                    Msg = "pass_error";
                    return;
                }
            }
            else
            {
                Msg = "email_error";
                return;
            }
        }
    }
}
