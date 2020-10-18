using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    //    Response.Cache.SetExpires(DateTime.Now.AddMilliseconds(100));
    //    Response.Cache.SetNoStore();
    //    Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);

        string user = Convert.ToString(Session["user"]);
        if (user == "")
        {
            sess_out.Visible = false;
            no.Visible = false;
            btn.Visible = false;
        }
        else
        {
            no.Visible = false;
            sess_in.Visible = false;
            signup.Visible = false;
            lbl_new.Visible = false;
            lblusername.Text = user;
            
        }

        if ((String)Session["donot"] == "no")
        {

            no.Visible = true;
           
            sess_in.Visible = false;
            signup.Visible = false;
            lbl_new.Visible = false;
            sess_out.Visible = false;

        }
    }



    public Label getdata
    {
        get
        {
            return this.lblusername; 
        }
    }




    protected void sess_out_ServerClick(object sender, EventArgs e)
    {
    
        Session.RemoveAll();
       
        Session.Abandon();
        Response.Redirect("log.aspx");
         
    }
    protected void btn_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("userprofile.aspx");
    }
}
