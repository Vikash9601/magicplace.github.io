using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.IO;
using System.Text.RegularExpressions;
using System.Windows.Forms;

public partial class imageedit : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
    FileUpload file,file1;

    int id;
    String type, imgdata;
    static int count,cnt=1;
    List<string> img = new List<string>();
   // Button btn1;
     static int uid;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["donot"] = "no";
        id = Convert.ToInt32(Request.QueryString["ilde"]);
        type = Convert.ToString(Request.QueryString["tpyer"]);
        uid = Convert.ToInt32(Session["id"]);
        if (!IsPostBack)
        {
            if (uid != 0)
            {

                data();

            }
            else
            {

                Response.Redirect("modifypropertydata1.aspx");
            }

        }

        //string message = "Do you really want to do this operation?";
        //ClientScript.RegisterOnSubmitStatement(this.GetType(), "confirm", "return confirm('" + message + "');");


     

    }

    public void data()
    {
        if ((type == "apartment" || type == "Apartment"))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select imgid,imgname from pimages where property_id=" + id + "", con);
            ddlistimages.DataSource = cmd.ExecuteReader();
            ddlistimages.DataBind();

            con.Close();

            con.Open();
            SqlCommand cmdcnt = new SqlCommand("select count(*) from pimages where property_id=" + id + "", con);
            count = Convert.ToInt32(cmdcnt.ExecuteScalar());
            con.Close();
            msg.InnerHtml = "You can add only " + Convert.ToString(8 - count) + " Images now";
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select imgid,imgname from r_pimages where rproperty_id=" + id + "", con);
            ddllistresi.DataSource = cmd.ExecuteReader();
            ddllistresi.DataBind();
            con.Close();

            con.Open();
            SqlCommand cmdcnt = new SqlCommand("select count(*) from r_pimages where rproperty_id=" + id + "", con);
            count = Convert.ToInt32(cmdcnt.ExecuteScalar());
            con.Close();
            msg.InnerHtml = "You can add only " + Convert.ToString(8 - count) + " Images now";

        }

    }

    protected void btnupd_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label txt = (Label)item.FindControl("imgid");
        Label imgname = (Label)item.FindControl("imgnam");
     


        string filen = imgname.Text.Substring(11);

     //   Response.Write(filen);
        


      //  Image imgl = (Image)item.FindControl("imgload");
        //file = (AsyncFileUpload)item.FindControl("asyncfuload");
        //Button btn1 = (Button)item.FindControl("btnupd");

        file = (FileUpload)item.FindControl("file");
        if (file.HasFile)
        {


            file.SaveAs(Server.MapPath("~/up_image/") + Path.GetFileName(file.FileName));


            con.Open();
            SqlCommand cmd = new SqlCommand("update pimages set imgname='" + string.Concat("~/up_image/", Path.GetFileName(file.FileName)) + "' where imgid=" + Convert.ToInt32(txt.Text) + "", con);
            // Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            con.Close();
            data();


           // var folder = @"C:\Users\Vikas\Documents\Visual Studio 2012\WebSites\collegeproject\up_image\";

            string startupPath = Server.MapPath("~/up_image/");



            File.Delete(startupPath + filen);
            

        }
        else
        {
            Response.Write("<script>alert(\"select any photo first\")</script>");

        }




     

  


    }
    protected void ddlistimages_ItemDataBound(object sender, DataListItemEventArgs e)
    {
       
    }

    //protected void asyncfuload_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    //{
    //    AsyncFileUpload btn = (AsyncFileUpload)sender;
    //    DataListItem item = (DataListItem)btn.NamingContainer;
    //    AsyncFileUpload fl = (AsyncFileUpload)item.FindControl("asyncfuload");
    //    string filenm = System.IO.Path.GetFileName(fl.FileName);
    //    Label txt = (Label)item.FindControl("imgid");


    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("update pimages set imgname='" + string.Concat("~/up_image/", filenm) + "' where imgid=" + Convert.ToInt32(txt.Text) + "", con);
    //    Response.Write(cmd.CommandText);
    //    cmd.ExecuteNonQuery();
    //    fl.SaveAs(Server.MapPath("~/up_image/") + filenm);

    //    SqlCommand cmd1 = new SqlCommand("select imgid,imgname from pimages where property_id=" + id + "", con);
    //    ddlistimages.DataSource = cmd1.ExecuteReader();
    //    ddlistimages.DataBind();

    //    con.Close();
    //   // Response.Write("uploaded");
    //    // Response.Write("<script type='text/javascript'> setTimeout('location.reload(true); ', timeout);</script>");

    //}

    protected void btndel_Click(object sender, EventArgs e)
    {







        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label txt = (Label)item.FindControl("imgid");
        Label imgname = (Label)item.FindControl("imgnam");



        string filen = imgname.Text.Substring(11);

        con.Open();
        SqlCommand cmd = new SqlCommand("delete from pimages where imgid=" + Convert.ToInt32(txt.Text) + "", con);
        // Response.Write(cmd.CommandText);
        cmd.ExecuteNonQuery();
        con.Close();
        data();

        string startupPath = Server.MapPath("~/up_image/");



        File.Delete(startupPath + filen);

    }
    protected void btnupdr_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label txt = (Label)item.FindControl("rimgid");
        Label imgname = (Label)item.FindControl("rimgnam");



        string filen = imgname.Text.Substring(19);


        file1 = (FileUpload)item.FindControl("fileresi");
        if (file1.HasFile)
        {


            file1.SaveAs(Server.MapPath("~/up_image_rhouses/") + Path.GetFileName(file1.FileName));


            con.Open();
            SqlCommand cmd = new SqlCommand("update r_pimages set imgname='" + string.Concat("~/up_image_rhouses/", Path.GetFileName(file1.FileName)) + "' where imgid=" + Convert.ToInt32(txt.Text) + "", con);
            // Response.Write(cmd.CommandText);
            cmd.ExecuteNonQuery();
            con.Close();
            data();


            //var folder = @"C:\Users\Vikas\Documents\Visual Studio 2012\WebSites\collegeproject\up_image_rhouses\";
            string startupPath = Server.MapPath("~/up_image_rhouses/");

            File.Delete(startupPath + filen);

        }
        else
        {
            Response.Write("<script>alert(\"select any photo first\")</script>");

        }


    }
    protected void btndelr_Click(object sender, EventArgs e)
    {


        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;

        Label txt = (Label)item.FindControl("rimgid");
        Label imgname = (Label)item.FindControl("rimgnam");



        string filen = imgname.Text.Substring(19);

        con.Open();
        SqlCommand cmd = new SqlCommand("delete from r_pimages where imgid=" + Convert.ToInt32(txt.Text) + "", con);
        // Response.Write(cmd.CommandText);
        cmd.ExecuteNonQuery();
        con.Close();
        data();

        //var folder = @"C:\Users\Vikas\Documents\Visual Studio 2012\WebSites\collegeproject\up_image_rhouses\";
        string startupPath = Server.MapPath("~/up_image_rhouses/");

        File.Delete(startupPath + filen);


    }
    //protected void AjaxFileUpload1_UploadComplete(object sender, AjaxFileUploadEventArgs e)
    //{
    //    string filename = e.FileName;

    //    con.Open();

    //    type = Convert.ToString(Request.QueryString["tpyer"]);
    //    id = Convert.ToInt32(Request.QueryString["ilde"]);


    //    if (type == "apartment" || type == "Apartment")
    //    {




    //        SqlCommand cmd = new SqlCommand("insert into pimages (imgname,property_id) values('" + string.Concat("~/up_image/", filename) + "'," + id + ") ", con);
    //        Response.Write(cmd.CommandText);
    //        cmd.ExecuteNonQuery();


    //    }
    //    con.Close();


    //    AjaxFileUpload1.SaveAs(Server.MapPath("~/up_image/") + filename);




    //}


    public bool checkimg(String fname)
    {
        Regex regex = new Regex(@"(.*?)\.(JPG|JPEG|PNG)$", RegexOptions.IgnoreCase);
        return regex.IsMatch(fname);

    }



    protected void btnupload_Click(object sender, EventArgs e)
    {

        
        try
        {


            if (type == "apartment" || type == "Apartment")
            {

                con.Open();
                foreach (HttpPostedFile postedFile in fumore.PostedFiles)
                {
                    string fname = Path.GetFileName(postedFile.FileName);
                    string contentType = postedFile.ContentType;
                    int size = postedFile.ContentLength;
                    int num = fumore.PostedFiles.Count;
                    //Response.Write(num);
                    //Response.Write("\n"+contentType);

                    if (size <= 5000000 && (contentType == "image/jpeg" || contentType == "image/jpg" || contentType == "image/png") && fumore.PostedFiles.Count <= 8 - count)
                    {
                        postedFile.SaveAs(Server.MapPath("~/up_image/") + fname);
                        SqlCommand cmd = new SqlCommand("insert into pimages (imgname,property_id) values('" + string.Concat("~/up_image/", fname) + "'," + id + ") ", con);
                        //  Response.Write(cmd.CommandText);
                        cmd.ExecuteNonQuery();
                        
                       
                    }
                    else if (size > 5000000)
                    {

                        Response.Write("<script>alert(\"Size should be less or equal to 5MB of "+cnt+"  \")</script>");
                    }

                    else if (!checkimg(postedFile.FileName))
                    {
                        Response.Write("<script>alert(\" Image Type  should be jpg/jpeg/png \")</script>");
                    }
                    
                    else if (fumore.PostedFiles.Count != 8 - count)
                    {
                        Response.Write("<script>alert(\" You are adding more than " + Convert.ToString(8 - count) + " Images which is not allowed \")</script>");

                    }
                    else
                    {

                        Response.Write("<script>alert(\"Something happened wrong, Please Try again after some time \")</script>");
                    }
                }
                cnt+=1;
                con.Close();
                Response.Write("<script>alert(\"File uploaded successfully\")</script>");

            }








            else if (type == "Residential Houses" || type == "residential houses")
            {



                con.Open();
                foreach (HttpPostedFile postedFile in fumore.PostedFiles)
                {
                    string fname = Path.GetFileName(postedFile.FileName);
                    string contentType = postedFile.ContentType;
                    int size = postedFile.ContentLength;
                    int num = fumore.PostedFiles.Count;


                    if (size <= 5000000 && (contentType == "image/jpeg" || contentType == "image/jpg" || contentType == "image/png") && fumore.PostedFiles.Count <= 8 - count)
                    {
                        postedFile.SaveAs(Server.MapPath("~/up_image_rhouses/") + fname);

                        SqlCommand cmd1 = new SqlCommand("insert into r_pimages (imgname,rproperty_id) values('" + string.Concat("~/up_image_rhouses/", fname) + "'," + id + ") ", con);
                        //  Response.Write(cmd.CommandText);
                        cmd1.ExecuteNonQuery();
                      Response.Write("<script>alert(\"File uploaded successfully\")</script>");

                    }
                    else if (size > 5000000)
                    {

                        Response.Write("<script>alert(\"Size should be less or equal to 3MB \")</script>");
                      
                    }
                    else if (contentType != "image/jpeg" || contentType != "image/jpg" || contentType != "image/png")
                    {
                        Response.Write("<script>alert(\" Image Type should be jpg/jpeg/png \")</script>");
                       
                    }
                    else if (fumore.PostedFiles.Count != 8 - count)
                    {
                        Response.Write("<script>alert(\" You are adding more than " + Convert.ToString(8 - count) + " Images which is not allowed \")</script>");
                        
                    }
                    else
                    {

                        Response.Write("<script>alert(\"Something happened wrong, Please Try again after some time \")</script>");
                    }
                }
                con.Close();


                Response.Write("<script>alert(\"File uploaded successfully\")</script>");
            }
            data();
           
        }




        catch (SqlException ex)
        {

            //Response.Write("<script>alert(\"You Can't upload same image again\")<script>");
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception exee)
        {

            //Response.Write("<script>alert(\"something went wrong\")<script>");
            Response.Redirect(Request.RawUrl);
        }

       
      
       
    }

    protected void Page_UnLoad(object sender, EventArgs e)
    {
        Session["donot"] = "";
    }


}

