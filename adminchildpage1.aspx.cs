using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {

        
        uservisit.InnerHtml = Application["OnlineUsers"].ToString();


        int builder, agent, sb;
        String todaydate = DateTime.Now.ToString("dddd, dd MMMM yyyy");
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from simpleuserregister where user_type='agent' and joindate='" + todaydate + "'", con);
        SqlCommand cmd1 = new SqlCommand("select count(*) from simpleuserregister where user_type='builder' and joindate='" + todaydate + "'", con);

        SqlCommand cmd2 = new SqlCommand("select count(*) from simpleuserregister where user_type='buyer/seller' and joindate='" + todaydate + "'", con);

        agent = (Int32)cmd.ExecuteScalar();
        builder = (Int32)cmd1.ExecuteScalar();
        sb = (Int32)cmd2.ExecuteScalar();

       

        if (builder > 0)
        {
            lblbuilder.InnerHtml = builder.ToString();

        }
        if (agent > 0)
        {
            lblagent.InnerHtml = agent.ToString();

        }
        if (sb > 0)
        {

            lblsb.InnerHtml = sb.ToString();
        }



        SqlCommand commandproperty = new SqlCommand("select count(*) from propertydata", con);
        SqlCommand commandrproperty = new SqlCommand("select count(*) from Rpropertydata", con);
        int totalproperty = Convert.ToInt32(commandproperty.ExecuteScalar()) + Convert.ToInt32(commandrproperty.ExecuteScalar());
        lblproperty.InnerHtml = totalproperty.ToString();

        SqlCommand commandseller = new SqlCommand("select count(*) from simpleuserregister where user_type='builder' or user_type='agent'", con);
        SqlCommand commandbuyer = new SqlCommand("select count(*) from simpleuserregister where user_type='buyer/seller'", con);
        lbltotalseller.InnerHtml = Convert.ToString(commandseller.ExecuteScalar());
        lbltotalbuyer.InnerHtml = Convert.ToString(commandbuyer.ExecuteScalar());
        con.Close();
    }
}