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
using System.Web.Services;


public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd,cmd1,cmd2,command,command1,command2;
    SqlDataAdapter da;

    int id;
    public static long priceApart, priceAsq,priceResi,priceRsq;
    public int insertsuccess,insertsuccess1;

   public static string newpost,newpost1;
    protected void Page_Load(object sender, EventArgs e)
    {
    //  ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:call();", true);
        if (!IsPostBack)
        {

            

            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();
            cmd = new SqlCommand("select * from state", con);
            da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "state");
            ddlstate.DataSource = ds.Tables[0];
            ddlstate.DataTextField = "statename";
            ddlstate.DataValueField = "stateid";
            ddlstate.DataBind();
            
           
            ddlstate.Items.Insert(0, new ListItem("--Select state--", "0"));

            SqlCommand comm = new SqlCommand("select activity1_newpost,activity2_entireproperty from useractivityblock where user_id=" + Convert.ToInt32(Session["id"]) + "", con);
            try
            {
               // newpost = comm.ExecuteScalar().ToString();

                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    newpost = dr["activity2_updproperty"].ToString();
                    newpost1 = dr["activity2_entireproperty"].ToString();
                }



                if (newpost == "Blocked" || newpost1 == "Blocked")
                {
                    msgwarn.Text = "You can't upload new properties on Magicplace.";
                    msgwarn1.Text = "Administrator has blocked you for any reason.";
                    ClientScript.RegisterStartupScript(this.GetType(), "activity", " $(document).ready(function(){  $(\"#warning\").modal(\"show\");  })", true);

                }
            }
            catch
            {
                 

            }
 con.Close();
        }

  

        int cn,cn1;
        cn = Convert.ToInt32(Session["redirect"]);
        cn1 = Convert.ToInt32(Session["predirect"]);
        string name = Convert.ToString(Session["user"]);
        id = Convert.ToInt32(Session["id"]);
      //  Response.Write(id);
    
 

      
    }
    protected void ddlproperty_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        cmd = new SqlCommand("select * from city where stateid=" + ddlstate.SelectedValue + "", con);
        da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "city");
        ddlcity.DataSource = ds.Tables[0];
        ddlcity.DataTextField = "cityname";
        ddlcity.DataValueField = "cityid";
        ddlcity.DataBind(); 
        con.Close();

        ddlcity.Items.Insert(0, new ListItem("--Select city--", "0"));
    }
    protected void ddlstate_DataBound(object sender, EventArgs e)
    {

    }
    protected void btnupl_Click(object sender, EventArgs e)
    {

        if (resivalidation())
        {
            if (newpost != "Blocked")
            {
                resiupload();
            }
            else
            {

                msgwarn.Text = "You can't upload new properties on Magicplace.";
                msgwarn1.Text = "Administrator has blocked you for any reason.";
                ClientScript.RegisterStartupScript(this.GetType(), "activity", " $(document).ready(function(){  $(\"#warning\").modal(\"show\");  })", true);


            }
        }
      
        
    }

   

    protected void resiupload()
    {
        String[] arr = new String[1];

        string type, forw, tran, poss, poss_date;
        List<String> photos = new List<string>();

        int p_includes, pro_id;

        if (rbtnagent.Checked)
        {
            type = "agent";
        }
        else if (rbtnbuilder.Checked)
        {
            type = "builder";
        }
        else
        {
            type = "simpleuser";
        }
        //---------------------------------------------------------------
        if (rbtnsell.Checked)
        {
            forw = "sell";
        }
        else if (rbtnrent.Checked)
        {
            forw = "rent";
        }
        else
        {
            forw = "PG";
        }
        //-----------------------------------------------------------------                                                     
        if (rbtnrnew.Checked)
        {
            tran = "New property";
        }
        else
        {
            tran = "Rescale";
        }
        if (rbtnruconstruction.Checked)
        {
            poss = "under construction";
        }
        else
        {
            poss = "Ready to move";
        }


        if (chkrcarpark.Checked && chkrclub.Checked)
        {
            p_includes = 2;
        }
        else if (chkrcarpark.Checked)
        {
            p_includes = 1;
        }
        else
        {
            p_includes = 0;
        }
        poss_date = ddlrmonth.SelectedValue + "/" + ddlryear.SelectedValue;

        try
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();

            foreach (HttpPostedFile postedFile in fuload.PostedFiles)
            {
                string fname = Path.GetFileName(postedFile.FileName);
                postedFile.SaveAs(Server.MapPath("~/up_image_rhouses/") + fname);
                photos.Add("~/up_image_rhouses/" + fname.ToString());

            }

            if (photos.Count <= 8)
            {
                String postingdate = DateTime.Now.ToString("dddd, dd MMMM yyyy,hh:mm tt");

                SqlCommand cm = new SqlCommand("insert into Rpropertydata (Rproperty_for,Rproperty_type,Ruser_type,Rstate,Rcity,Rlocality,Rbedrooms,Rbalconies,Rfloor_no,Rfurnished_status,Rbathroom,Rfloor_allowed,Rcovered_area,Rcover_area_unit,Rplot_area,Rplot_area_unit,Rtransaction_type,Rpossession_status,Rconstruct_complete,RAge_of_construction,Rexpected_price,Rprice_sqft,Rprice_includes,Ruser_id,address,landmark,flooring,statusOfElectricity,posting_date,RfirstPostImg) values('" + forw + "','" + ddlproperty.SelectedItem + "','" + type + "','" + ddlstate.SelectedItem + "','" + ddlcity.SelectedItem + "','" + txtlocality.Text + "'," + ddlrbed.SelectedValue + "," + ddlrbalony.SelectedValue + "," + ddlrfloor.SelectedValue + ",'" + ddlrfurnish.SelectedValue + "'," + ddlrbathroom.SelectedValue + "," + ddlrfloors.SelectedValue + "," + txtrcoverarea.Text + ",'" + ddlrcoverarea.SelectedValue + "'," + txtrplotarea.Text + ",'" + ddlrplotarea.SelectedValue + "','" + tran + "','" + poss + "','" + poss_date + "','" + ddlrage.SelectedValue + "'," + priceResi + "," + priceRsq + "," + p_includes + "," + id + ",'" + txtRaddress.Text + "','" + txtRlandmark.Text + "','" + txtrflooring.Text + "','" + ddlrelectricity.SelectedValue + "','" + postingdate + "','" + photos[0] + "')", con);

                //  Response.Write(cm.CommandText);
                insertsuccess = cm.ExecuteNonQuery();

                cmd2 = new SqlCommand("select Rproperty_id from Rpropertydata where Ruser_id=" + id + " and Rexpected_price=" + priceResi + " and address='" + txtRaddress.Text + "' and landmark='" + txtRlandmark.Text + "'", con);
                //  Response.Write(cmd2.CommandText);

                pro_id = Convert.ToInt32(cmd2.ExecuteScalar());


                for (int i = 0; i < photos.Count; i++)
                {
                    cmd = new SqlCommand("insert into r_pimages (imgname,rproperty_id) values('" + photos[i] + "'," + pro_id + ")", con);
                    //cmd.Parameters.AddWithValue("@imgpath",imgfile);
                    //  Response.Write(cmd.CommandText);
                    cmd.ExecuteNonQuery();

                    //Response.Write("successfully");
                }
                error.InnerHtml = "";
            }
            else
            {

                error.InnerHtml = "Only 8 images are allowed,you have selected more than 8";

            }
            con.Close();
        }

        //string str = "your property details has saved";

        //string content = "window.onload=function(){alert('";
        //content += str;
        //content += "');";

        //content += "window.location='";
        //content += Request.Url.AbsoluteUri;
        //content += "';}";
        //ClientScript.RegisterStartupScript(this.GetType(), "successmessage", content, true);

        catch
        {

            error.InnerHtml = "something went grong,so try again";
        }


    }


    protected bool resivalidation()
    {
        bool valid = true;
        int cnt = 0;
        // Response.Write("<script>alert(\""+bedr.SelectedValue+"\")</script>");
        if (rbtnuser.Checked)
        {
            cnt += 1;
        }
        if (rbtnagent.Checked)
        {
            cnt += 1;
        }
        if (rbtnbuilder.Checked)
        {

            cnt += 1;
        }

        if (cnt > 0)
        {
            areyou.InnerHtml = "";
        }
        else
        {
            valid = false;
            areyou.InnerHtml = "Select User Type ";
        }




        int cnt1 = 0;

        if (rbtnsell.Checked)
        {

            cnt1 += 1;
        }
        if (rbtnrent.Checked)
        {
            cnt1 += 1;

        }
        if (rbtnpg.Checked)
        {

            cnt1 += 1;
        }

        if (cnt1 > 0)
        {
            Pfor.InnerHtml = "";

        }
        else
        {
            Pfor.InnerHtml = "Select Property For";
            valid = false;
        }

        if (ddlstate.SelectedValue == "0")
        {
            valid = false;
            vstate.InnerHtml = "Select State";
        }
        else
        {
            vstate.InnerHtml = "";

        }

        if (ddlcity.SelectedValue == "0")
        {
            valid = false;
            vcity.InnerHtml = "Select State";
        }

        else
        {
            vcity.InnerHtml = "";

        }

        if (string.IsNullOrEmpty(txtlocality.Text))
        {
            valid = false;
            locality.InnerHtml = "Please fill locality";


        }
        else
        {

            locality.InnerHtml = "";

            
        }
    

        if (string.IsNullOrEmpty(txtRaddress.Text))
        {
            valid = false;
            raddress.InnerHtml = "Please fill Address";


        }
        else
        {

            raddress.InnerHtml = "";
        }

        if (string.IsNullOrEmpty(txtRlandmark.Text))
        {
            valid = false;
            rlandmark.InnerHtml = "Please fill Landmark area";


        }
        else
        {

            rlandmark.InnerHtml = "";
        }


        if (ddlrbed.SelectedValue == "0")
        {
            rbedroom.InnerHtml = "Choose Bedrooms";
            valid = false;

        }
        else
        {

            rbedroom.InnerHtml = "";
        }
        if (ddlrbalony.SelectedValue == "0")
        {
            rbalcony.InnerHtml = "Choose balcony";
            valid = false;

        }
        else
        {

            rbalcony.InnerHtml = "";
        }


        if (ddlrfloor.SelectedValue == "0")
        {
            rfloor.InnerHtml = "Choose floor no";
            valid = false;

        }
        else
        {

            rfloor.InnerHtml = "";
        }

        if (ddlrfloors.SelectedValue == "0")
        {
            rfloorsallowed.InnerHtml = "Choose floor no";
            valid = false;

        }
        else
        {

            floorno.InnerHtml = "";
        }

        if (ddlrfurnish.SelectedValue == "0")
        {
            rfurnish.InnerHtml = "Choose furnished status";
            valid = false;

        }
        else
        {

            rfurnish.InnerHtml = "";
        }

        if (ddlrbathroom.SelectedValue == "0")
        {
            rbathroom.InnerHtml = "Choose Bathrooms";
            valid = false;

        }
        else
        {

            rbathroom.InnerHtml = "";
        }


        if (string.IsNullOrEmpty(txtrflooring.Text))
        {

            valid = false;
            rflooring.InnerHtml = "Choose Floor type";
        }
        else
        {
            rflooring.InnerHtml = "";
        }


        if (ddlrelectricity.SelectedValue == "0")
        {
            relectricity.InnerHtml = "Choose Electricity Status";
            valid = false;

        }
        else
        {

            relectricity.InnerHtml = "";
        }


        if (string.IsNullOrEmpty(txtrcoverarea.Text))
        {

            valid = false;
            rcoverarea.InnerHtml = "Choose Floor type";
        }
        else
        {
            rcoverarea.InnerHtml = "";
        }


        if (string.IsNullOrEmpty(txtrplotarea.Text))
        {

            valid = false;
            rplotarea.InnerHtml = "Choose Floor type";
        }
        else
        {
            rplotarea.InnerHtml = "";
        }

        int cnt2 = 0;

        if (rbtnrnew.Checked)
        {

            cnt2 += 1;
        }

        if (rbtnrrescale.Checked)
        {

            cnt2 += 1;
        }

        if (cnt2 > 0)
        {
            rtransaction.InnerHtml = "";

        }
        else
        {

            valid = false;
            rtransaction.InnerHtml = "Select Transaction Type";
        }

        int cnt3 = 0, cnt4 = 0, cnt5 = 0;

        if (rbtnruconstruction.Checked)
        {
            cnt3 = 0;
            cnt3 += 1;

            if (ddlrmonth.SelectedValue == "none" && ddlryear.SelectedValue == "none")
            {

                cnt4 += 1;
            }
            else if (ddlrmonth.SelectedValue == "none")
            {
                cnt4 += 1;
            }
            else if (ddlryear.SelectedValue == "none")
            {
                cnt4 += 1;
            }

            if (cnt4 > 0)
            {
                ruconstruct.InnerHtml = "Select Month and Year";
                valid = false;
            }
            else
            {

                ruconstruct.InnerHtml = "";
            }

        }

        if (rbtnrmove.Checked)
        {
            cnt3 = 0;
            cnt3 += 1;

            if (ddlrage.SelectedValue == "none")
            {
                cnt5 += 1;

            }


            if (cnt5 > 0)
            {

                possessmsg.InnerHtml = "Select Age of Property";
                valid = false;
            }

            else
            {
                possessmsg.InnerHtml = "";

            }


        }

        if (cnt3 > 0)
        {
            rpossession.InnerHtml = "";

        }
        else
        {

            rpossession.InnerHtml = "Select possession Status";
            valid = false;
        }

        if (string.IsNullOrEmpty(txtrprice.Text))
        {

            rprice.InnerHtml = "Enter the Expected Price";
            valid = false;
        }
        else
        {
            rprice.InnerHtml = "";
        }

        if (string.IsNullOrEmpty(txtpersqft.Text))
        {
            rpricepersqft.InnerHtml = "Enter the Expected Price of per Sq-ft";
            valid = false;
        }
        else
        {
            rpricepersqft.InnerHtml = "";
        }

        if (!fuload.HasFile)
        {
            valid = false;
            rfileres.InnerHtml = "Please upload some photos with property data";
        }

        return valid;

    }

    protected void Buttsub_Click(object sender, EventArgs e)
    {
        if (apartvalidation())
        {
            if (newpost != "Blocked")
            {
                apartmentupload();
            }

            else
            {
                msgwarn.Text = "You can't upload new properties on Magicplace.";
                msgwarn1.Text = "Administrator has blocked you for any reason.";
                ClientScript.RegisterStartupScript(this.GetType(), "activity", " $(document).ready(function(){  $(\"#warning\").modal(\"show\");  })", true);


            }
        }
       

         
        
    }

    protected bool apartvalidation()
    {

        bool valid = true;
        int cnt = 0;
       // Response.Write("<script>alert(\""+bedr.SelectedValue+"\")</script>");
        if (rbtnuser.Checked)
        {
            cnt += 1;
        }
        if (rbtnagent.Checked)
        {
            cnt += 1;
        }
        if (rbtnbuilder.Checked)
        {

            cnt += 1;
        }

        if (cnt > 0)
        {
            areyou.InnerHtml = "";
        }
        else
        {
            valid = false;
            areyou.InnerHtml = "Select User Type ";
        }




        int cnt1 = 0;

        if (rbtnsell.Checked)
        {

            cnt1 += 1;
        }
        if (rbtnrent.Checked)
        {
            cnt1 += 1;

        }
        if (rbtnpg.Checked)
        {

            cnt1 += 1;
        }

        if (cnt1 > 0)
        {
            Pfor.InnerHtml = "";

        }
        else
        {
            Pfor.InnerHtml = "Select Property For";
            valid = false;
        }

        if (ddlstate.SelectedValue == "0")
        {
            valid = false;
            vstate.InnerHtml = "Select State";
        }
        else
        {
            vstate.InnerHtml = "";

        }

        if (ddlcity.SelectedValue == "0")
        {
            valid = false;
            vcity.InnerHtml = "Select State";
        }

        else
        {
            vcity.InnerHtml = "";

        }

        if (string.IsNullOrEmpty(txtlocality.Text))
        {
            valid = false;
            locality.InnerHtml = "Please fill locality";


        }
        else
        {

            locality.InnerHtml = "";
        }
        if (string.IsNullOrEmpty(txtapart.Text))
        {
            valid = false;
            aname.InnerHtml = "Please fill Apartment name";


        }
        else
        {

            aname.InnerHtml = "";
        }

        if (string.IsNullOrEmpty(txtaddress.Text))
        {
            valid = false;
            address.InnerHtml = "Please fill Address";


        }
        else
        {

            address.InnerHtml = "";
        }

        if (string.IsNullOrEmpty(txtlandmark.Text))
        {
            valid = false;
            landmark.InnerHtml = "Please fill Landmark Area";


        }
        else
        {

            landmark.InnerHtml = "";
        }


        if (bedr.SelectedValue== "0")
        {
            bedroom.InnerHtml = "Choose Bedrooms";
            valid = false;

        }
        else
        {

            bedroom.InnerHtml = "";
        }
        if (balcony.SelectedValue == "0")
        {
            balconies.InnerHtml = "Choose balcony";
            valid = false;

        }
        else
        {

            balconies.InnerHtml = "";
        }


        if (floor.SelectedValue == "0")
        {
            floorno.InnerHtml = "Choose floor no";
            valid = false;

        }
        else
        {

            floorno.InnerHtml = "";
        }


        if (furnish.SelectedValue == "0")
        {
            furnis.InnerHtml = "Choose furnished status";
            valid = false;

        }
        else
        {

            furnis.InnerHtml = "";
        }

        if (bathroom.SelectedValue == "0")
        {
            bath.InnerHtml = "Choose Bathrooms";
            valid = false;

        }
        else
        {

            bath.InnerHtml = "";
        }


        if (string.IsNullOrEmpty(txtflooring.Text))
        {

            valid = false;
            floortype.InnerHtml = "Choose Floor type";
        }
        else
        {
            floortype.InnerHtml = "";
        }


        if (ddlelectricity.SelectedValue == "0")
        {
            stelec.InnerHtml = "Choose Electricity Status";
            valid = false;

        }
        else
        {

            stelec.InnerHtml = "";
        }


        if (string.IsNullOrEmpty(txtcoverarea.Text))
        {

            valid = false;
            coverar.InnerHtml = "Choose Floor type";
        }
        else
        {
            coverar.InnerHtml = "";
        }


        if (string.IsNullOrEmpty(txtplotarea.Text))
        {

            valid = false;
            plotar.InnerHtml = "Choose Floor type";
        }
        else
        {
            plotar.InnerHtml = "";
        }

        int cnt2 = 0;

        if (rbtnnew.Checked)
        {

            cnt2 += 1;
        }

        if (rbtnscale.Checked)
        {

            cnt2 += 1;
        }

        if (cnt2 > 0)
        {
            trType.InnerHtml = "";

        }
        else
        {

            valid = false;
            trType.InnerHtml = "Select Transaction Type";
        }

        int cnt3 = 0, cnt4 = 0, cnt5 = 0;

        if (rbtnstatus1.Checked)
        {
            cnt3 = 0;
            cnt3 += 1;

            if (ddlmon.SelectedValue == "none" && ddlyear.SelectedValue == "none")
            {

                cnt4 += 1;
            }
            else if (ddlmon.SelectedValue == "none")
            {
                cnt4 += 1;
            }
            else if (ddlyear.SelectedValue == "none")
            {
                cnt4 += 1;
            }

            if (cnt4 > 0)
            {
                possessmsg.InnerHtml = "Select Month and Year";
                valid = false;
            }
            else
            {

                possessmsg.InnerHtml = "";
            }

        }

        if (rbtnstatus2.Checked)
        {
            cnt3 = 0;
            cnt3 += 1;

            if (ddlbuildage.SelectedValue == "none")
            {
                cnt5 += 1;

            }


            if (cnt5 > 0)
            {

                possessmsg.InnerHtml = "Select Age of Property";
                valid = false;
            }

            else
            {
                possessmsg.InnerHtml = "";

            }


        }

        if (cnt3 > 0)
        {
            possess.InnerHtml = "";

        }
        else
        {

            possess.InnerHtml = "Select possession Status";
            valid = false;
        }

        if (string.IsNullOrEmpty(txtprice.Text))
        {

            lblprice.InnerHtml = "Enter the Expected Price";
            valid = false;
        }
        else
        {
            lblprice.InnerHtml = "";
           // string regex="/^[0-9]+$/";

        }

        if (string.IsNullOrEmpty(txtsq.Text))
        {
            lblsq.InnerHtml = "Enter the Expected Price of per Sq-ft";
            valid = false;
        }
        else
        {
            lblsq.InnerHtml = "";
        }

        if (!Fileload.HasFile)
        {
            valid = false;
            fileres.InnerHtml = "Please upload some Images with the property data";

        }

        return valid;

    }


    protected void apartmentupload()
    {
        string type, forw, tran, poss, poss_date;
        int p_includes, pro_id;
        List<String> photos = new List<string>();

        if (rbtnagent.Checked)
        {
            type = "agent";
        }
        else if (rbtnbuilder.Checked)
        {
            type = "builder";
        }
        else
        {
            type = "simpleuser";
        }
        //---------------------------------------------------------------
        if (rbtnsell.Checked)
        {
            forw = "sell";
        }
        else if (rbtnrent.Checked)
        {
            forw = "rent";
        }
        else
        {
            forw = "PG";
        }
        //-----------------------------------------------------------------                                                     
        if (rbtnnew.Checked)
        {
            tran = "New property";
        }
        else
        {
            tran = "Rescale";
        }
        if (rbtnstatus1.Checked)
        {
            poss = "under construction";
        }
        else
        {
            poss = "Ready to move";
        }


        if (chkcarp.Checked && chkclub.Checked)
        {
            p_includes = 2;
        }
        else if (chkcarp.Checked)
        {
            p_includes = 1;
        }
        else
        {
            p_includes = 0;
        }
        poss_date = ddlmon.SelectedValue + "/" + ddlyear.SelectedValue;
        try
        {

            foreach (HttpPostedFile postedFile in Fileload.PostedFiles)
            {
                string fname = Path.GetFileName(postedFile.FileName);
                postedFile.SaveAs(Server.MapPath("~/up_image/") + fname);
                photos.Add("~/up_image/" + fname.ToString());

            }
            if (photos.Count <= 8)
            {

                String postingdate = DateTime.Now.ToString("dddd, dd MMMM yyyy,hh:mm tt");
                con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
                con.Open();
                cmd1 = new SqlCommand("insert into propertydata (property_for,property_type,user_type,state,city,locality,bedrooms,balconies,floor_no,furnished_status,bathroom,covered_area,cover_area_unit,plot_area,plot_area_unit,transaction_type,possession_status,construct_complete,Age_of_construction,expected_price,price_sqft,price_includes,user_id,address,landmark,flooring,statusOfElectricity,lift,posting_date,propertyName,propertyFirstImg) values('" + forw + "','" + ddlproperty.SelectedItem + "','" + type + "','" + ddlstate.SelectedItem + "','" + ddlcity.SelectedItem + "','" + txtlocality.Text + "'," + bedr.SelectedValue + "," + balcony.SelectedValue + "," + floor.SelectedValue + ",'" + furnish.SelectedValue + "'," + bathroom.SelectedValue + "," + txtcoverarea.Text + ",'" + ddlunit.SelectedValue + "'," + txtplotarea.Text + ",'" + ddlunit2.SelectedValue + "','" + tran + "','" + poss + "','" + poss_date + "','" + ddlbuildage.SelectedValue + "'," + priceApart + "," + priceAsq + "," + p_includes + "," + id + ",'" + txtaddress.Text + "','" + txtlandmark.Text + "','" + txtflooring.Text + "','" + ddlelectricity.SelectedValue + "','" + lift.SelectedItem + "','" + postingdate + "','" + txtapart.Text + "','" + photos[0] + "')", con);
                cmd2 = new SqlCommand("select property_id from propertydata where user_id=" + id + " and expected_price=" + priceApart + " and address='" + txtaddress.Text + "' and landmark='" + txtlandmark.Text + "'", con);
                //Response.Write(cmd1.CommandText);
                insertsuccess1 = cmd1.ExecuteNonQuery();
                pro_id = Convert.ToInt32(cmd2.ExecuteScalar());




                for (int i = 0; i < photos.Count; i++)
                {
                    cmd = new SqlCommand("insert into pimages (imgname,property_id) values('" + photos[i] + "'," + pro_id + ")", con);
                    //cmd.Parameters.AddWithValue("@imgpath",imgfile);
                  //  Response.Write(cmd.CommandText);
                    cmd.ExecuteNonQuery();
                }
                error.InnerHtml = "";

            }
            else
            {

                error.InnerHtml = "Only 8 images are allowed,you have selected more than 8";
            }


            con.Close();
        }



        catch
        {
            error.InnerHtml = "something went grong,so try again";

        }


    }
    
    protected void ddlunit2_SelectedIndexChanged(object sender, EventArgs e)
    {

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

        try
        {
            if (txtid.Text != "" && txtid.Text != null && txtpass.Text!="" && txtpass.Text!=null)
            {

                con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
                con.Open();

                if (Char.IsLetter(txtid.Text, 1))
                {
                    command = new SqlCommand("select count(*) from simpleuserregister where email='" + txtid.Text + "' and password='" + pass + "'", con);
                    command1 = new SqlCommand("select username from simpleuserregister where email='" + txtid.Text + "'", con);
                    command2 = new SqlCommand("select id from simpleuserregister where email='" + txtid.Text + "'", con);


                }
                else
                {
                    command = new SqlCommand("select count(*) from simpleuserregister where contactno=" + txtid.Text + " and password='" + pass + "'", con);
                    command1 = new SqlCommand("select username from simpleuserregister where contactno=" + txtid.Text + "", con);
                    command2 = new SqlCommand("select id from simpleuserregister where contactno=" + txtid.Text + "", con);
                }

                int cnt, cnt3;
                string name;
                cnt = Convert.ToInt32(command.ExecuteScalar());
                //  lblerror.Text = Convert.ToString(cnt);
                cnt3 = Convert.ToInt32(command2.ExecuteScalar());
                name = Convert.ToString(command1.ExecuteScalar());

                con.Close();

                if (cnt == 1)
                {


                    lblerror.Text = "successfuly";
                    Session["id"] = cnt3;
                    Session["user"] = name;

                    ((MasterPage)Master).getdata.Text = name;


                    Response.Redirect("postproperty.aspx");
                }
                else
                {
                    lblerror.Text = "invalid";
                }
            }
            else if (txtid.Text == "")
            {
                lblerror.Text = "Please fill mobile no.or e-mail";
                 
            }
            else if(txtpass.Text=="")
            {

                lblerror.Text = "Please fill the password";
            }
            else
            {
                lblerror.Text = "Both fields are required";


            }
        }
        catch
        {

            error.InnerHtml = "Something wrong, Please try again";
        }
    }



    protected int validatePart1()
    {




        return 0;
    }

    protected void txtprice_TextChanged(object sender, EventArgs e)
    {
        //try
        //{

        //    int value = Convert.ToInt32(txtprice.Text);
        //    priceApart = value;
        //    String s1 = string.Format("{0:n}", value);
        //    txtprice.Text = s1;
        //}
        //catch
        //{
        //    Response.Write("<script>alert(\"Invalid Price in Expected price\")</script>");
        //}
        

    }
    protected void txtsq_TextChanged(object sender, EventArgs e)
    {
        //try{

        //int value = Convert.ToInt32(txtsq.Text);
        //priceAsq = value;
        //String s1 = string.Format("{0:n}", value);
        //txtsq.Text = s1;
        //}
        //catch
        //{
        //    Response.Write("<script>alert(\"Invalid Price in Price per Sqft\")</script>");
        //}


    }
    protected void txtrprice_TextChanged(object sender, EventArgs e)
    {
        //try{

        //priceResi = Convert.ToInt32(txtrprice.Text);
        //String s1 = string.Format("{0:n}",priceResi);
        //txtrprice.Text = s1;
        //}
        //catch
        //{
        //    Response.Write("<script>alert(\"Invalid Price in Expected price\")</script>");
        //}
    }
    protected void txtpersqft_TextChanged(object sender, EventArgs e)
    {
        //try{
        //priceRsq = Convert.ToInt32(txtpersqft.Text);
        //String s1 = string.Format("{0:n}", priceRsq);
        //txtpersqft.Text = s1;
        //}
        //catch
        //{
        //    Response.Write("<script>alert(\"Invalid Price in Price per Sqft\")</script>");
        //}
    }

    [WebMethod]
    public static string convertcur(string cur)
   {

        string newcur="";
        string news1 = "";
        try
        {


            if (cur == "")
            {

                newcur = "0";
            }
            else
            {

                foreach (char s in cur)
                {
                    if (s != ',')
                    {
                        newcur += s;

                    }
                    else
                    {
                        continue;
                    }

                }
            }

            priceResi = Convert.ToInt64(newcur);
            string s1 = string.Format("{0:n}", priceResi);
            List<char> curr = new List<char>();
            for (int i = 0; i < s1.Length; i++)
            {
                if (s1[i] != '.')
                {

                    curr.Add(s1[i]);
                }
                else
                {

                    break;
                }
            }

            foreach (char s in curr)
            {

                news1 += s;
            }


            return news1;
        }
        catch
        {

            return news1;

        }
    }

    [WebMethod]
    public static string convertcursqft(string cur)
    {

        string newcur = "";

        if (cur == "")
        {

            newcur = "0";
        }
        else
        {

            foreach (char s in cur)
            {
                if (s != ',')
                {
                    newcur += s;

                }
                else
                {
                    continue;
                }

            }

        }
        priceRsq = Convert.ToInt64(newcur);
        string s1 = string.Format("{0:n}", priceRsq);
        List<char> curr = new List<char>();
        for (int i = 0; i < s1.Length; i++)
        {
            if (s1[i] != '.')
            {

                curr.Add(s1[i]);
            }
            else
            {

                break;
            }
        }
        string news1 = "";
        foreach (char s in curr)
        {

            news1 += s;
        }


        return news1;
    }

    [WebMethod]
    public static string convertcurapart(string cur)
    {

        string newcur = "";

        if (cur == "")
        {

            newcur = "0";
        }
        else
        {

            foreach (char s in cur)
            {
                if (s != ',')
                {
                    newcur += s;

                }

                else
                {
                    continue;
                }



            }

        }

        priceApart = Convert.ToInt64(newcur);
        string s1 = string.Format("{0:n}", priceApart);
        List<char> curr = new List<char>();
        for (int i = 0; i < s1.Length; i++)
        {
            if (s1[i] != '.')
            {

                curr.Add(s1[i]);
            }
            else
            {

                break;
            }
        }
        string news1 = "";
        foreach (char s in curr)
        {

            news1 += s;
        }


        return news1;
    }

    [WebMethod]
    public static string convertcurapartsqft(string cur)
    {

        string newcur = "";

        if (cur == "")
        {

            newcur = "0";
        }
        else
        {

            foreach (char s in cur)
            {
                if (s != ',')
                {
                    newcur += s;

                }
                else
                {
                    continue;
                }

            }
        }

        priceAsq= Convert.ToInt64(newcur);
        string s1 = string.Format("{0:n}", priceAsq);
        List<char> curr = new List<char>();
        for (int i = 0; i < s1.Length; i++)
        {
            if (s1[i] != '.')
            {

                curr.Add(s1[i]);
            }
            else
            {

                break;
            }
        }
        string news1 = "";
        foreach (char s in curr)
        {

            news1 += s;
        }


        return news1;
    }


  
}