using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con;
   // SqlCommand cmd,cmd1;
    SqlDataAdapter da,da1;
    SqlDataReader dr;
    String query,type;
    

    int size;
    int[] n;
    List<String> images = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
     
        if (!IsPostBack)
        {

            getresult();

       

        }




  
       // Response.Write(Convert.ToInt32(Session["propertyid"]));
    }

   
    public void getresult()
    {
        if (Convert.ToInt32(Session["mess"]) == 1)
        {
            string[] arr = Session["areaname"].ToString().Split(',');
            resmsg.Text = "We don't have property suggestions for you in \"" + arr[0] + "\" in a given Budget";
            resmsg1.Text = "Properties which are near to \"" + Convert.ToString(Session["areaname"] + "\" ");

        }
        else
        {
            resmsg.Text = "";
            resmsg1.Text = "";
        }
        size = Convert.ToInt32(Session["arr_size"]);
        n=new int[size];
        int i = 0;
        n = (int[])Session["p_id"];
        type = Convert.ToString(Session["type"]);

        //foreach (int x in n)
        //{
        //    Response.Write(x);
        //}


        if (type == "apartment" || type == "Apartment")
        {

            query = "select property_type,address,property_id,city,cover_area_unit,bedrooms,locality,furnished_status,transaction_type,plot_area,possession_status,propertyFirstImg from propertydata where ";

            foreach (int x in n)
            {
                if (i > 0)
                {
                    query += "or";
                }
                query = query + " property_id=" + x + "";
                i += 1;
            }

            try
            {
                // query = "select property_type,property_id,city,cover_area_unit,bedrooms,locality,furnished_status,transaction_type,plot_area,possession_status,propertyFirstImg + n[i] + "";




                con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");

                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                data.DataSource = cmd.ExecuteReader();
                data.DataBind();
                con.Close();
            }

            catch
            {

                resmsg.Text = "No result found";
                resmsg1.Text = "No near properties in given Budget";
            }

        }
        else
        {
            query = "select Rproperty_type,address,Rproperty_id,Rcity,Rcover_area_unit,Rbedrooms,Rlocality,Rfurnished_status,Rtransaction_type,Rplot_area,Rpossession_status,RfirstPostImg from Rpropertydata where ";

            foreach (int x in n)
            {
                if (i > 0)
                {
                    query += "or";
                }
                query = query + " Rproperty_id=" + x + "";
                i += 1;
            }


            try
            {
                // query = "select property_type,property_id,city,cover_area_unit,bedrooms,locality,furnished_status,transaction_type,plot_area,possession_status,propertyFirstImg + n[i] + "";




                con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");

                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
              //  Response.Write(cmd.CommandText);
                residentialdata.DataSource = cmd.ExecuteReader();
                residentialdata.DataBind();
                con.Close();
            }

            catch
            {
                resmsg.Text = "No result found";

            }

        }
       
        //Response.Write(query);
        //Response.Write(i);
         
        }
        //else
        //{
        //    goto exit;
        //}

   //    goto loop;
   //exit:
   //    Response.Write("cada");

    public void getImages()
    {
        String q = "select imgid,imgname from pimages where";
        int a = 0;
        foreach (int x in n)
        {
            if (a > 0)
            {
                q += " or ";
            }
            q += " property_id=" + x + "";
            a += 1;
        }

        //  int start=0;
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");

        con.Open();
        SqlCommand cmd = new SqlCommand(q, con);
        dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            images.Add(dr["imgname"].ToString());

        }

        con.Close();

    }
   




    protected void btn_Click(object sender, EventArgs e)
    {
        String type = Session["type"].ToString();
        if (type == "apartment" || type == "Apartment")
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
    protected void data_Load(object sender, EventArgs e)
    {

          //  String q="select imgid,imgname from pimages where";
          //  int a=0;
          // foreach(int x in n)
          // {
          //     if(a>0)
          //     {
          //         q+=" or ";
          //     }
          //     q+=" property_id="+x+"";
          //     a+=1;
          // }

          ////  int start=0;
          //  con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");

          //  con.Open();
          //  SqlCommand cmd = new SqlCommand(q, con);
          //  dr = cmd.ExecuteReader();
          //  RepeaterItem item = (sender as ).NamingContainer as RepeaterItem;
          //  while (dr.Read())
          //  {
           
          //      Image get = item.FindControl("img1") as Image;
          //      get.ImageUrl = Convert.ToString(dr["imgname"]);
          //  }

          //  con.Close();


    }
}