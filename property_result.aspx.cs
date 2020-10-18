using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Net;
using System.Net.Sockets;
using AjaxControlToolkit;
using System.Globalization;

public partial class property_result : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataReader dr,dr1,dr2;

    int id, seller;
    public int cnt;
    public static int cnt1,cnt2,user_id,r_otp;

    string myip = "";
    public String type="",type1="",arr="";
    public List<String> img = new List<string>();
    public List<string> useraid = new List<string>();
    
   
    protected void Page_Load(object sender, EventArgs e)
    {


       
    id = Int32.Parse(Request.QueryString["id"]);
        IPHostEntry iph;
       
        iph = Dns.GetHostEntry(Dns.GetHostName());
        foreach (IPAddress ip in iph.AddressList)
        {
            if (ip.AddressFamily == AddressFamily.InterNetwork)
            {
                myip = ip.ToString();
            }
        }
        //Response.Write(myip);
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");

       //i have used MultipleActiveResultSets=true in connectionstring for allowing multiple resultset.
        con.Open();
      
        user_id = Convert.ToInt32(Session["id"]);
      

        SqlCommand cmdchk = new SqlCommand("select count(*) from tblrating where property_id=" + id + " and userid=" +user_id+ "", con);
       // Response.Write(cmdchk.CommandText);
        SqlCommand feedchk = new SqlCommand("select count(*) from userfeedbacktbl where property_id=" + id + " and userid="+user_id+"", con);
      //  Response.Write(feedchk.CommandText);
        if(user_id == 0)
        {
            msg.Visible = false;
            Rating1.Visible = false;
            btnagain.Visible = false;
            Ufeedback.Visible = false;
           

        }


        else if (Convert.ToInt32(cmdchk.ExecuteScalar()) == 1)
        {

            cnt1 = 1;
            msg.Visible = false;
            Rating1.Visible = false;
            btnagain.Visible = true;
           


        }
        //else if (Convert.ToInt32(cmdchk.ExecuteScalar()) == 1)
        //{
        //    msg.Visible = false;
        //    Rating1.Visible = false;
        //    btnagain.Visible = true;
        //}
        else
        {

            msg.Visible = true;
            Rating1.Visible = true;
            btnagain.Visible = false;

        }
        //SqlDataReader drat = cmdchk.ExecuteReader();
        //while (drat.Read())
        //{

        //    useraid.Add(drat["userid"].ToString());
        //}
        if (user_id == 0)
        {
            feedbacksec.Visible = false;
            feedagain.Visible = false;

        }
        else if (Convert.ToInt32(feedchk.ExecuteScalar()) == 1)
        {
            feedbacksec.Visible = false;
            feedagain.Visible = true;
            cnt2 = 1;

        }
        else
        {
            feedbacksec.Visible = true;
            feedagain.Visible = false;

        }




        if (Request.QueryString["type"]!= null)
        {
          
            type1 = Request.QueryString["type"];
        }
        else
        {


            type = Session["type"].ToString();

        }
        if((type == "apartment" || type == "Apartment") || (type1=="Apartment" || type1=="apartment"))
        {

        

           
            SqlCommand cmd = new SqlCommand("select * from propertydata where property_id=" + id + "", con);


            dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                bed.Text = Convert.ToString(dr["bedrooms"]);
                bathroom.Text = Convert.ToString(dr["Bathroom"]);
                balcony.Text = Convert.ToString(dr["balconies"]);
                property_for.Text = Convert.ToString(dr["property_for"]).ToUpper();
                lblplot.Text = String.Concat(Convert.ToString(dr["plot_area"]), Convert.ToString(dr["plot_area_unit"]));
                lblcover.Text = String.Concat(Convert.ToString(dr["covered_area"]), Convert.ToString(dr["cover_area_unit"]));
                lbltransactionType.Text = Convert.ToString(dr["transaction_type"]);
                if (Convert.ToInt32(dr["price_includes"]) >= 1)
                {
                    lblparking.Text = "Yes";
                }
                lblfurnished.Text = Convert.ToString(dr["furnished_status"]);
                lbllifts.Text = Convert.ToString(dr["lift"]);
                seller = Convert.ToInt32(dr["user_id"]);
                if (Convert.ToString(dr["address"]) != "")
                {
                    lbladd.Text = Convert.ToString(dr["address"]);
                }
                else
                {
                    lbladd.Text = Convert.ToString(dr["locality"]) + " " + Convert.ToString(dr["city"]) + " " + Convert.ToString(dr["state"]);
                }

                if (Convert.ToString(dr["property_for"]) == "rent")
                {
                    string price = dr["expected_price"].ToString();
                    //String ex_price = string.Format("{0:n}", price);
                    decimal parsed = decimal.Parse(price, CultureInfo.InvariantCulture);
                    CultureInfo hindi = new CultureInfo("hi-IN");
                    lblprice.Text = string.Format(hindi, "{0:c}", parsed);
         
                    lblprice.Text+=" Per month";
                }
                else if (Convert.ToString(dr["property_for"]) == "PG")
                {
                    string price = dr["expected_price"].ToString();
                    //String ex_price = string.Format("{0:n}", price);
                    decimal parsed = decimal.Parse(price, CultureInfo.InvariantCulture);
                    CultureInfo hindi = new CultureInfo("hi-IN");
                    lblprice.Text = string.Format(hindi, "{0:c}", parsed);

                    lblprice.Text += " Per month";

                }
                else
                {
                    //int price = Convert.ToInt32(dr["expected_price"]);
                    //String ex_price = string.Format("{0:n}", price);
                    //lblprice.Text = ex_price;
                    string price = dr["expected_price"].ToString();
                    //String ex_price = string.Format("{0:n}", price);
                    decimal parsed = decimal.Parse(price, CultureInfo.InvariantCulture);
                    CultureInfo hindi = new CultureInfo("hi-IN");
                    lblprice.Text = string.Format(hindi, "{0:c}", parsed);

                  


                }
                lbllandmark.Text = Convert.ToString(dr["landmark"]);
                flooring.Text = Convert.ToString(dr["flooring"]);
                lblelec.Text = Convert.ToString(dr["statusOfElectricity"]);
                furnishst.Text = Convert.ToString(dr["furnished_status"]);
                vi.Visible = true;
                lblpropertyName.Text = Convert.ToString(dr["propertyName"]);
                possession.Text = Convert.ToString(dr["possession_status"]).ToUpper();
                if (Convert.ToString(dr["possession_status"]) == "under construction")
                {
                    possess.Text = "Construction shall complete at";
                    constructValue.Text = String.Concat("-      ",Convert.ToString(dr["construct_complete"]));
                }
                else
                {
                    possess.Text = "Construction Age";
                    if(Convert.ToString(dr["Age_of_construction"])=="new")
                    constructValue.Text = String.Concat("-     ","New Construction");
                }
            }


            SqlCommand cmd1 = new SqlCommand("select imgname from pimages where property_id=" + id + "", con);
            //  SqlCommand cmcount = new SqlCommand("select count(*) from pimages where property_id=" + id + "", con);
            // cnt = (Int32)cmcount.ExecuteScalar();
            //  Response.Write(cmd1.CommandText);

            dr1 = cmd1.ExecuteReader();

            while (dr1.Read())
            {
                //img[i] = Convert.ToString(dr1["imgname"]);
                //if (Convert.ToString(dr1["imgname"])!="")
                //{
                //    i++;
                //}
                img.Add(Convert.ToString(dr1["imgname"]));


            }
           // imgbtn.Src = img[0];


            //    Image1.ImageUrl = img[0];

            for (int i = 0; i < img.Count; i++)
            {
                arr += img[i];
            }


            //    imgbtn.Src = img[0];

            //  imgsee.Src = img[0];
            // Response.Write("  "+img.Count);  

        //    Response.Write(arr);


            //SqlCommand cmd2 = new SqlCommand("select username,email,contactno from simpleuserregister where id=" + seller + "", con);

            //dr2 = cmd2.ExecuteReader();
        }

        else
        {

            id = Int32.Parse(Request.QueryString["id"]);

            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");
            //i have used MultipleActiveResultSets=true in connectionstring for allowing multiple resultset.
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Rpropertydata where Rproperty_id=" + id + "", con);


            dr = cmd.ExecuteReader();


            while (dr.Read())
            {
                bed.Text = Convert.ToString(dr["Rbedrooms"]);
                bathroom.Text = Convert.ToString(dr["RBathroom"]);
                balcony.Text = Convert.ToString(dr["Rbalconies"]);
                property_for.Text = Convert.ToString(dr["rproperty_for"]).ToUpper();
                lblplot.Text = String.Concat(Convert.ToString(dr["Rplot_area"]), Convert.ToString(dr["Rplot_area_unit"]));
                lblcover.Text = String.Concat(Convert.ToString(dr["Rcovered_area"]), Convert.ToString(dr["Rcover_area_unit"]));
                lbltransactionType.Text = Convert.ToString(dr["Rtransaction_type"]);
                if (Convert.ToInt32(dr["Rprice_includes"]) >= 1)
                {
                    lblparking.Text = "Yes";
                }
                lblfurnished.Text = Convert.ToString(dr["Rfurnished_status"]);
              
                  //  lbllifts.Text = Convert.ToString(dr["Rlift"]);
                lbllifts.Visible = false;
                    seller = Convert.ToInt32(dr["Ruser_id"]);
                if (Convert.ToString(dr["address"]) != "")
                {
                    lbladd.Text = Convert.ToString(dr["address"]);
                }
                else
                {
                    lbladd.Text = Convert.ToString(dr["Rlocality"]) + " " + Convert.ToString(dr["Rcity"]) + " " + Convert.ToString(dr["Rstate"]);
                }
                if (Convert.ToString(dr["Rproperty_for"]) == "rent")
                {
                    int price = Convert.ToInt32(dr["Rexpected_price"]);
                    String ex_price = string.Format("{0:n}", price);
                    lblprice.Text = ex_price + " Per month";
                }
                else if (Convert.ToString(dr["Rproperty_for"]) == "PG")
                {
                    int price = Convert.ToInt32(dr["Rexpected_price"]);
                    String ex_price = string.Format("{0:n}", price);
                    lblprice.Text = ex_price + " Per month";

                }
                else
                {
                    int price = Convert.ToInt32(dr["Rexpected_price"]);
                    String ex_price = string.Format("{0:n}", price);
                    lblprice.Text = ex_price;
                }

                lbllandmark.Text = Convert.ToString(dr["landmark"]);
                flooring.Text = Convert.ToString(dr["flooring"]);
                lblelec.Text = Convert.ToString(dr["statusOfElectricity"]);
                furnishst.Text = Convert.ToString(dr["Rfurnished_status"]);
                possession.Text = Convert.ToString(dr["Rpossession_status"]).ToUpper();
                vi.Visible = false;
                if (Convert.ToString(dr["Rpossession_status"]) == "under construction")
                {
                    possess.Text = "Construction shall complete at";
                    constructValue.Text = String.Concat("-      ", Convert.ToString(dr["Rconstruct_complete"]));
                }
                else
                {
                    possess.Text = "Construction Age";
                    if (Convert.ToString(dr["RAge_of_construction"]) == "new")
                        constructValue.Text = String.Concat("-     ", "New Construction");
                    else
                    {
                        constructValue.Text = String.Concat("-     ", Convert.ToString(dr["RAge_of_construction"]));
                    }
                }
            }


            SqlCommand cmd1 = new SqlCommand("select imgname from r_pimages where rproperty_id=" + id + "", con);
            //  SqlCommand cmcount = new SqlCommand("select count(*) from pimages where property_id=" + id + "", con);
            // cnt = (Int32)cmcount.ExecuteScalar();
            //  Response.Write(cmd1.CommandText);

            dr1 = cmd1.ExecuteReader();

            while (dr1.Read())
            {
                //img[i] = Convert.ToString(dr1["imgname"]);
                //if (Convert.ToString(dr1["imgname"])!="")
                //{
                //    i++;
                //}
                img.Add(Convert.ToString(dr1["imgname"]));


            }
           // imgbtn.Src = img[0];


            //    Image1.ImageUrl = img[0];

            for (int i = 0; i < img.Count; i++)
            {
                arr += img[i];
            }


  
        }

        try
        {
            img12.Visible = true;
            //SqlCommand ratingchk = new SqlCommand("select AVG(rating),count(*) from tblrating where property_id=" + id + "", con);
            //SqlDataReader dra = ratingchk.ExecuteReader();
            //while (dra.Read())
            //{
            //    int x = (Int32)dra[0];
            //    double round = Math.Ceiling((double)x);
            //    lblrating.Text = string.Concat(Convert.ToString(round), "/5");
            //    lblpeople.Text = string.Concat(dra[1].ToString(), " people have been rated");

            //}
            SqlCommand ratingchk = new SqlCommand("select rating from tblrating where property_id=" + id + "", con);
            int x = 0;
            SqlDataReader dra = ratingchk.ExecuteReader();
            while (dra.Read())
            {
                x +=Convert.ToInt32(dra[0]);

            }
           // Response.Write(x);
            SqlCommand ratingchk1 = new SqlCommand("select count(*) from tblrating where property_id=" + id + "", con);
            int totalc = Convert.ToInt32(ratingchk1.ExecuteScalar());
            if (totalc != 0)
            {
                double round = Math.Ceiling((double)x / totalc);
                lblrating.Text = string.Concat(round, "/5");

                lblpeople.Text = string.Concat(totalc, " people have been rated");

            }
            else
            {
                lblrating.Text ="0/5";
                lblpeople.Text = string.Concat("No One have been rated yet");
            }


            
         
        }
        catch(Exception ex)
        {
            //Response.Write(ex.Message);
            lblrating.Text = "<u><b>New</b></u> currently uploaded property";
            img12.Visible = false;

        }

        con.Close();


        //Random r = new Random();

        //otp = r.Next(100000, 999999);
        //randomnum.InnerHtml = otp.ToString();
        con.Open();
        SqlCommand cmdfeed = new SqlCommand("select s.username,u.userfeedback,t.rating from simpleuserregister s inner join userfeedbacktbl u on u.userid=s.id and  u.property_id=" + id + " inner join tblrating t on t.userid=s.id and  t.property_id=" + id + "", con);
       // Response.Write(cmdfeed.CommandText);
        comment.DataSource = cmdfeed.ExecuteReader();
        comment.DataBind();
        con.Close();

        if (comment.Items.Count == 0)
        {
            lblmsr.Text = "No Feedback has given yet";
        }
        else
        {
            lblmsr.Text = "";

        }


    }




    protected void ddlchoice_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }

    protected void btncontact_Click1(object sender, EventArgs e)
    {
        string sellername = "", selleremail = "";
        long scontactno = 0;
        

        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");
        con.Open();
        SqlCommand comm1 = new SqlCommand("select username,email,contactno from simpleuserregister where id in (select user_id from propertydata where property_id=" + id + ")", con);
               

        if (Convert.ToInt32(ddlchoice.SelectedValue) == 1)
        {
            try
            {
                String preference = ddllist1.SelectedItem.ToString();
                String username = Session["user"].ToString();
                String email="", mobno="";
                // Response.Write("<script>alert('" + username + "')</script>");

                
                SqlCommand comm = new SqlCommand("select email,contactno from simpleuserregister where username='" + username + "'", con);
                 //Response.Write(comm1.CommandText);

                SqlDataReader dr3 = comm1.ExecuteReader();
                SqlDataReader dr4 = comm.ExecuteReader();
                while (dr4.Read())
                {
                    email =dr4["email"].ToString();
                     mobno = dr4["contactno"].ToString();
                }
                while (dr3.Read())
                {
                    sellername = dr3["username"].ToString();
                    selleremail = dr3["email"].ToString();
                    scontactno = (long)dr3["contactno"];

                }

                string to =email;              //uname.Value.ToString(); //To address    
                string from = "magicplace9601@gmail.com"; //From address    
                MailMessage message = new MailMessage(from, to);

                string mailbody = "Hello " + username + "," +Environment.NewLine+" your viewed property seller name is '" + sellername + "'." + Environment.NewLine + "Seller's Email-id is '" + selleremail + "'" + Environment.NewLine + " seller's mobile no. is '" + scontactno + "'.";
                message.Subject = "Contact information";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = false;
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

                //-----------------------------------------------------------------------------------------------------------------------
                //email sent to seller

                string sto = selleremail;              //uname.Value.ToString(); //To address    
                string sfrom = "magicplace9601@gmail.com"; //From address    
                MailMessage mess = new MailMessage(sfrom, sto);

                string smailbody = "User's name : " + username + "" + Environment.NewLine + "User's mobile no: '" + mobno + "'" + Environment.NewLine + "User's Email-id: '" + email + "'" + Environment.NewLine + "" + username + " is interested in " + preference + "";

                mess.Subject = "Contact information";
                mess.Body = smailbody;
                mess.BodyEncoding = Encoding.UTF8;
                mess.IsBodyHtml = false;
                SmtpClient client1 = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                //System.Net.NetworkCredential basicCredential1 = new
                //System.Net.NetworkCredential("vickysingh960188@gmail.com", "");
                //client.EnableSsl = true;
                client1.UseDefaultCredentials = false;
                //client.Credentials = basicCredential1;
                client1.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "magicplace9601@gmail.com",
                    Password = "m@gic9601"

                };
                client1.EnableSsl = true;








                try
                {
                    client.Send(message);
                    client1.Send(mess);
                    ClientScript.RegisterStartupScript(this.GetType(), "success", "setTimeout(function(){  $(\"#exampleModal\").modal('show'); document.getElementById(\"txtverify\").style.display=\"none\";  document.getElementById(\"msq\").innerHTML=\"We have sent the seller information to your Email \";  document.getElementById(\"btngetcontact\").style.display=\"none\";},1500); ", true);


                }

                catch (Exception ex)
                {
                    Response.Write("Something went wrong,Might be your internet connection is weak");
                }  

                con.Close();

            }
            catch
            {

                Response.Write("<script>alert(\"Register Yourself Or Sign in first\")</script>");

            }

        }
       
    }

    protected void btnverify_Click(object sender, EventArgs e)
    {



    }


    protected void btnsend_Click(object sender, EventArgs e)
    {
        if (txtna.Text != "" && txtmob.Text != "" && txtemail.Text != "")
        {

            string Email = txtemail.Text;
            Random rn = new Random();
            r_otp = rn.Next(10000, 99999);

            string sto = Email;              //uname.Value.ToString(); //To address    
            string sfrom = "magicplace9601@gmail.com"; //From address    
            MailMessage mess = new MailMessage(sfrom, sto);

            string smailbody = "Hello user " + Environment.NewLine + " Your verification number is " + r_otp;

            mess.Subject = "Verify yourself";
            mess.Body = smailbody;
            mess.BodyEncoding = Encoding.UTF8;
            mess.IsBodyHtml = false;
            SmtpClient client1 = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            //System.Net.NetworkCredential basicCredential1 = new
            //System.Net.NetworkCredential("vickysingh960188@gmail.com", "");
            //client.EnableSsl = true;
            client1.UseDefaultCredentials = false;
            //client.Credentials = basicCredential1;
            client1.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "magicplace9601@gmail.com",
                Password = "m@gic9601"

            };
            client1.EnableSsl = true;



            try
            {

                client1.Send(mess);

                //   Response.Write("<script>alert(\"successfully sent\")</script>");

                //string script = " $("+#btnsend+").click(function(){
                //       $("#modalform").modal('hide');
                //       $("#exampleModal").modal('show');


                //   });"; 


                ClientScript.RegisterStartupScript(this.GetType(), "mlaunch", "setTimeout(function(){  $(\"#getcontact\").modal('hide');  $(\"#exampleModal\").modal('show');},1500); ", true);
            }

            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
            
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "failure1", "setTimeout(function(){ $(\"#getcontact\").modal('show'); document.getElementById(\"msq\").innerHTML=\"Any field might have left \";},1500);", true);



            }



    }



    protected void btngetcontact_Click(object sender, EventArgs e)
    {
        string data = txtverify.Text;
        string sellername = "", selleremail = "";
        long scontactno = 0;



        if (Convert.ToInt32(data) == r_otp)
        {
            String cname = txtna.Text;
            String cmob = txtmob.Text;
            String cemail = txtemail.Text;
           // string preference = "";
             String preference = dropchoice.SelectedItem.ToString();

            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");
            con.Open();
            SqlCommand comm1 = new SqlCommand("select username,email,contactno from simpleuserregister where id in (select user_id from propertydata where property_id=" + id + ")", con);

            SqlDataReader dr3 = comm1.ExecuteReader();
            while (dr3.Read())
            {
                sellername = dr3["username"].ToString();
                selleremail = dr3["email"].ToString();
                scontactno = (long)dr3["contactno"];

            }

            string to = cemail;              //uname.Value.ToString(); //To address    
            string from = "magicplace9601@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "Hello " + cname + "," + Environment.NewLine + " your viewed property seller name is '" + sellername + "'." + Environment.NewLine + "Seller's Email-id is '" + selleremail + "'" + Environment.NewLine + " seller's mobile no. is '" + scontactno + "'.";
            message.Subject = "contact information";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = false;
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

            //-----------------------------------------------------------------------------------------------------------------------
            //email sent to seller

            string sto = selleremail;              //uname.Value.ToString(); //To address    
            string sfrom = "magicplace9601@gmail.com"; //From address    
            MailMessage mess = new MailMessage(sfrom, sto);

            string smailbody = "User's name : " + cname + "" + Environment.NewLine + "User's mobile no: '" + cmob + "'" + Environment.NewLine + "User's Email-id: '" + cemail + "'" + Environment.NewLine + "" + cname + " is interested in " + preference + "";

            mess.Subject = "Contact information";
            mess.Body = smailbody;
            mess.BodyEncoding = Encoding.UTF8;
            mess.IsBodyHtml = false;
            SmtpClient client1 = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            //System.Net.NetworkCredential basicCredential1 = new
            //System.Net.NetworkCredential("vickysingh960188@gmail.com", "");
            //client.EnableSsl = true;
            client1.UseDefaultCredentials = false;
            //client.Credentials = basicCredential1;
            client1.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "magicplace9601@gmail.com",
                Password = "m@gic9601"

            };
            client1.EnableSsl = true;



            try
            {
                client.Send(message);
                client1.Send(mess);
                ClientScript.RegisterStartupScript(this.GetType(), "success", "setTimeout(function(){  $(\"#exampleModal\").modal('show'); document.getElementById(\"txtverify\").style.display=\"none\";  document.getElementById(\"msq\").innerHTML=\"We have sent the seller information to your Email \";  document.getElementById(\"btngetcontact\").style.display=\"none\";},1500); ", true);


            }

            catch (Exception ex)
            {
                    ClientScript.RegisterStartupScript(this.GetType(), "failure", "setTimeout(function(){  $(\"#exampleModal\").modal('show'); document.getElementById(\"msq\").innerHTML=\"Something went wrong. Please Try again later \";},1500);", true);
              
            }




                con.Close();

            }

           else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "succe", "setTimeout(function(){ $(\"#exampleModal\").modal('show');  document.getElementById(\"msq\").innerHTML=\"Wrong OTP \";},1500);", true);



        }
        }
     

        


           
        
    
    //protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    //{
    //   // Response.Write("<script>alert(\"you have rated this property as "+e.Value.ToString()+"\")</script>");
    //    Response.Write("you have rated this property as " + e.Value.ToString() + "");
    //    lblmsg.Text = "you have rated this property as " + e.Value.ToString() + "";
    //}
    protected void Rating1_Changed1(object sender, RatingEventArgs e)
    {
        user_id = Convert.ToInt32(Session["id"]);
        try
        {

            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");
            //i have used MultipleActiveResultSets=true in connectionstring for allowing multiple resultset.
            con.Open();

            if (cnt1 == 1)
            {
                SqlCommand sq = new SqlCommand("update tblrating set rating="+e.Value+" where property_id="+id+" and userid="+user_id+"", con);
                Response.Write(sq.CommandText);
                sq.ExecuteNonQuery();
                con.Close();
  

            }
            else
            {
              
                SqlCommand sq = new SqlCommand("insert into tblrating (rating,property_id,userip,userid) values(" + e.Value + "," + id + ",'" + myip + "'," + user_id + ")", con);
                Response.Write(sq.CommandText);
                sq.ExecuteNonQuery();
                con.Close();
  
            }
        }
        catch
        {
            msg.InnerHtml = "Sorry, something went wrong";
           
        }

      
    
    }
    protected void Rating1_Click(object sender, RatingEventArgs e)
    {
       
    }
    protected void btnagain_Click(object sender, EventArgs e)
    {
        msg.Visible = true;
        Rating1.Visible = true;
        btnagain.Visible = false;

     

       



    }
    protected void subfeed_Click(object sender, EventArgs e)
    {
        user_id = Convert.ToInt32(Session["id"]);
        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True;MultipleActiveResultSets=true");
        //i have used MultipleActiveResultSets=true in connectionstring for allowing multiple resultset.
        con.Open();
        if (cnt2 == 1)
        {
            SqlCommand cmd = new SqlCommand("update userfeedbacktbl set [userfeedback]='"+Ufeedback.Value+"' where property_id="+id+" and userid="+user_id+"", con);
            cmd.ExecuteNonQuery();
           
        }
        else
        {
          
            SqlCommand cmd = new SqlCommand("insert into userfeedbacktbl ([userfeedback],[property_id],[userid]) values ('" + Ufeedback.Value + "'," + id + ","+user_id+")", con);
            cmd.ExecuteNonQuery();
          
        }
        con.Close();
        Response.Redirect(Request.RawUrl);

        //ClientScript.RegisterStartupScript(this.GetType(), "feed", "setTimeout(function(){ $(\"#feedmodal\").modal(\"show\"); },1500)",true);
    }
    protected void feedagain_Click(object sender, EventArgs e)
    {
        feedbacksec.Visible = true;
        feedagain.Visible = false;
    }


  
}