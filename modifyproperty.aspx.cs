using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.IO;
using System.Security;
using System.Security.Cryptography;
using System.Text;
using System.Globalization;

using System.Text.RegularExpressions;

public partial class modifyproperty : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd,command,command1,command2;
    SqlDataAdapter da;
    SqlDataReader dr;
    string v;
    static int uid,pricepp;
    static string priceApart;
   String ptype = "";
   string citys,electricity;
   String prop_id; 
   String proptype;

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["donot"] = "no";

        prop_id=Session["property_id"].ToString();
            proptype=Session["type"].ToString();
            uid = Convert.ToInt32(Session["id"]);

            if (!IsPostBack)
            {
                if (uid == 0)
                {
                    Response.Redirect("modifypropertydata1.aspx");
                }
                else
                {
                    con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
                    con.Open();

                    SqlCommand cmd1 = new SqlCommand("select * from state", con);
                    SqlDataReader dra = cmd1.ExecuteReader();
                    state.DataSource = dra;

                    state.DataValueField = "stateid";
                    state.DataTextField = "statename";
                    state.DataBind();


                    dra.Close();
                    state.Items.Insert(0, new ListItem("--Select state--", "0"));
                    state.Items.FindByValue("0").Attributes["disabled"] = "disabled";




                    if (proptype == "Apartment")
                    {
                        lblpname.Visible = true;
                        txtpname.Visible = true;
                        SqlCommand comm = new SqlCommand("select * from propertydata where property_id=" + prop_id + "", con);
                        SqlDataReader dr = comm.ExecuteReader();


                        while (dr.Read())
                        {
                            txtlocal.Text = dr["locality"].ToString();
                            p_for.ClearSelection();
                            //  p_for.Items.FindByValue("sell").Selected = true;
                            p_for.Items.FindByValue(dr["property_for"].ToString()).Selected = true;
                            p_type.ClearSelection();
                            p_type.Items.FindByText(dr["property_type"].ToString()).Selected = true;

                            state.ClearSelection();
                            state.Items.FindByText(dr["state"].ToString()).Selected = true;
                            citys = dr["city"].ToString();

                            bed.ClearSelection();
                            bed.Items.FindByText(dr["bedrooms"].ToString()).Selected = true;
                            balcony.ClearSelection();
                            balcony.Items.FindByText(dr["balconies"].ToString()).Selected = true;
                            floor_no.ClearSelection();
                            floor_no.Items.FindByText(dr["floor_no"].ToString()).Selected = true;
                            bathrooms.ClearSelection();
                            bathrooms.Items.FindByText(dr["Bathroom"].ToString()).Selected = true;
                            furnished_s.ClearSelection();
                            furnished_s.Items.FindByValue(dr["furnished_status"].ToString()).Selected = true;
                            cover_area.Text = dr["covered_area"].ToString();
                            cover_area_unit.ClearSelection();
                            cover_area_unit.Items.FindByText(dr["cover_area_unit"].ToString()).Selected = true;
                            plot_area.Text = dr["plot_area"].ToString();
                            plot_area_unit.ClearSelection();
                            plot_area_unit.Items.FindByText(dr["plot_area_unit"].ToString()).Selected = true;
                            txtpname.Text = dr["propertyName"].ToString();
                            txteprice.Text = dr["expected_price"].ToString();
                            txtpp.Text = dr["price_sqft"].ToString();
                            txtadd.Text = dr["address"].ToString();
                            txtlm.Text = dr["landmark"].ToString();
                            txtfloor.Text = dr["flooring"].ToString();
                            electricity = dr["statusOfElectricity"].ToString();
                            if (electricity == "No/Rare powercut")
                            {
                                ddlrelectricity.ClearSelection();
                                ddlrelectricity.Items.FindByText("No/Rare powercut").Selected = true;
                            }
                            else
                            {
                                ddlrelectricity.ClearSelection();
                                ddlrelectricity.Items.FindByText("Powercut once or twice in a week").Selected = true;

                            }
                        }

                        //  Response.Write(electricity);


                        dr.Close();

                        // Response.Write(stateofp);
                        cmd = new SqlCommand("select * from city where stateid in (select stateid from state where statename='" + state.SelectedItem + "')", con);
                        // Response.Write(cmd.CommandText);
                        da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds, "city");
                        city.DataSource = ds.Tables[0];
                        city.DataTextField = "cityname";
                        city.DataValueField = "cityid";
                        city.DataBind();
                        con.Close();

                        city.Items.Insert(0, new ListItem("--Select  city--", "0"));
                        city.Items.FindByValue("0").Attributes["disabled"] = "disabled";
                        city.ClearSelection();
                        //city.Items.FindByText(citys).Selected = true;


                        for (int i = 1; i < city.Items.Count; i++)
                        {
                            if (city.Items[i].Text.Trim() == citys)
                            {
                                //  Response.Write(citys);
                                // city.Items[i].Text.Trim().
                                //   Response.Write("yes");
                                city.Items[i].Selected = true;

                            }
                            else
                            {
                                continue;
                            }

                        }
                    }

                    else
                    {
                        lblpname.Visible = false;
                        txtpname.Visible = false;

                        SqlCommand comm = new SqlCommand("select * from Rpropertydata where Rproperty_id=" + prop_id + "", con);
                        SqlDataReader dr = comm.ExecuteReader();


                        while (dr.Read())
                        {
                            txtlocal.Text = dr["Rlocality"].ToString();
                            p_for.ClearSelection();
                            //  p_for.Items.FindByValue("sell").Selected = true;
                            p_for.Items.FindByValue(dr["Rproperty_for"].ToString()).Selected = true;
                            p_type.ClearSelection();
                            p_type.Items.FindByText(dr["Rproperty_type"].ToString()).Selected = true;

                            state.ClearSelection();
                            state.Items.FindByText(dr["Rstate"].ToString()).Selected = true;
                            citys = dr["Rcity"].ToString();

                            bed.ClearSelection();
                            bed.Items.FindByText(dr["Rbedrooms"].ToString()).Selected = true;
                            balcony.ClearSelection();
                            balcony.Items.FindByText(dr["Rbalconies"].ToString()).Selected = true;
                            floor_no.ClearSelection();
                            floor_no.Items.FindByText(dr["Rfloor_no"].ToString()).Selected = true;
                            bathrooms.ClearSelection();
                            bathrooms.Items.FindByText(dr["RBathroom"].ToString()).Selected = true;
                            furnished_s.ClearSelection();
                            furnished_s.Items.FindByValue(dr["Rfurnished_status"].ToString()).Selected = true;
                            cover_area.Text = dr["Rcovered_area"].ToString();
                            cover_area_unit.ClearSelection();
                            cover_area_unit.Items.FindByText(dr["Rcover_area_unit"].ToString()).Selected = true;
                            plot_area.Text = dr["Rplot_area"].ToString();
                            plot_area_unit.ClearSelection();
                            plot_area_unit.Items.FindByText(dr["Rplot_area_unit"].ToString()).Selected = true;
                            // txtpname.Text = dr["propertyName"].ToString();
                            txteprice.Text = dr["Rexpected_price"].ToString();
                            txtpp.Text = dr["Rprice_sqft"].ToString();
                            txtadd.Text = dr["address"].ToString();
                            txtlm.Text = dr["landmark"].ToString();
                            txtfloor.Text = dr["flooring"].ToString();
                            electricity = dr["statusOfElectricity"].ToString();
                            if (electricity == "No/Rare powercut")
                            {
                                ddlrelectricity.ClearSelection();
                                ddlrelectricity.Items.FindByText("No/Rare powercut").Selected = true;
                            }
                            else
                            {
                                ddlrelectricity.ClearSelection();
                                ddlrelectricity.Items.FindByText("Powercut once or twice in a week").Selected = true;

                            }
                        }

                        //  Response.Write(electricity);


                        dr.Close();

                        // Response.Write(stateofp);
                        cmd = new SqlCommand("select * from city where stateid in (select stateid from state where statename='" + state.SelectedItem + "')", con);
                        // Response.Write(cmd.CommandText);
                        da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds, "city");
                        city.DataSource = ds.Tables[0];
                        city.DataTextField = "cityname";
                        city.DataValueField = "cityid";
                        city.DataBind();
                        con.Close();

                        city.Items.Insert(0, new ListItem("--Select  city--", "0"));
                        city.Items.FindByValue("0").Attributes["disabled"] = "disabled";
                        city.ClearSelection();
                        //city.Items.FindByText(citys).Selected = true;


                        for (int i = 1; i < city.Items.Count; i++)
                        {
                            if (city.Items[i].Text.Trim() == citys)
                            {
                                // Response.Write(citys);
                                // city.Items[i].Text.Trim().
                                // Response.Write("yes");
                                city.Items[i].Selected = true;

                            }
                            else
                            {
                                continue;
                            }

                        }



                    }

                    //for (int i = 0; i < city.Items.Count; i++)
                    //{
                    //    if (city.Items.Contains(stateofp))
                    //    {
                    //        city.Items.FindByText(stateofp).Selected = true;
                    //    }
                    //    else
                    //    {
                    //        Response.Write("nothing found");
                    //    }

                    //}

                    //Response.Write(city.Items[1].Text.Trim());


                    //Response.Write(city.Items[1].Text);

                    con.Close();
                }

            }

       
      
    }
   
   protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {

        state.Items.FindByValue("0").Attributes["disabled"] = "disabled";


        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        if (state.SelectedItem == null)
        {
            cmd = new SqlCommand("select * from city where stateid in (select stateid from state where statename='" + citys+ "')", con);
            //    Response.Write(cmd.CommandText);
            da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "city");
            city.DataSource = ds.Tables[0];
            city.DataTextField = "cityname";
            city.DataValueField = "cityid";
            city.DataBind();
            con.Close();

            city.Items.Insert(0, new ListItem("--Select city--", "0"));
         

        }
        else
        {

            cmd = new SqlCommand("select * from city where stateid in (select stateid from state where statename='" + state.SelectedItem + "')", con);
            //   Response.Write(cmd.CommandText);
            da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "city");
            city.DataSource = ds.Tables[0];
            city.DataTextField = "cityname";
            city.DataValueField = "cityid";
            city.DataBind();
            con.Close();

            city.Items.Insert(0, new ListItem("--Select city--", "0"));
            city.Items.FindByValue("0").Attributes["disabled"] = "disabled";
        }

   }
  
 
 


  protected void gvshow_RowDataBound(object sender, GridViewRowEventArgs e)
    {
//        if (e.Row.RowType == DataControlRowType.Header)
//        {
//            if (ptype == "Apartment")
//            {
//                e.Row.Cells[2].Text = "Property for";
//                e.Row.Cells[3].Text = "Property Type";
//                e.Row.Cells[9].Text = "Floor no.";
//                e.Row.Cells[10].Text = "Furnished status";
//                e.Row.Cells[11].Text = "Covered area";
//                e.Row.Cells[12].Text = "Covered area unit";
//                e.Row.Cells[13].Text = "Plot area";
//                e.Row.Cells[14].Text = "Plot area unit";
//                e.Row.Cells[15].Text = "Property name";
//                e.Row.Cells[16].Text = "Transaction Type";
//                e.Row.Cells[17].Text = "Possession Status";
//                e.Row.Cells[18].Text = "Age of construction";
//                e.Row.Cells[19].Text = "Construct Complete";
//                e.Row.Cells[20].Text = "Expected price";
//                e.Row.Cells[21].Text = "Price per sqft";
//                e.Row.Cells[22].Text = "Price Includes";

//            }

//            else
//            {
//                e.Row.Cells[1].Text = "Property for";
//                e.Row.Cells[2].Text = "Property Type";
//                e.Row.Cells[3].Text = "State";
//                e.Row.Cells[4].Text = "City";
//                e.Row.Cells[5].Text = "Locality";
//                e.Row.Cells[6].Text = "Bedrooms";
//                e.Row.Cells[7].Text = "Bathrooms";
//                e.Row.Cells[8].Text = "Balconies";
//                e.Row.Cells[9].Text = "No. of floors";
//                e.Row.Cells[10].Text = "Furnished status";
//                e.Row.Cells[11].Text = "Covered area";
//                e.Row.Cells[12].Text = "Covered area unit";
//                e.Row.Cells[13].Text = "Plot area";
//                e.Row.Cells[14].Text = "Plot area unit";
           
//                e.Row.Cells[15].Text = "Transaction Type";
//                e.Row.Cells[16].Text = "Possession Status";
//                e.Row.Cells[17].Text = "Age of construction";
//                e.Row.Cells[18].Text = "Construct Complete";
//                e.Row.Cells[19].Text = "Expected price";
//                e.Row.Cells[20].Text = "Price per sqft";
//                e.Row.Cells[21].Text = "Price Includes";

            

//            }
//        }
   }
   protected void gvshow_PageIndexChanging(object sender, GridViewPageEventArgs e)
  {
//        gvshow.PageIndex = e.NewPageIndex;
//        gvview();
   }
   protected void btnsub_Click(object sender, EventArgs e)
  {
      con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
      con.Open();
      String propname = txtpname.Text;
      if (proptype == "Apartment")
      {
          SqlCommand cmd = new SqlCommand("update propertydata set property_for='" + p_for.SelectedValue + "',property_type='" + p_type.SelectedItem.Text + "',state='" + state.SelectedItem + "',city='" + city.SelectedItem.Text.Trim() + "',locality='" + txtlocal.Text + "',bedrooms=" + bed.SelectedItem.Text + ",Bathroom=" + bathrooms.SelectedItem.Text + ",balconies=" + balcony.SelectedItem.Text + ",floor_no=" + floor_no.SelectedItem + ",furnished_status='" + furnished_s.SelectedValue + "',covered_area=" + cover_area.Text + ",cover_area_unit='" + cover_area_unit.SelectedItem.Text + "',plot_area=" + plot_area.Text + ",plot_area_unit='" + plot_area_unit.SelectedItem.Text + "',propertyName='" + txtpname.Text + "',expected_price=" + priceApart + ",price_sqft=" +pricepp+ ",address='" + txtadd.Text + "',landmark='" + txtlm.Text + "',flooring='" + txtfloor.Text + "',statusOfElectricity='" + ddlrelectricity.SelectedItem.Text + "' where property_id=" + prop_id + "", con);
       //   Response.Write(cmd.CommandText);
          cmd.ExecuteNonQuery();
          Response.Write("<script>alert(\"Property data has successfully updated\")</script>");
      }
      else
      {
          SqlCommand cmd = new SqlCommand("update Rpropertydata set Rproperty_for='" + p_for.SelectedValue + "',Rproperty_type='" + p_type.SelectedItem.Text + "',Rstate='" + state.SelectedItem + "',Rcity='" + city.SelectedItem.Text.Trim() + "',Rlocality='" + txtlocal.Text + "',Rbedrooms=" + bed.SelectedItem.Text + ",RBathroom=" + bathrooms.SelectedItem.Text + ",Rbalconies=" + balcony.SelectedItem.Text + ",Rfloor_no=" + floor_no.SelectedItem + ",Rfurnished_status='" + furnished_s.SelectedValue + "',Rcovered_area=" + cover_area.Text + ",Rcover_area_unit='" + cover_area_unit.SelectedItem.Text + "',Rplot_area=" + plot_area.Text + ",Rplot_area_unit='" + plot_area_unit.SelectedItem.Text + "',Rexpected_price=" + priceApart + ",Rprice_sqft=" + pricepp + ",address='" + txtadd.Text + "',landmark='" + txtlm.Text + "',flooring='" + txtfloor.Text + "',statusOfElectricity='" + ddlrelectricity.SelectedItem.Text + "' where Rproperty_id=" + prop_id + "", con);
         // Response.Write(cmd.CommandText);
          cmd.ExecuteNonQuery();
          Response.Write("<script>alert(\"Property data has successfully updated\")</script>");

      }
      con.Close();
   }
    protected void gvshow_RowCreated(object sender, GridViewRowEventArgs e)
    {
     
        
    }

    protected void Page_UnLoad(object sender, EventArgs e)
    {
        Session["donot"] = "";
    }



    [WebMethod]
    public static string convertcurr(string cur)
   {
        string current = cur.Substring(1);
        string newcur = "";

        foreach (char s in current)
        {
            if (s != ',' )
            {
                newcur += s;

            }
            
            else
            {
                continue;
            }
            
        }


        if (newcur == "")
        {

            newcur = "0";
        }

        priceApart = newcur;
        
        decimal parsed = decimal.Parse(priceApart, CultureInfo.InvariantCulture);
        CultureInfo hindi = new CultureInfo("hi-IN");
       string s1  = string.Format(hindi, "{0:c}", parsed);

       
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
    public static string convertpp(string cur)
    {
        string newcur = "";

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


        pricepp = Convert.ToInt32(newcur);
        string s1 = string.Format("{0:n}", pricepp);
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
 
