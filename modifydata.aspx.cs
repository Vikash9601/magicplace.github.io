using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        //int uid;
        //uid = Convert.ToInt32(Session["id"]);
        //if (!IsPostBack)
        //{
        //    con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        //    con.Open();
        //    cmd = new SqlCommand("select property_id,property_for,property_type,state,city,locality,bedrooms,Bathroom,balconies,floor_no,furnished_status,covered_area,cover_area_unit,plot_area,plot_area_unit,transaction_type,possession_status,age_of_construction,construct_complete,expected_price,price_sqft from propertydata where user_id='" + uid + "'", con);

        //    da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds, "propertydata");
        //    //DataTable dt = new DataTable();
        //    //da.Fill(dt);
        //    //gvpropertyshow.DataSource = dt;
        //    gvshow.DataSource = ds.Tables[0];
        //    gvshow.DataBind();
        //    con.Close();

        //}
    }
}