using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Ashraya_MVC_Web_Technology_Project.Models
{
    public class Code
    {
        public String infoz { get; set; }
        public void OneTimePassword(String OTPX,String R)
        {
            String mycon = ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString;
            String myquery = "Select Top 1 * from VerificationTable  Where Email='"+R+"' order by VID Desc;";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                String activationcode;
                activationcode = ds.Tables[0].Rows[0]["activationcode"].ToString();
                if (activationcode == OTPX)
                {
                    infoz = "Pass";
                    String mycons = ConfigurationManager.ConnectionStrings["AshrayaConnectionString"].ConnectionString;
                    String updatedatas = "with cte AS (SELECT TOP 1 * FROM  VerificationTable order by VID Desc) UPDATE cte SET VerificationStatus='Verified' SELECT TOP 1 * FROM VerificationTable Where Email='"+R+"' ORDER BY VID DESC ;";
                    SqlConnection cons = new SqlConnection(mycons);
                    con.Open();
                    SqlCommand cmds = new SqlCommand();
                    cmds.CommandText = updatedatas;
                    cmds.Connection = con;
                    cmds.ExecuteNonQuery();
                  }
                else
                {
                    infoz = "Fail";
                    return;
                }
            }

            con.Close();
        }

       
    }
}