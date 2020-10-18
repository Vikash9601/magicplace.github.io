using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Security;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;

public partial class forgotPassword : System.Web.UI.Page
{
    SqlConnection con;
    public static int r_otp;
    public static int success = 0;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        otp.Visible = false;
        set.Visible = false;
        updt.Visible = false;
        res.Visible = false;
        log.Visible = false;
        
    }
    protected void submit_Click(object sender, EventArgs e)
    {
     

        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from simpleuserregister where username='"+uname.Value+"' and email='"+eid.Value+"'",con);
        //Response.Write(cmd.CommandText);
        int cnt = (Int32)cmd.ExecuteScalar();
        con.Close();
        if (cnt == 1)
        {
                       OTP();
            cred.Visible = false;
            otp.Visible = true;
            set.Visible = true;
            hello.Visible = false;
           // ClientScript.RegisterStartupScript(this.GetType(), "asa", "  setTimeout(function(){ document.getElementById(\"msg1\").innerHTML=\" Dear user,we have sent an OTP to your registered Email-id\";document.getElementById(\"msg2\").innerHTML=\"If you haven't got an OTP then please click on the button below\";},1500);", true);
        }
          else
        {
            lblerr.Text = "Entered Credentials are not valid";
        }

    }


    public void OTP()
    {
       
        Random r = new Random();
            
            r_otp = r.Next(100000, 999999);
           
            string to =eid.Value;              //uname.Value.ToString(); //To address    
            string from = "magicplace9601@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "your OTP is "+r_otp+".Please Don't share this OTP with anyone.";
            message.Subject = "Security number";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            //System.Net.NetworkCredential basicCredential1 = new
            //System.Net.NetworkCredential("vickysingh960188@gmail.com", "");
            //client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            //client.Credentials = basicCredential1;
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "magicplace9601@gmail.com",
                Password = "m@gic9601"

            };
            client.EnableSsl = true;
            
            try
            {
                client.Send(message);

               
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }  
        }
      


    protected void reotp_Click(object sender, EventArgs e)
{
        OTP();
}
    protected void setotp_Click(object sender, EventArgs e)
    {
        try
        {

            int Otp = Int32.Parse(getotp.Text);


            if (Otp == r_otp)
            {
                //Response.Write("successfully");
                res.Visible = true;
                updt.Visible = true;
            }
            else
            {
               // res.Visible = true;
                otp.Visible = true;
                set.Visible = true;
                errmsg.Text = "Wrong OTP,Try again";


            }
        }
        catch
        {

            Response.Write("<script>alert(\"Something went wrong\")<script>");
        }
    }
    protected void upd_Click(object sender, EventArgs e)
    {
        try
        {
            SHA512 m = SHA512.Create();
            byte[] bytes = System.Text.ASCIIEncoding.ASCII.GetBytes(newpass.Value);
            byte[] hash = m.ComputeHash(bytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));

            }
            var pass = sb.ToString();




            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("update simpleuserregister set password='" + pass + "' where email='" + eid.Value + "'", con);
            cmd.ExecuteNonQuery();
            success = 1;
           // ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:run(); ", true);

            con.Close();
            res.Visible = true;
            res.InnerHtml = "Successfully updated";
            log.Visible = true;
            
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}
