using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;


public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd, cmd1, cmd2, cmd3, cmd4, cmd5, pdata1, pdata2, pdata3, pdata4, pdata5, pdata6, adata1, adata2, adata3, adata4, adata5, adata6;
    SqlDataReader dr;
    int[] id;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
   
        cmd = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1000", con);
        cmd1 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1002", con);
        cmd2 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1007", con);
        cmd3 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1004", con);
        cmd4 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1008", con);
        cmd5 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1009", con);


        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            string imgnam = Convert.ToString(dr["propertyFirstImg"]);
            int a = (int)dr["property_id"];
            String type = Convert.ToString(dr["property_type"]);

            img1.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}",a,type);
            img1.ImageUrl = imgnam;
        }
        dr.Close();

        dr = cmd1.ExecuteReader();
        while (dr.Read())
        {
            string imgnam1 = Convert.ToString(dr["propertyFirstImg"]);
            int a = (int)dr["property_id"];
            String type1 = Convert.ToString(dr["property_type"]);
            img2.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type1);
            img2.ImageUrl = imgnam1;
        }
        dr.Close();

        dr = cmd2.ExecuteReader();
        while (dr.Read())
        {
            string imgnam2 = Convert.ToString(dr["propertyFirstImg"]);
            int a = (int)dr["property_id"];
            String type2 = Convert.ToString(dr["property_type"]);
            img3.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type2);
            img3.ImageUrl = imgnam2;
        }
        dr.Close();

        dr = cmd3.ExecuteReader();
        while (dr.Read())
        {
            string imgnam3 = Convert.ToString(dr["propertyFirstImg"]);
            int a = (int)dr["property_id"];
            String type3 = Convert.ToString(dr["property_type"]);
            img4.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type3);
            img4.ImageUrl = imgnam3;
        }
        dr.Close();

        dr = cmd4.ExecuteReader();
        while (dr.Read())
        {
            string imgnam4 = Convert.ToString(dr["propertyFirstImg"]);
            int a = (int)dr["property_id"];
            String type4 = Convert.ToString(dr["property_type"]);
            img5.PostBackUrl =String.Format("property_result.aspx?id={0}&type={1}",a,type4);
            img5.ImageUrl = imgnam4;
        }
        dr.Close();

        dr = cmd5.ExecuteReader();
        while (dr.Read())
        {
            string imgnam5 = Convert.ToString(dr["propertyFirstImg"]);
            int a = (int)dr["property_id"];
            String type5 = Convert.ToString(dr["property_type"]);
            img6.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type5);
            img6.ImageUrl = imgnam5;
        }
        dr.Close();

       
        
   

        //pdata1 = new SqlCommand("select  from propertydata where property_id in(select property_id from pimages where imgid=17)", con);

        pdata1 = new SqlCommand("select property_type from propertydata where property_id in(select property_id from pimages where imgid=18)", con);
       lblimg1.Text="Property type-"+Convert.ToString(pdata1.ExecuteScalar());
       pdata2 = new SqlCommand("select property_type from propertydata where property_id in(select property_id from pimages where imgid=21)", con);
       lblimg2.Text ="Property type-" +Convert.ToString(pdata2.ExecuteScalar());
       pdata3 = new SqlCommand("select property_type from propertydata where property_id in(select property_id from pimages where imgid=20)", con);
       lblimg3.Text = "Property type-" + Convert.ToString(pdata1.ExecuteScalar());
       pdata4 = new SqlCommand("select property_type from propertydata where property_id in(select property_id from pimages where imgid=22)", con);
       lblimg4.Text = "Property type-" + Convert.ToString(pdata1.ExecuteScalar());
       pdata5 = new SqlCommand("select property_type from propertydata where property_id in(select property_id from pimages where imgid=23)", con);
       lblimg5.Text = "Property type-" + Convert.ToString(pdata1.ExecuteScalar());
       pdata6 = new SqlCommand("select property_type from propertydata where property_id in(select property_id from pimages where imgid=24)", con);
       lblimg6.Text = "Property type-" + Convert.ToString(pdata1.ExecuteScalar());


        //address of property

       adata1 = new SqlCommand("select locality,city from propertydata where property_id in(select property_id from pimages where imgid=18)", con);
       dr = adata1.ExecuteReader();
       
       while (dr.Read())
       {
           lblimg1_1.Text = (string)dr["locality"] + "," + (string)dr["city"];
       }

       dr.Close();
       adata2 = new SqlCommand("select locality,city from propertydata where property_id in(select property_id from pimages where imgid=21)", con);
       dr = adata2.ExecuteReader();
       while (dr.Read())
       {
           lblimg2_1.Text = (string)dr["locality"] + "," + (string)dr["city"];
       }
       dr.Close();

       adata3 = new SqlCommand("select locality,city from propertydata where property_id in(select property_id from pimages where imgid=20)", con);
       dr = adata3.ExecuteReader();
       while (dr.Read())
       {
           lblimg3_1.Text = (string)dr["locality"] + "," + (string)dr["city"];
       }
       dr.Close();
       adata4 = new SqlCommand("select locality,city from propertydata where property_id in(select property_id from pimages where imgid=22)", con);
       dr = adata4.ExecuteReader();
       while (dr.Read())
       {
           lblimg4_1.Text = (string)dr["locality"] + "," + (string)dr["city"];
       }
       dr.Close();
       adata5 = new SqlCommand("select locality,city from propertydata where property_id in(select property_id from pimages where imgid=23)", con);
       dr = adata5.ExecuteReader();
       while (dr.Read())
       {
           lblimg5_1.Text = (string)dr["locality"] + "," + (string)dr["city"];
       }
       dr.Close();

       adata6 = new SqlCommand("select locality,city from propertydata where property_id in(select property_id from pimages where imgid=24)", con);
       dr = adata6.ExecuteReader();
       while (dr.Read())
       {
           lblimg6_1.Text = (string)dr["locality"] + "," + (string)dr["city"];
       }
       dr.Close();



        con.Close();
