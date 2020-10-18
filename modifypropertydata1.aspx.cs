using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security;
using System.Security.Cryptography;
using System.Text;

public partial class modifypropertydata1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
    SqlCommand command, command1, command2; 
    String ptype;
    bool feedback = false;
   static int uid,starvalue,rstarvalue;
   public static String newpost,newpost1;
    protected void Page_Load(object sender, EventArgs e)
    {


        uid = Convert.ToInt32(Session["id"]);
        con.Open();
      //  Response.Write(uid);

        SqlCommand comm = new SqlCommand("select activity2_updproperty,activity2_entireproperty from useractivityblock where user_id=" + uid + "", con);
            try
            {
              //  newpost = Convert.ToString(comm.ExecuteScalar());
                SqlDataReader dr = comm.ExecuteReader();
                while(dr.Read())
                {
                    newpost = dr["activity2_updproperty"].ToString();
                    newpost1=dr["activity2_entireproperty"].ToString();
                }



               // Response.Write(comm.CommandText);



                if (newpost == "Blocked" || newpost1=="Blocked" )
                {
                    msgwa.Text = "You can't Modify properties on Magicplace.";
                    msgwa1.Text = "Administrator has blocked you for any reason.";
                    ClientScript.RegisterStartupScript(this.GetType(), "active", " $(document).ready(function(){  $(\"#warningm\").modal(\"show\");  })", true);

                }
            }
            catch
            {

//                Response.Write("hello");
            }
            con.Close();

        
       
    }


    protected void ddlselect_SelectedIndexChanged(object sender, EventArgs e)
    {

        ptype = ddlselect.SelectedItem.ToString();
        gvview(ptype);

     
        
    }

    protected void gvview(String prtype)
    {
         //con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
      
        if (prtype == "Apartment")
        {
            SqlCommand cmd = new SqlCommand("select PropertyFirstImg,property_type,property_id,propertyName,address,plot_area,plot_area_unit,expected_price from propertydata where user_id=" + uid + "", con);
            datashow.DataSource = cmd.ExecuteReader();
            datashow.DataBind();
            con.Close();
            dataresidential.Visible = false;
            datashow.Visible = true;

            if (datashow.Items.Count == 0)
            {

                lblm.Text = "You have not uploaded any apartment property yet";
            }
            else
            {
                lblm.Text="";
            }
         

      

            
        }
        else
        {

            SqlCommand cmd = new SqlCommand("select RfirstPostImg,Rproperty_type,Rproperty_id,address,Rlocality,Rplot_area,Rplot_area_unit,Rexpected_price from Rpropertydata where Ruser_id=" + uid + "", con);
            dataresidential.DataSource = cmd.ExecuteReader();
            dataresidential.DataBind();
            con.Close();
            datashow.Visible = false;
            dataresidential.Visible = true;

                 if (dataresidential.Items.Count == 0)
            {

                lblm.Text="You have not uploaded any Residential house property yet";
            }
            else
            {
                lblm.Text="";
            }

        }







    }


    protected void btn_edit(object sender, EventArgs e)
    {
       
            //DataList item = (sender as Button).NamingContainer as DataList;
            //string get = (item.FindControl("label_id") as Label).Text;
           

            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label txt = (Label)item.FindControl("labelid");
            Label txt1 = (Label)item.FindControl("lbltype");
          
            Session["property_id"] = txt.Text;
            Session["type"] = txt1.Text;
            Response.Redirect("modifyproperty.aspx");

    }

    protected void btnedit(object sender, EventArgs e)
    {

        //DataList item = (sender as Button).NamingContainer as DataList;
        //string get = (item.FindControl("label_id") as Label).Text;
        //Session["property_id"] = get;
        //Response.Redirect("modifyproperty.aspx");

        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        Label txt = (Label)item.FindControl("label_id");
        Label txt1 = (Label)item.FindControl("lbl_type");

        Session["property_id"] = txt.Text;
        Session["type"] = txt1.Text;
        Response.Redirect("modifyproperty.aspx");


    }




    protected void btnmodalsubmit_Click1(object sender, EventArgs e)
    {

        SHA512 m = SHA512.Create();
        byte[] bytes = System.Text.ASCIIEncoding.ASCII.GetBytes(txtpass.Text);
        byte[] hash = m.ComputeHash(bytes);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));

        }
        var pass = sb.ToString();

        if (txtid.Text != "" && txtid.Text != null && txtpass.Text != "" && txtpass.Text != null)
        {

            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();

            if (Char.IsLetter(txtid.Text, 1))
            {
                command = new SqlCommand("select count(*) from simpleuserregister where email='" + txtid.Text + "' and password='" + pass + "'", con);
                command1 = new SqlCommand("select username from simpleuserregister where email='" + txtid.Text + "'", con);
                command2 = new SqlCommand("select id from simpleuserregister where email='" + txtid.Text + "'", con);

                //Response.Write(command.CommandText);
                //Response.Write(command1.CommandText);
                //Response.Write(command2.CommandText);
            }
            else
            {
                command = new SqlCommand("select count(*) from simpleuserregister where contactno=" + txtid.Text + " and password='" + pass + "'", con);
                command1 = new SqlCommand("select username from simpleuserregister where contactno=" + txtid.Text + "", con);
                command2 = new SqlCommand("select id from simpleuserregister where contactno=" + txtid.Text + "", con);
            }


            // SqlCommand command = new SqlCommand("select count(*) from simpleuserregister where contactno='" + txtid.Text + "' and password='" + pass + "' or email='" + txtid.Text + "' and password='" + pass + "'", con);

            //SqlCommand command1 = new SqlCommand("select id from simpleuserregister where contactno='" + txtid.Text + "'", con);
            // SqlCommand command2 = new SqlCommand("select username from simpleuserregister where contactno='" + txtid.Text + "' or email='" + txtid.Text + "'", con);


            int cnt, cnt3;
            string name;
            cnt = Convert.ToInt32(command.ExecuteScalar());
            lblerror.Text = Convert.ToString(cnt);
            cnt3 = Convert.ToInt32(command2.ExecuteScalar());
            name = Convert.ToString(command1.ExecuteScalar());

            con.Close();

            if (cnt == 1)
            {


                lblerror.Text = "successfuly";
                Session["id"] = cnt3;
                Session["user"] = name;

                ((MasterPage)Master).getdata.Text = name;


                Response.Redirect("modifypropertydata1.aspx");
            }
            else 
            {
                lblerror.Text = "invalid";
            }
        }


 else if((txtid.Text == "" || txtid.Text == null) && (txtpass.Text == "" || txtpass.Text == null))
        {

            lblerror.Text = "Both fields are required for authentication";

        }
        else if (txtid.Text == null || txtid.Text == "")
        {
            lblerror.Text = "Please fill either e-mail Id or mobile no. ";
        }
        else
        {

            lblerror.Text = "Please fill the Password ";
        }


       





    }

    protected void btndel(object sender, EventArgs e)
    {
        //residential

        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        Label lbid = (Label)item.FindControl("label_id");

        con.Open();
        SqlCommand cmddel = new SqlCommand("delete from Rpropertydata where Rproperty_id=" + lbid.Text + "", con);
        SqlCommand cmdel = new SqlCommand("delete from r_pimages where rproperty_id=" + lbid.Text + "", con);
        cmdel.ExecuteNonQuery();
        cmddel.ExecuteNonQuery();
        con.Close();
        gvview("Residential houses");
       
       

    }
    protected void btn_del(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        Label lbid = (Label)item.FindControl("labelid");

        con.Open();
        SqlCommand cmddel = new SqlCommand("delete from propertydata where property_id=" + lbid.Text + "", con);
        SqlCommand cmdel = new SqlCommand("delete from pimages where property_id=" + lbid.Text + "", con);
        cmdel.ExecuteNonQuery();
        cmddel.ExecuteNonQuery();
        con.Close();
        gvview("Apartment");
       
    }



    protected void imgbtresi_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        Label lbid = (Label)item.FindControl("labelid");
        Label lbtype = (Label)item.FindControl("lbltype");
        Response.Redirect(String.Format("imageedit.aspx?ilde={0}&tpyer={1}", lbid.Text, lbtype.Text));
        

        //con.Open();
        //SqlCommand cmd = new SqlCommand("select * from pimages where property_id=" + lbid.Text + "", con);
        //rep.DataSource = cmd.ExecuteReader();
        //rep.DataBind();
        //con.Close();


      
    }

    protected void imgbtr_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        Label lbid = (Label)item.FindControl("label_id");
        Label lbtype = (Label)item.FindControl("lbl_type");
        Response.Redirect(String.Format("imageedit.aspx?ilde={0}&tpyer={1}", lbid.Text, lbtype.Text));


        //con.Open();
        //SqlCommand cmd = new SqlCommand("select * from pimages where property_id=" + lbid.Text + "", con);
        //rep.DataSource = cmd.ExecuteReader();
        //rep.DataBind();
        //con.Close();



    }
    protected void experiencesub_Click(object sender, EventArgs e)
    {

    


        //try
        //{
        //    //Button btn = (Button)sender;
        //    //DataListItem item = (DataListItem)btn.NamingContainer;
        //    //Label lbid = (Label)item.FindControl("labelid");
        //    //RadioButtonList rbtnsold = (RadioButtonList)item.FindControl("rbtnsold");
        //    //TextBox sharefeed = (TextBox)item.FindControl("sharefeed");

        //    //string issold=rbtnsold.SelectedValue;
         

        //    //String feed = sharefeed.Text;




        //    con.Open();
        //    SqlCommand buyerfeedcmd = new SqlCommand("insert into sellerFeedback (property_id,issold,P_rating,sellerFeed,userid) values(" + lbid.Text + ",'" + issold + "'," + starvalue + ",'" + feed + "',"+uid+")", con);
        //   // Response.Write(buyerfeedcmd.CommandText);
        //    buyerfeedcmd.ExecuteNonQuery();
        //    con.Close();
        //}
        //catch
        //{
        //    Response.Write("<script>alert(\"Something Went wrong Please Try later\")</script>");

        //}
    }
    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        starvalue =Convert.ToInt32(e.Value);
    }
    protected void rexperiencesub_Click(object sender, EventArgs e)
    {

        try
        {
            Button btn = (Button)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lbid = (Label)item.FindControl("label_id");
            RadioButtonList rbtnsold = (RadioButtonList)item.FindControl("rbtnrsold");
            TextBox sharefeed = (TextBox)item.FindControl("rsharefeed");

            string issold=rbtnsold.SelectedValue;
          

            String feed = sharefeed.Text;




            con.Open();
            SqlCommand buyerfeedcmd = new SqlCommand("insert into sellerFeedback (property_id,issold,P_rating,sellerFeed,userid) values(" + lbid.Text + ",'" + issold + "'," + rstarvalue + ",'" + feed + "',"+uid+")", con);
           // Response.Write(buyerfeedcmd.CommandText);
            buyerfeedcmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "thank", "setTimeout(function(){$(\"modalsellerfeed\").modal('hide');$(\"saybye\").modal('show');},500)", true);
        }
        catch
        {
            Response.Write("<script>alert(\"Something Went wrong Please Try later\")</script>");

        }

        feedback = true;
    }
    protected void rRating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rstarvalue = Convert.ToInt32(e.Value);
    }
}