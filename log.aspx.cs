using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web.Services;







public partial class log : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd, cmd3,command;

   

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.Cookies["id"] != null)
            {
                txtid.Text = Request.Cookies["id"].Value;
            }
            if (Request.Cookies["pwd"] != null)
            {
               // txtpwd.Text = Request.Cookies["pwd"].Value;
                txtpwd.Attributes.Add("value", Request.Cookies["pwd"].Value);
            }
            if (Request.Cookies["id"] != null && Request.Cookies["pwd"] != null)
            {
               chkrem.Checked = true;
            }
        }





        //-----------------------

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SHA512 m = SHA512.Create();
            byte[] bytes = System.Text.ASCIIEncoding.ASCII.GetBytes(txtpwd.Text);
            byte[] hash = m.ComputeHash(bytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));

            }
            var pass = sb.ToString();


            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();

            if (Char.IsLetter(txtid.Text, 1))
            {
                cmd = new SqlCommand("select count(*) from simpleuserregister where email='" + txtid.Text + "' and password='" + pass + "'", con);
                if (Convert.ToInt32(cmd.ExecuteScalar()) != 0)
                {

                    command = new SqlCommand("select username from simpleuserregister where email='" + txtid.Text + "'", con);
                    cmd3 = new SqlCommand("select id from simpleuserregister where email='" + txtid.Text + "'", con);
                    //Response.Write(cmd.CommandText);
                    //Response.Write(command.CommandText);
                    //Response.Write(cmd3.CommandText);

                }
                else
                {

                    SqlCommand adminchk = new SqlCommand("select count(*) from adminlogin where adminloginid='" + txtid.Text + "' and password='" + txtpwd.Text + "'", con);
                    if (Convert.ToInt32(adminchk.ExecuteScalar()) == 1)
                    {

                        Response.Redirect("adminchildpage1.aspx");

                    }
                    else
                    {

                        lbstatus.Text = "Invalid user";
                    }



                }


            }
          
            else
            {
                cmd = new SqlCommand("select count(*) from simpleuserregister where contactno=" + txtid.Text + " and password='" + pass + "'", con);
                command = new SqlCommand("select username from simpleuserregister where contactno=" + txtid.Text + "", con);
                cmd3 = new SqlCommand("select id from simpleuserregister where contactno=" + txtid.Text + "", con);

                //Response.Write(cmd.CommandText);
                //Response.Write(command.CommandText);
                //Response.Write(cmd3.CommandText);

            }
           
          
            
            string name;
            int cnt, cnt3;
            cnt = Convert.ToInt32(cmd.ExecuteScalar());
            //cnt1 = Convert.ToInt32(cmd1.ExecuteScalar());
            //cnt2 = Convert.ToInt32(cmd2.ExecuteScalar());
            cnt3 = Convert.ToInt32(cmd3.ExecuteScalar());
            //cnt4 = Convert.ToInt32(cmd4.ExecuteScalar());
            //cnt5 = Convert.ToInt32(cmd5.ExecuteScalar());
            name = Convert.ToString(command.ExecuteScalar());
        
            con.Close();
            int ret = Convert.ToInt32(Session["return"]);
            if (cnt == 1 && ret != 1)
            {
                if (cnt3 != 0)
                {
                    Session["id"] = cnt3;

                }
                Session["user"] = name;
                Session["predirect"] = 1;
                
                
                    if (chkrem.Checked == true)
                {
                    Response.Cookies["id"].Value = txtid.Text;
                    Response.Cookies["pwd"].Value = txtpwd.Text;
                    Response.Cookies["id"].Expires = DateTime.Now.AddDays(10);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(10);
                }
                else
                {
                    Response.Cookies["id"].Expires = DateTime.Now.AddDays(-1);

                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
                }
              Response.Redirect("homepage.aspx");
                    
            }
            else
            {
                // Response.Write("invalid user");
                lbstatus.Text = "Invalid user";
            }
            
            if (cnt == 1 && ret == 1)
            {
                if (cnt3 != 0)
                {
                    Session["id"] = cnt3;

                }
                //else if (cnt4 != 0)
                //{
                //    Session["id"] = cnt4;
                //}
                //else if (cnt5 != 0)
                //{
                //    Session["id"] = cnt5;
                //}


                Session["redirect"] = 1;
               

                

                Response.Redirect("postproperty.aspx");
                
            }



            else
            {
                // Response.Write("invalid user");
                lberror.Text = "Invalid user";
            }
        }
        catch
        {
           // Response.Write("contact no. or email could used in this system already");
           // lberror.Text = "Something happened wrong please try again with correct credentials";
            lblexcep.InnerHtml = "Something happened wrong please try again with correct credentials";
        }
        
    }
    protected void lk_Click(object sender, EventArgs e)
    {
        //Response.Redirect("registration.aspx");
    }
    protected void txtid_TextChanged(object sender, EventArgs e)
      {
          try
          {
              con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
              con.Open();
              if (Char.IsLetter(txtid.Text, 1))
              {
                  cmd = new SqlCommand("select count(*) from simpleuserregister where email='" + txtid.Text + "'", con);
                  // Response.Write(cmd.CommandText);
                  int cn = Convert.ToInt16(cmd.ExecuteScalar());
                  con.Close();
                  if (cn != 1)
                  {
                      lbltxt.Text = "User does not exist";
                  }
                  else
                  {
                      lbltxt.Text = null;
                  }

              }
              else
              {


                  cmd = new SqlCommand("select count(*) from simpleuserregister where contactno=" + txtid.Text + "", con);
                  //  Response.Write(cmd.CommandText);
                  int cn = Convert.ToInt16(cmd.ExecuteScalar());
                  con.Close();
                  if (cn != 1)
                  {
                      lbltxt.Text = "User does not exist";
                  }
                  else
                  {
                      lbltxt.Text = null;
                  }

              }
          }
          catch
          {
              lbltxt.Text = "";

          }
     


    }
    protected void googleimg_Click(object sender, ImageClickEventArgs e)
    {
      
    }

    public class GoogleProfile
    {
        public string Id { get; set; }
        public string DisplayName { get; set; }
      //  public Image Image { get; set; }
        public List<Email> Emails { get; set; }
        public string Gender { get; set; }
        public string ObjectType { get; set; }
    }

    public class Email
    {
        public string Value { get; set; }
        public string Type { get; set; }
    }

    public class Image
    {
        public string Url { get; set; }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        Response.Cookies["id"].Expires = DateTime.Now.AddDays(-1);

        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);
       
        Response.Redirect("forgotPassword.aspx");
    }
    [WebMethod]
    public string checklog(string datas)
    {

        //if (Request.Headers("X-Requested-With") == null)
        //{
        //    // Without the `X-Requested-With` header, this request could be forged. Aborts.
        //}


        if (datas == null || datas=="")
        {

          

        }

        return "";

    }

}