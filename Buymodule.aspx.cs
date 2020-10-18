using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Buymodule : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
     String type;
    protected void Page_Load(object sender, EventArgs e)
    {
       type = Request.QueryString["type"].ToString();
        if(!IsPostBack)
        {
            con.Open();
            if (type == "apartment")
            {
                
                SqlCommand cmd = new SqlCommand("select * from propertydata where property_for='sell'", con);
                apart.DataSource = cmd.ExecuteReader();
                apart.DataBind();
                Session["type"] = type;
              

            }
            else
            {
                SqlCommand cmd = new SqlCommand("select * from Rpropertydata where Rproperty_for='sell'", con);
                resiprop.DataSource = cmd.ExecuteReader();
                resiprop.DataBind();

                Session["type"] = type;
            }
            con.Close();
        }
    }


    protected void vikash(object sender, EventArgs e)
    {

        try
        {

            if ((txtplace.Text == "" || txtplace.Text == null) && (ddlprice.SelectedItem.Text == "Budget"))
            {

                //Response.Write("<script>alert(\"Please Fill locality field\")</script>");
                //  lblerror.Text = "Please Fill locality and budget field";
                lblerror.Text = "<ul><li>Please Fill locality field</li><li>Please select Budget</li></ul>";
                // Response.Write("<ul><li>Please Fill locality field</li><li>Please select Budget</li></ul>");

            }
            else if (txtplace.Text == "" || txtplace.Text == null)
            {
                lblerror.Text = "<ul><li>Please Fill locality field</li></ul>";

            }
            else if (ddlprice.SelectedItem.Text == "Select Budget")
            {

                lblerror.Text = "<ul><li>Please select Budget</li></ul>";
            }
            else
            {

                lblerror.Text = "";
                con.Open();

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



                String place = txtplace.Text;
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

                if (type == "apartment")
                {
                    //string query1="select "
                    string query = "select property_type,property_id,city,plot_area_unit,bedrooms,address,locality,furnished_status,transaction_type,plot_area,possession_status,propertyFirstImg from propertydata where property_for='sell' and (expected_price between " + least + " and " + max + ") and ((locality";

                    foreach (string x in mplace)
                    {
                        if (cnt != 0)
                        {

                            query += " or locality";
                        }
                        query += " like '" + x + "%'";
                        cnt += 1;
                    }
                    query += ")";
                    cnt = 0;

                    query += " or (city";
                    foreach (string x in mplace)
                    {
                        if (cnt != 0)
                        {

                            query += " or city";
                        }
                        query += " like '" + x + "%'";
                        cnt += 1;
                    }
                    query += "))";

                    // Response.Write(query);
                    SqlCommand cmd = new SqlCommand(query, con);


                    apart.DataSource = cmd.ExecuteReader();
                    apart.DataBind();

                    if (apart.Items.Count == 0)
                    {

                        lblerror.Text = "No result found";

                    }

                }


                else
                {
                    string query = "select Rproperty_type,Rproperty_id,address,Rcity,Rplot_area_unit,Rbedrooms,Rlocality,Rfurnished_status,Rtransaction_type,Rplot_area,Rpossession_status,RfirstPostImg from Rpropertydata where Rproperty_for='sell' and (Rexpected_price between " + least + " and " + max + ") and ((Rlocality";

                    foreach (string x in mplace)
                    {
                        if (cnt != 0)
                        {

                            query += " or Rlocality";
                        }
                        query += " like '" + x + "%'";
                        cnt += 1;
                    }
                    query += ")";
                    cnt = 0;

                    query += " or (Rcity";
                    foreach (string x in mplace)
                    {
                        if (cnt != 0)
                        {

                            query += " or Rcity";
                        }
                        query += " like '" + x + "%'";
                        cnt += 1;
                    }
                    query += "))";

                    //  Response.Write(query);
                    SqlCommand cmd = new SqlCommand(query, con);
                    resiprop.DataSource = cmd.ExecuteReader();
                    resiprop.DataBind();

                    if (resiprop.Items.Count == 0)
                    {
                        lblerror.Text = "No result Found";

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
}