using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class adminPanel : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getbuilderdata();
            getagentdata();
            getsimpleuserdata();
        //   getmemorydata();

        }
        uservisited.InnerHtml = Application["visiteduser"].ToString();
        uservisit.InnerHtml = Application["OnlineUsers"].ToString();


        int builder, agent, sb;
        String todaydate = DateTime.Now.ToString("dddd, dd MMMM yyyy");
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from simpleuserregister where user_type='agent' and joindate='"+todaydate+"'", con);
        SqlCommand cmd1 = new SqlCommand("select count(*) from simpleuserregister where user_type='builder' and joindate='" + todaydate + "'", con);

        SqlCommand cmd2 = new SqlCommand("select count(*) from simpleuserregister where user_type='buyer/seller' and joindate='" + todaydate + "'", con);

        agent = (Int32)cmd.ExecuteScalar();
        builder = (Int32)cmd1.ExecuteScalar();
        sb = (Int32)cmd2.ExecuteScalar();

        con.Close();

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



    }


    public void getbuilderdata()
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select property_id,property_for,property_type,state,city,locality,propertyName,expected_price from propertydata where user_type='builder'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);


        gvbuilder.DataSource = dt;
        gvbuilder.DataBind();
        con.Close();


    }

    protected void getagentdata()
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select property_id,property_for,property_type,state,city,locality,propertyName,expected_price from propertydata where user_type='agent'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);


        gvagent.DataSource = dt;
        gvagent.DataBind();
        con.Close();




    }

    protected void getsimpleuserdata()
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select property_id,property_for,property_type,state,city,locality,propertyName,expected_price from propertydata where user_type='simpleuser'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);


        gvuser.DataSource = dt;
        gvuser.DataBind();
        con.Close();




    }



    protected void getmemorydata()
    {
        string fileName = @"C:\Users\Vikas\Documents\Visual Studio 2012\WebSites\collegeproject";
        FileInfo fi = new FileInfo(fileName);

     
      
            long size = fi.Length;
            lbl3.Text=string.Format("File Size in Bytes: {0}", size);
          
         

    }

    protected void gvbuilder_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvbuilder.PageIndex = e.NewPageIndex;
        getbuilderdata();
    }
    protected void gvagent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvagent.PageIndex = e.NewPageIndex;
        getagentdata();
    }
    protected void gvuser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvuser.PageIndex = e.NewPageIndex;
        getsimpleuserdata();
    }
}