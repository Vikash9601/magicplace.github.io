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
    SqlConnection con= new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Convert.ToInt32(Session["id"]) == 0)
        //{


        //    ClientScript.RegisterStartupScript(this.GetType(), "sdas", "",true);


        //}

        if (!IsPostBack)
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from simpleuserregister where id=" + Convert.ToInt32(Session["id"]) + "", con);

            // Response.Write(cmd.CommandText);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtname.Text = dr["username"].ToString();
                txtemail.Text = dr["email"].ToString();
                contact.Text = dr["contactno"].ToString();

                txtverify.Text = dr["contactno"].ToString();

                usertype.SelectedValue = dr["user_type"].ToString();

            }

            con.Close();
        }
    }
    protected void submitchange_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("update simpleuserregister set username='"+txtname.Text+"',email='"+txtemail.Text+"',contactno="+Convert.ToInt64(contact.Text)+",user_type='"+usertype.SelectedValue+"' where id="+Convert.ToInt32(Session["id"])+"",con);
      //  Response.Write(cmd.CommandText);

        if (cmd.ExecuteNonQuery() > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "vik", "$(\"#msg\").text(\"Your Records has updated successfully \"); setTimeout(function(){$(\"#MSG\").modal(\"show\");},1500) ",true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "rik", "$(\"#msg\").text(\"Something went wrong. Please try again \"); setTimeout(function(){$(\"#MSG\").modal(\"show\");},1500)", true);
     
        }
    }

}