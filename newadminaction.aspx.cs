using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.Web.Services;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
    string get;
    static int getid;
   
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void search_click(object sender, EventArgs e)
    {
       
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from simpleuserregister where username ='" + textsearch.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (!dr.HasRows)
        {
            userinfo.DataSource = null;
            userinfo.DataBind();
            msg.InnerText = "No record found";
            
        }
        else
        {
            msg.InnerText = "";
            dr.Close();
            userinfo.DataSource = cmd.ExecuteReader();
            userinfo.DataBind();
        }
        con.Close();
    }
    protected void seeUser_ServerClick(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
       get = (item.FindControl("lblid") as Label).Text;
      
        Response.Redirect("adminaction.aspx?aaccd=" + get);


     




    }
    protected void actiononit_Click(object sender, EventArgs e)
    {




    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        get = (item.FindControl("lblid") as Label).Text;

        string mess = (item.FindControl("TextBox1") as TextBox).Text;
        string messsub = (item.FindControl("txtsub") as TextBox).Text;

        con.Open();
        SqlCommand cmd = new SqlCommand("select email,username from simpleuserregister where id=" + Convert.ToInt32(get) + "", con);
        string email="", username="";
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            email = dr["email"].ToString();
            username = dr["username"].ToString();

        }




        string to =email;              //uname.Value.ToString(); //To address    
        string from = "magicplace9601@gmail.com"; //From address    
        MailMessage message = new MailMessage(from, to);

        string mailbody = "Dear "+username+", "+Environment.NewLine+"";
        mailbody += ""+mess+"";
        message.Subject = messsub;
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


   
   
    //protected void actiononit_ServerClick(object sender, EventArgs e)
    //{
    //    ClientScript.RegisterStartupScript(this.GetType(), "openmodal", "setTimeout(function(){ $(\"#modalimage\").modal('show');},1000);", true);
  
    //}
    protected void actiononit_ServerClick(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        get = (item.FindControl("lblid") as Label).Text;
        getid = Convert.ToInt32(get);
      
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from useractivityblock where user_id="+getid+"",con);

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {

                status.Text = dr["activity1_newpost"].ToString();
                status1.Text = dr["activity2_updproperty"].ToString();
                status2.Text = dr["activity2_entireproperty"].ToString();

               
                if (dr["activity2_entireproperty"].ToString() == "Blocked")
                {
                    
                    chk2.Checked = true;

                }
                 if (dr["activity2_updproperty"].ToString() == "Blocked")
                {

                    chk1.Checked = true;

                }
                 if(dr["activity1_newpost"].ToString()=="Blocked")
                {
                    chk.Checked = true;

                }

                 if (dr["activity2_entireproperty"].ToString() != "Blocked")
                 {

                     chk2.Checked = false;

                 }

                 if (dr["activity2_updproperty"].ToString() != "Blocked")
                 {

                     chk1.Checked = false;

                 }
                 if (dr["activity1_newpost"].ToString() != "Blocked")
                 {
                     chk.Checked = false;

                 }
                 

                

            }
            //else
            //{

            //    Response.Write("no record found");
            //}


        }



        ClientScript.RegisterStartupScript(this.GetType(), "useractivity", "setTimeout(()=>{$(\"#modalimage\").modal('show'); },1000) ", true);
    }

    [WebMethod]
    public static int setdata(String stat)
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
        SqlCommand cmdchk = new SqlCommand("select count(*) from useractivityblock where user_id=" + getid + "", con);
       

            if (stat == "one_checked")
            {
                if (Convert.ToInt32(cmdchk.ExecuteScalar()) > 0)
                {

                SqlCommand cmd = new SqlCommand("update useractivityblock set activity1_newpost='Blocked'",con);
                    if(cmd.ExecuteNonQuery()>0)
                    {
                          return 1;

                    }
                    else
                    {

                        return 0;

                    }
                    

                }
                else
                {
  SqlCommand cmd = new SqlCommand("insert into useractivityblock (activity1_newpost,user_id) values('Blocked',"+getid+")",con);
                     if(cmd.ExecuteNonQuery()>0)
                    {
                          return 1;

                    }
                      else
                    {

                        return 0;

                    }

                }


           
            }

                
            else if (stat == "two_checked")
            {
                  if (Convert.ToInt32(cmdchk.ExecuteScalar()) > 0)
                {
                    SqlCommand cmd = new SqlCommand("update useractivityblock set activity2_updproperty='Blocked' where user_id=" + getid + "", con);
                    if(cmd.ExecuteNonQuery()>0)
                    {
                          return 1;

                    }
                    else
                    {

                        return 0;

                    }
                    

                }
                else
                {
  SqlCommand cmd = new SqlCommand("insert into useractivityblock (activity2_updproperty,user_id) values('Blocked',"+getid+")",con);
                     if(cmd.ExecuteNonQuery()>0)
                    {
                          return 1;

                    }
                      else
                    {

                        return 0;

                    }

                }


            }

            else if (stat == "one_notchecked")
            {
                if (Convert.ToInt32(cmdchk.ExecuteScalar()) > 0)
                {

                    SqlCommand cmd = new SqlCommand("update useractivityblock set activity1_newpost='Not Blocked' where user_id="+getid+"", con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return 1;

                    }
                    else
                    {

                        return 0;
                  
                    }


                }
                else
                {

                    return 0;
                }

            }

//sssssssssssssssssssssssssssseeeeeeeeeeeeeeeeccccccccccccccooooooooooooooonnnnnnnnnnnnnnnndddddddddddddddddddd

            else if (stat == "two_notchecked")
            {
                if (Convert.ToInt32(cmdchk.ExecuteScalar()) > 0)
                {
                    SqlCommand cmd = new SqlCommand("update useractivityblock set activity2_updproperty='Not Blocked' where user_id=" + getid + "", con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return 1;

                    }
                    else
                    {

                        return 0;

                    }

                }
                else
                {
                    return 0;

                }

            }

            else if(stat=="three_checked")
            {


                if (Convert.ToInt32(cmdchk.ExecuteScalar()) > 0)
                {
                    SqlCommand cmd = new SqlCommand("update useractivityblock set activity1_newpost='Blocked',activity2_updproperty='Blocked',activity2_entireproperty='Blocked' where user_id=" + getid + "", con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return 1;

                    }
                    else
                    {

                        return 0;

                    }


                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert into useractivityblock (activity1_newpost,activity2_updproperty,activity2_entireproperty,user_id) values('Blocked','Blocked','Blocked'," + getid + ")", con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return 1;

                    }
                    else
                    {

                        return 0;

                    }

                }



            }

            else if (stat == "three_notchecked")
            {

                if (Convert.ToInt32(cmdchk.ExecuteScalar()) > 0)
                {
                    SqlCommand cmd = new SqlCommand("update useractivityblock set activity1_newpost='Not Blocked',activity2_updproperty='Not Blocked',activity2_entireproperty='Not Blocked' where user_id=" + getid + "", con);
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        return 1;

                    }
                    else
                    {

                        return 0;

                    }

                }
                else
                {
                    return 0;

                }
            }

            else
            {
                return 0;

            }



             

            }



      

        }



     



       
     

    