//  price--------------------------------------------------------------------------------------------------------------------------------------------------

        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        adata1 = new SqlCommand("select expected_price from propertydata where property_id in(select property_id from pimages where imgid=18)", con);
        dr = adata1.ExecuteReader();
        //string s1="";
        while (dr.Read())
        {
            //int n = Convert.ToInt32(dr["expected_price"]);
            //s1 = string.Format("{0:n}", n);
            //lblimg1_2.Text = "Rs " + s1;


            string fare = dr["expected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            lblimg1_2.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close();
//-------------------------------------------------------------------
        adata2 = new SqlCommand("select expected_price from propertydata where property_id in(select property_id from pimages where imgid=21)", con);
        dr = adata2.ExecuteReader();
        //string s2 = "";
        while (dr.Read())
        {
            //int n = Convert.ToInt32(dr["expected_price"]);
            //s2 = string.Format("{0:n}", n);
            //lblimg2_2.Text = "Rs " + s2;
            string fare = dr["expected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            lblimg2_2.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close();

        //-------------------------------------------------------------------
        adata3 = new SqlCommand("select expected_price from propertydata where property_id in(select property_id from pimages where imgid=20)", con);
        dr = adata3.ExecuteReader();
       // string s3 = "";
        while (dr.Read())
        {
            //int n = Convert.ToInt32(dr["expected_price"]);
            //s3 = string.Format("{0:n}", n);
            //lblimg3_2.Text = "Rs " + s3;

            string fare = dr["expected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            lblimg3_2.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close();

        //-------------------------------------------------------------------
        adata4 = new SqlCommand("select expected_price from propertydata where property_id in(select property_id from pimages where imgid=22)", con);
        dr = adata4.ExecuteReader();
       // string s4 = "";
        while (dr.Read())
        {
            //int n = Convert.ToInt32(dr["expected_price"]);
            //s4= string.Format("{0:n}", n);
            //lblimg4_2.Text = "Rs " + s4;


            string fare = dr["expected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            lblimg4_2.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close();
        //-------------------------------------------------------------------
        adata5= new SqlCommand("select expected_price from propertydata where property_id in(select property_id from pimages where imgid=23)", con);
        dr = adata5.ExecuteReader();
      //  string s5 = "";
        while (dr.Read())
        {
            //int n = Convert.ToInt32(dr["expected_price"]);
            //s5 = string.Format("{0:n}", n);
            //lblimg5_2.Text = "Rs "+s5;

            string fare = dr["expected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            lblimg5_2.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close();
        //-------------------------------------------------------------------
        adata6 = new SqlCommand("select expected_price from propertydata where property_id in(select property_id from pimages where imgid=24)", con);
        dr = adata6.ExecuteReader();
     //   string s6= "";
        while (dr.Read())
        {
            //int n = Convert.ToInt32(dr["expected_price"]);
            //s6 = string.Format("{0:n}", n);
            //lblimg6_2.Text = "Rs " + s6;

            string fare = dr["expected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            lblimg6_2.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close(); 




        //-------------------------------------------------------Residential houses--------------------
         cmd = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1000", con);
        cmd1 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1002", con);
        cmd2 = new SqlCommand("select propertyFirstImg,property_type,property_id from propertydata where property_id=1007", con);


        SqlCommand cmdr1 = new SqlCommand("select RfirstPostImg,Rproperty_type,Rlocality,Rcity,Rexpected_price,Rproperty_id from Rpropertydata where Rproperty_id=3000", con);

        SqlCommand cmdr2 = new SqlCommand("select RfirstPostImg,Rproperty_type,Rlocality,Rcity,Rexpected_price,Rproperty_id from Rpropertydata where Rproperty_id=3016", con);

        SqlCommand cmdr3 = new SqlCommand("select RfirstPostImg,Rproperty_type,Rlocality,Rcity,Rexpected_price,Rproperty_id from Rpropertydata where Rproperty_id=3017", con);
        
        dr = cmdr1.ExecuteReader();
        while (dr.Read())
        {
         
            int a = (int)dr["Rproperty_id"];
            String type = Convert.ToString(dr["Rproperty_type"]);

            rimg.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type);
            rimg.ImageUrl =Convert.ToString(dr["RfirstPostImg"]);
            rlbltype1.Text = "Property type-"+" "+Convert.ToString(dr["Rproperty_type"]);
            rlbladd1.Text = (string)dr["Rlocality"] + "," + (string)dr["Rcity"];
         

                 //int n = Convert.ToInt32(dr["Rexpected_price"]);
                 //rlblprice1.Text ="Rs"+" "+string.Format("{0:n}", n);

            string fare = dr["Rexpected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            rlblprice1.Text = string.Format(hindi, "{0:c}", parsed);
         

        }
        dr.Close();


        dr = cmdr2.ExecuteReader();
        while (dr.Read())
        {

            int a = (int)dr["Rproperty_id"];
            String type = Convert.ToString(dr["Rproperty_type"]);

            rimg2.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type);
            rimg2.ImageUrl = Convert.ToString(dr["RfirstPostImg"]);
            rlbltype2.Text = "Property type-" + " " + Convert.ToString(dr["Rproperty_type"]);
            rlbladd2.Text = (string)dr["Rlocality"] + "," + (string)dr["Rcity"];


            //int n = Convert.ToInt32(dr["Rexpected_price"]);
            //rlblprice2.Text = "Rs" + " " + string.Format("{0:n}", n);

            string fare = dr["Rexpected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            rlblprice2.Text = string.Format(hindi, "{0:c}", parsed);


        }
        dr.Close();

        dr = cmdr3.ExecuteReader();
        while (dr.Read())
        {

            int a = (int)dr["Rproperty_id"];
            String type = Convert.ToString(dr["Rproperty_type"]);

            rimg3.PostBackUrl = String.Format("property_result.aspx?id={0}&type={1}", a, type);
            rimg3.ImageUrl = Convert.ToString(dr["RfirstPostImg"]);
            rbltype3.Text = "Property type-" + " " + Convert.ToString(dr["Rproperty_type"]);
            rlbladd3.Text = (string)dr["Rlocality"] + "," + (string)dr["Rcity"];


            //int n = Convert.ToInt32(dr["Rexpected_price"]);
            //rlblprice3.Text = "Rs" + " " + string.Format("{0:n}", n);

            string fare = dr["Rexpected_price"].ToString();
            decimal parsed = decimal.Parse(fare, CultureInfo.InvariantCulture);
            CultureInfo hindi = new CultureInfo("hi-IN");
            rlblprice3.Text = string.Format(hindi, "{0:c}", parsed);
        }
        dr.Close();




        con.Close();

       

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int least = 0;
            int max = 0;
            if (ddlprice.SelectedItem.Text == "10 lac-20 lac")
            {

                least = 1000000;
                max = 2000000;
            }

            if (ddlprice.SelectedItem.Text == "20 lac-30 lac")
            {

                least = 2000000;
                max = 3000000;
            }
            if (ddlprice.SelectedItem.Text == "30 lac-40 lac")
            {
                least = 3000000;
                max = 4000000;
            }
            if (ddlprice.SelectedItem.Text == "40 lac-50 lac")
            {
                least = 4000000;
                max = 5000000;
            }
            if (ddlprice.SelectedItem.Text == "50 lac-60 lac")
            {

                least = 5000000;
                max = 6000000;
            }
            if (ddlprice.SelectedItem.Text == "60 lac-70 lac")
            {

                least = 6000000;
                max = 7000000;
            }

            String address = txtloc.Text;
            string[] rec = new string[2];
            String property_type = ddlptype.SelectedItem.Text;
            Session["type"] = property_type;
            int a=0, n = 0;
            String lastadd = address[address.Length - 2] + "" + address[address.Length - 1];
            int ind = address.IndexOf(',');
            
            if (address[ind + 1] == ' ')
            {

                ind += 1;
            }
            rec[1] = address[ind + 1] + "" + address[ind + 2];
            rec[0] = address[0] + "" + address[1]+ "" +address[2];
           
            Response.Write(rec[0]+" "+rec[1]);
           Response.Write(lastadd);
            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();

            if (property_type == "Apartment" || property_type == "apartment")
            {


                cmd = new SqlCommand("select property_id from propertydata where ((locality like '%" + rec[0].ToString() + "%') or (city like '" + rec[1].ToString() + "%'  or city like '%" + lastadd + "')) and property_type='" + ddlptype.SelectedItem + "' and expected_price between " + least + " and " + max + "", con);
                Response.Write(cmd.CommandText);
                cmd1 = new SqlCommand("select count(property_id) from propertydata where ((locality like '%" + rec[0].ToString() + "%') or (city like '" + rec[1].ToString() + "%' or city like '%" + lastadd + "')) and property_type='" + ddlptype.SelectedItem + "' and expected_price between " + least + " and " + max + "", con);

                a = Convert.ToInt16(cmd1.ExecuteScalar());

                if (a == 0)
                {
                    //cmd = new SqlCommand("select property_id from propertydata where ((locality like '%" + rec[0].ToString() + "%') or (city like '" + rec[1].ToString() + "%'  or city like '%" + lastadd + "')) and property_type='" + ddlptype.SelectedItem + "' and expected_price between " + least + " and " + max + "", con);
                    //Response.Write(cmd.CommandText);
                    //cmd1 = new SqlCommand("select count(property_id) from propertydata where ((locality like '%" + rec[0].ToString() + "%') or (city like '" + rec[1].ToString() + "%' or city like '%" + lastadd + "')) and property_type='" + ddlptype.SelectedItem + "' and expected_price between " + least + " and " + max + "", con);
                    cmd = new SqlCommand("select property_id from propertydata where ((locality like '%" + rec[0].ToString() + "%') or (city like '" + rec[1].ToString() + "%'  or city like '%" + lastadd + "')) and property_type='" + ddlptype.SelectedItem + "' and  expected_price between " + least + " and " + max + " ", con);
                    Response.Write(cmd.CommandText);
                    cmd1 = new SqlCommand("select count(property_id) from propertydata where ((locality like '%" + rec[0].ToString() + "%') or (city like '" + rec[1].ToString() + "%' or city like '%" + lastadd + "')) and property_type='" + ddlptype.SelectedItem + "' and  expected_price between " + least + " and " + max + " ", con);

                    a = Convert.ToInt16(cmd1.ExecuteScalar());
                    Session["mess"] = 1;

                    Session["areaname"] = txtloc.Text;
                }
                else
                {
                    Session["mess"] =0;
                    Session["areaname"] = "";

                }

                // Response.Write(a);
                id = new int[a];
                    Response.Write(cmd.CommandText);
                //int propertyid=Convert.ToInt32(cmd.ExecuteScalar());
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    id[n] = Convert.ToInt32(dr["property_id"]);
                    //    Response.Write(Convert.ToInt32(dr["property_id"]));
                    if (Convert.ToInt32(dr["property_id"]) != 0)
                    {
                        n++;
                    }
                }



            }

            else if (ddlptype.SelectedValue.ToString() == "houses/villas")
            {
                cmd = new SqlCommand("select Rproperty_id from Rpropertydata where ((Rlocality like '%" + rec[0].ToString() + "%') or (Rcity like '" + rec[1].ToString() + "%' or Rcity like '%" + lastadd + "')) and Rproperty_type='Residential Houses' and Rexpected_price between " + least + " and " + max + "", con);
                Response.Write(cmd.CommandText);
                cmd1 = new SqlCommand("select count(Rproperty_id) from Rpropertydata where ((Rlocality like '%" + rec[0].ToString() + "%') or (Rcity like '" + rec[1].ToString() + "%' or Rcity like '%" + lastadd + "%')) and Rproperty_type='Residential Houses' and Rexpected_price between " + least + " and " + max + "", con);

                a = Convert.ToInt16(cmd1.ExecuteScalar());
                // Response.Write(a);
                id = new int[a];
                //  Response.Write(cmd.CommandText);
                //int propertyid=Convert.ToInt32(cmd.ExecuteScalar());
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    id[n] = Convert.ToInt32(dr["Rproperty_id"]);
                    //    Response.Write(Convert.ToInt32(dr["property_id"]));
                    if (Convert.ToInt32(dr["Rproperty_id"]) != 0)
                    {
                        n++;
                    }
                }


            }

            //foreach(int x in id)
            //  {
            //      Response.Write(x);
            //  }

            Session["p_id"] = id;
            //foreach (int y in (int[])Session["p_id"])
            //{

            //    Response.Write(y);
            //}


            Session["arr_size"] = a;

            //for (int i = 0; i<id.Length; i++)
            //{
            //    Response.Write(id[i]);
            //}

            //  Session["propertyid"] = propertyid;
            con.Close();

          Response.Redirect("searchresult.aspx");
        }
        catch
        {

            if (id != null)
            {
                string script = "<script>";

                script += "$(document).ready(function () {";
                script += "$(\"#btnsubmit\").click(function () { alert(";
                script += "\"Something must wrong,Please try again\"";
                script += ")});";
                script += "});";
                script += "</script>";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", script);
            }
        }
    }
    protected void img2_Click(object sender, ImageClickEventArgs e)
    {

    }
}