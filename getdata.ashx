<%@ WebHandler Language="C#" Class="getdata" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

using System.Data.SqlClient;
using System.Web.Script.Serialization;

public class getdata : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string term = context.Request["term"] ?? "";
        List<string> userdata = new List<string>();
             
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand sql = new SqlCommand("select id,username from simpleuserregister where username like '" + term + "%'", con);
        SqlDataReader dr = sql.ExecuteReader();
          

           while (dr.Read())
           {
               userdata.Add(dr["username"].ToString());
           }

           con.Close();

           JavaScriptSerializer js = new JavaScriptSerializer();
           context.Response.Write(js.Serialize(userdata));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}