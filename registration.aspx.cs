using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security;
using System.Security.Cryptography;
using System.Text;

public partial class red : System.Web.UI.Page

{
    SqlConnection con;
    SqlCommand cmd;
       protected void Page_Load(object sender, EventArgs e)
    {


    }
       protected void btnsubmit_Click(object sender, EventArgs e)
      {
          string pas = txtpa.Value;
          string nam = txtname.Value;
          string email = txtemail.Value;
          string mob = txtcontact.Value;
  String date=DateTime.Now.ToString("dddd, dd MMMM yyyy");
  String time = DateTime.Now.ToString("hh:mm tt");
  int id;
           try
           {
           SHA512 m = SHA512.Create();                                              
           byte[] bytes = System.Text.ASCIIEncoding.ASCII.GetBytes(pas);
           byte[] hash = m.ComputeHash(bytes);
           StringBuilder sb = new StringBuilder();
           for (int i = 0; i < hash.Length; i++)
           {
               sb.Append(hash[i].ToString("X2"));

           }
           var pass = sb.ToString();


           int cnt;
               string usertype;
               
           if (rbtnuser.Checked)
           {
               usertype = "buyer/seller";
               //con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
               //con.Open();
               //cmd = new SqlCommand("insert into [simpleuserregister] ([username],[email],[contactno],[password]) values('" + txtname.Text + "','" + txtemail.Text + "'," + txtcontact.Text + ",'" + pass + "')", con);

               //cmd.ExecuteNonQuery();
               //con.Close();
               // cnt = 1;
               // Session["redirect"] = cnt;
               
           }

           else if (rbtnagent.Checked)
           {
               //con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
               //con.Open();
               //cmd = new SqlCommand("insert into [agentregister] ([agentname],[email],[contactno],[password]) values('" + txtname.Text + "','" + txtemail.Text + "'," + txtcontact.Text + ",'" + pass + "')", con);

               //cmd.ExecuteNonQuery();
               //con.Close();
               // cnt=1;
               // Session["redirect"] = cnt;
               usertype = "agent";
           }
           else
           {
               usertype="builder";
           }
      
               con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
               con.Open();
               cmd = new SqlCommand("insert into [simpleuserregister] ([username],[email],[contactno],[password],[user_type],[joindate],[timing]) values('" +nam + "','" + email + "'," + mob+ ",'" + pass + "','"+usertype+"','"+date+"','"+time+"')", con);

               cmd.ExecuteNonQuery();
               Response.Write(cmd.CommandText);

               SqlCommand cmduserid = new SqlCommand("select id from simpleuserregister where [username]='" + nam + "' and [email]='" + email + "'", con);
           id= Convert.ToInt32(cmduserid.ExecuteScalar());


               con.Close();
                cnt=1;
                Session["id"] = id;
                Session["redirect"] = cnt;
                Session["user"] = txtname.Value;
                Response.Redirect("homepage.aspx");

          

             }
        catch
        {
            lberror.Text = "contact no. or email might be used in this system already";
            //Response.Write("contact no. or email might be used in this system already");
        }
       }
       protected void rbtnuser_CheckedChanged(object sender, EventArgs e)
       {

       }
}