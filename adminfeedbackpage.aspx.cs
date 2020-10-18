using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");

 
     
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();

        SqlCommand cmd = new SqlCommand("select u.userfeedback,u.property_id,s.username,u.userid from userfeedbacktbl u inner join simpleuserregister s  on userid=id", con);
        
        custfeed.DataSource = cmd.ExecuteReader();
        custfeed.DataBind();



        SqlCommand cmd1 = new SqlCommand("select u.sellerFeed,u.property_id,s.username,u.userid from sellerFeedback u inner join simpleuserregister s on u.userid=s.Id", con);
        sellerrep.DataSource = cmd1.ExecuteReader();
        sellerrep.DataBind();
        con.Close();
    }
    protected void linkinformation_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
       int id = Convert.ToInt32((item.FindControl("lblid") as Label).Text);
       int pro_id = Convert.ToInt32((item.FindControl("lblpro") as Label).Text);

        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from propertydata where property_id="+pro_id+"", con);
        if (Convert.ToInt32(cmd.ExecuteScalar()) != 1)
        {
            SqlCommand cmd1 = new SqlCommand("select Rproperty_for,Rproperty_type,Rlocality,Rcity,Rexpected_price from Rpropertydata  where Rproperty_id=" + pro_id + "", con);
            SqlCommand cmd2 = new SqlCommand("select username from simpleuserregister where id in (select Ruser_id from Rpropertydata where Rproperty_id="+pro_id+")", con);
            SqlDataReader dr = cmd1.ExecuteReader();


            sellername.Text = cmd2.ExecuteScalar().ToString();
            while (dr.Read())
            {
                profor.Text = dr["Rproperty_for"].ToString();
                protype.Text = dr["Rproperty_type"].ToString();
                locality.Text = string.Concat(dr["Rlocality"].ToString(), dr["Rcity"].ToString());
                price.Text = string.Format("{0:n}", Convert.ToInt32(dr["Rexpected_price"]));
            }
        }
        else
        {
            SqlCommand cmd1 = new SqlCommand("select property_for,property_type,locality,city,expected_price  from propertydata  where property_id=" + pro_id + "", con);
            SqlCommand cmd2 = new SqlCommand("select username from simpleuserregister where id in (select user_id from propertydata where property_id=" + pro_id + ")", con);
            SqlDataReader dr = cmd1.ExecuteReader();


            sellername.Text = cmd2.ExecuteScalar().ToString();
            while (dr.Read())
            {
                profor.Text = dr["property_for"].ToString();
                protype.Text = dr["property_type"].ToString();
                locality.Text = string.Concat(dr["locality"].ToString(), " , ", dr["city"].ToString());
                price.Text = string.Format("{0:n}", Convert.ToInt32(dr["expected_price"]));

            }
        }


        ClientScript.RegisterStartupScript(this.GetType(), "mlaunch", "setTimeout(function(){  $(\"#exampleModal\").modal('show');},500);", true);




    }

    protected void linkRinformation_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
        int id = Convert.ToInt32((item.FindControl("lblid") as Label).Text);
        int pro_id = Convert.ToInt32((item.FindControl("lblpro") as Label).Text);
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from propertydata where property_id=" + pro_id + "", con);
        if (Convert.ToInt32(cmd.ExecuteScalar()) != 1)
        {
            SqlCommand cmd1 = new SqlCommand("select Rproperty_for,Rproperty_type,Rlocality,Rcity,Rexpected_price from Rpropertydata  where Rproperty_id=" + pro_id + "", con);
            SqlCommand cmd2 = new SqlCommand("select username from simpleuserregister where id in (select Ruser_id from Rpropertydata where Rproperty_id=" + pro_id + ")", con);
            SqlDataReader dr = cmd1.ExecuteReader();


            sellername.Text = cmd2.ExecuteScalar().ToString();
            while (dr.Read())
            {
                profor.Text = dr["Rproperty_for"].ToString();
                protype.Text = dr["Rproperty_type"].ToString();
                locality.Text = string.Concat(dr["Rlocality"].ToString(), dr["Rcity"].ToString());
                price.Text = string.Format("{0:n}", Convert.ToInt32(dr["Rexpected_price"]));
            }
        }
        else
        {
            SqlCommand cmd1 = new SqlCommand("select property_for,property_type,locality,city,expected_price  from propertydata  where property_id=" + pro_id + "", con);
            SqlCommand cmd2 = new SqlCommand("select username from simpleuserregister where id in (select user_id from propertydata where property_id=" + pro_id + ")", con);
            SqlDataReader dr = cmd1.ExecuteReader();


            sellername.Text = cmd2.ExecuteScalar().ToString();
            while (dr.Read())
            {
                profor.Text = dr["property_for"].ToString();
                protype.Text = dr["property_type"].ToString();
                locality.Text = string.Concat(dr["locality"].ToString(), " , ", dr["city"].ToString());
                price.Text = string.Format("{0:n}", Convert.ToInt32(dr["expected_price"]));

            }
        }


        ClientScript.RegisterStartupScript(this.GetType(), "mlaunch", "setTimeout(function(){  $(\"#exampleModal\").modal('show');},500);", true);
         
        

    }
}