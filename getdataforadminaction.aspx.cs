using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class getdataforadminaction : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        string key = Request["getit"];
         fillgrid(key);
    }

        public void fillgrid(string da)
    {

        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand sql = new SqlCommand("select id,username from simpleuserregister where username like '"+da+"%'",con);
        Response.Write(sql.CommandText);
        putdata.DataSource = sql.ExecuteReader();
        putdata.DataBind();
        con.Close();

    }


  
}