using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Rentmodule : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
    string type;
    SqlCommand cmdd;
    protected void Page_Load(object sender, EventArgs e)
    {

        type = Request.QueryString["renttype"].ToString();
        if (!IsPostBack)
        {
            con.Open();
            if (type == "apartment")
            {

                SqlCommand cmd = new SqlCommand("select * from propertydata where property_for='rent'", con);
                apart.DataSource = cmd.ExecuteReader();
                apart.DataBind();
                Session["type"] = type;


            }
            else
            {
                SqlCommand cmd = new SqlCommand("select * from Rpropertydata where Rproperty_for='rent'", con);
                resiprop.DataSource = cmd.ExecuteReader();
                resiprop.DataBind();

                Session["type"] = type;
            }
            con.Close();
        }


    }

    protected void search(object sender, EventArgs e)
    {
        
        try
        {
           
            if ((txtrplace.Text == "" || txtrplace.Text == null) && (ddlrprice.SelectedItem.Text == "Select Budget"))
            {

                //Response.Write("<script>alert(\"Please Fill locality field\")</script>");
              //  lblerror.Text = "Please Fill locality and budget field";
                lblerror.Text = "<ul><li>Please Fill locality field</li><li>Please select Budget</li></ul>";
               // Response.Write("<ul><li>Please Fill locality field</li><li>Please select Budget</li></ul>");

            }
            else if (txtrplace.Text == "" || txtrplace.Text == null)
            {
                lblerror.Text = "<ul><li>Please Fill locality field</li></ul>";

            }
            else if (ddlrprice.SelectedItem.Text == "Select Budget")
            {

                lblerror.Text = "<ul><li>Please select Budget</li></ul>";
            }
            else
            {

                lblerror.Text = "";
                con.Open();

                int least = 0;
                int max = 0;
                if (ddlrprice.SelectedItem.Text == "10 thousand-20 thousand")
                {

                    least = 10000;
                    max = 20000;
                }

                if (ddlrprice.SelectedItem.Text == "20 thousand-30 thousand")
                {

                    least = 20000;
                    max = 30000;
                }
                if (ddlrprice.SelectedItem.Text == "30 thousand-40 thousand")
                {
                    least = 30000;
                    max = 40000;
                }
                if (ddlrprice.SelectedItem.Text == "40 thousand-50 thousand")
                {
                    least = 40000;
                    max = 50000;
                }
                if (ddlrprice.SelectedItem.Text == "50 thousand-60 thousand")
                {

                    least = 50000;
                    max = 60000 ;
                }
                if (ddlrprice.SelectedItem.Text == "60 thousand-70 thousand")
                {

                    least = 60000;
                    max = 70000;
                }
                if (ddlrprice.SelectedItem.Text == "70 thousand-80 thousand")
                {

                    least = 70000;
                    max = 80000;
                }
                if (ddlrprice.SelectedItem.Text == "80 thousand-90 thousand")
                {

                    least = 80000;
                    max = 90000;
                }
                if (ddlrprice.SelectedItem.Text == "90 thousand-1 lakh")
                {

                    least = 90000;
                    max = 100000;
                }
                



                String place = txtrplace.Text;
                List<string> mplace = new List<string>();
                List<int> commacount = new List<int>();
                //   String[] add = { "locality", "city" };

                int cnt = 0;

                //   Response.Write(place.Substring(0, 2).ToString());

                mplace.Add(place.Substring(0, 3).ToString());
                for (int i = 0; i < place.Length; i++)
                {
                    if (place[i] == ',')
                    {
                        commacount.Add(i);

                    }

                }

                //Response.Write(place.Substring(8, 9));
                //Response.Write(place.Substring(14, 15));
                for (int i = 0; i < commacount.Count; i++)
                {
                    mplace.Add(place.Substring(commacount[i] + 1, 3));

                }

                foreach (string s in mplace)
                {

                    Response.Write(s);
                }

                if (type == "apartment")
                {
                  
        

                  //   Response.Write(query);

                    if (mplace.Count == 1)
                    {
                        string query = "select property_type,property_id,city,plot_area_unit,bedrooms,address,locality,furnished_status,transaction_type,plot_area,possession_status,propertyFirstImg from propertydata where property_for='rent' and (expected_price between " + least + " and " + max + ") and (locality like '" + mplace[0] + "%' or city like '" + mplace[0] + "%')";
                       // Response.Write(query);
                        cmdd = new SqlCommand(query, con);

                        apart.DataSource = cmdd.ExecuteReader();
                        apart.DataBind();

                        if (apart.Items.Count == 0)
                        {

                            lblerror.Text = "No result found";

                        }

                    }
                    else
                    {
                        string query = "select property_type,property_id,city,plot_area_unit,bedrooms,address,locality,furnished_status,transaction_type,plot_area,possession_status,propertyFirstImg from propertydata where property_for='rent' and (expected_price between " + least + " and " + max + ") and (locality like '"+mplace[0]+"%' or city like '"+mplace[1]+"%')";
                  
                        //foreach (string x in mplace)
                        //{
                        //    if (cnt != 0)
                        //    {

                        //        query += " or locality";
                        //    }
                        //    query += " like '" + x + "%'";
                        //    cnt += 1;
                        //}
                        //query += ")";
                        //cnt = 0;

                        //query += " or (city";
                        //foreach (string x in mplace)
                        //{
                        //    if (cnt != 0)
                        //    {

                        //        query += " or city";
                        //    }
                        //    query += " like '" + x + "%'";
                        //    cnt += 1;
                        //}
                        //query += ")";

                     //   Response.Write(query);
                        cmdd = new SqlCommand(query, con);

                        apart.DataSource = cmdd.ExecuteReader();
                        apart.DataBind();

                        if (apart.Items.Count == 0)
                        {

                            lblerror.Text = "No result found";

                        }


                    }
                 

                }


                else
                {
                    if (mplace.Count == 1)
                    {

                        string query = "select Rproperty_type,Rproperty_id,address,Rcity,Rplot_area_unit,Rbedrooms,Rlocality,Rfurnished_status,Rtransaction_type,Rplot_area,Rpossession_status,RfirstPostImg from Rpropertydata where Rproperty_for='rent' and (Rexpected_price between " + least + " and " + max + ") and (Rlocality like '" + mplace[0] + "%' or Rcity like '" + mplace[0] + "%')";

                        Response.Write(query);
                        SqlCommand cmd = new SqlCommand(query, con);
                        resiprop.DataSource = cmd.ExecuteReader();
                        resiprop.DataBind();

                        if (resiprop.Items.Count == 0)
                        {
                            lblerror.Text = "No result Found";

                        }




                    }
                    else
                    {





                        string query = "select Rproperty_type,Rproperty_id,address,Rcity,Rplot_area_unit,Rbedrooms,Rlocality,Rfurnished_status,Rtransaction_type,Rplot_area,Rpossession_status,RfirstPostImg from Rpropertydata where Rproperty_for='rent' and (Rexpected_price between " + least + " and " + max + ") and (Rlocality like '" + mplace[0] + "%' or Rcity like '" + mplace[1] + "%')";

                        //foreach (string x in mplace)
                        //{
                        //    if (cnt != 0)
                        //    {

                        //        query += " or Rlocality";
                        //    }
                        //    query += " like '" + x + "%'";
                        //    cnt += 1;
                        //}
                        //query += ")";
                        //cnt = 0;

                        //query += " or (Rcity";
                        //foreach (string x in mplace)
                        //{
                        //    if (cnt != 0)
                        //    {

                        //        query += " or Rcity";
                        //    }
                        //    query += " like '" + x + "%'";
                        //    cnt += 1;
                        //}
                        //query += "))";

                          Response.Write(query);
                        SqlCommand cmd = new SqlCommand(query, con);
                        resiprop.DataSource = cmd.ExecuteReader();
                        resiprop.DataBind();

                        if (resiprop.Items.Count == 0)
                        {
                            lblerror.Text = "No result Found";

                        }
                    }


                }



                con.Close();
            }
        }
        catch
        {

            lblerror.Text = "No result Found";

        }
 
    



    }

   
    protected void btn_Click(object sender, EventArgs e)
    {
        String btype = Session["type"].ToString();
        if (btype == "apartment" || btype == "Apartment")
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string get = (item.FindControl("lbl_id") as Label).Text;
            Response.Redirect("property_result.aspx?id=" + get);
        }
        else
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string get = (item.FindControl("Rlbl_id") as Label).Text;
            Response.Redirect("property_result.aspx?id=" + get);

        }
    }
    protected void apart_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (apart.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblDefaultMessage = (Label)e.Item.FindControl("lblDefaultMessage");
                lblDefaultMessage.Visible = true;
            }
        }
    }
    protected void resiprop_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (resiprop.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblDefaultMessage2 = (Label)e.Item.FindControl("lblDefaultMessage2");
                lblDefaultMessage2.Visible = true;
            }
        }
    }
}