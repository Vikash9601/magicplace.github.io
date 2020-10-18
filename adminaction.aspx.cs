using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

using System.Data.SqlClient;



public partial class _Default : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
   
    protected void Page_Load(object sender, EventArgs e)
    {

        int id = Convert.ToInt32(Request.QueryString["aaccd"]);

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from propertydata where user_id=" + id + "", con);

        gvshow.DataSource = cmd.ExecuteReader();

        gvshow.DataBind();

        con.Close();



    }
   


   

}

