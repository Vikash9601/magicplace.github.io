using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class image : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {

        con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
        con.Open();
      
        cmd = new SqlCommand("select pimage from img where id=5", con);
        byte[] byt=(byte[])cmd.ExecuteScalar();
        string strbs64 = Convert.ToBase64String(byt);
        imgl.ImageUrl = "data:Image/gif/jpg/gif;base64," + strbs64;
        con.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (fuload.HasFile)
        {
            HttpPostedFile posted = fuload.PostedFile;
            Stream stream = posted.InputStream;
            BinaryReader binary = new BinaryReader(stream);
            byte[] bytes = binary.ReadBytes((int)stream.Length);
            con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\webdata.mdf;Integrated Security=True");
            con.Open();
            cmd = new SqlCommand("insert into img (pimage) values (@pimage)", con);
            cmd.Parameters.Add("@pimage", bytes);
            cmd.ExecuteNonQuery();
            Response.Write("image inserted"); 
            con.Close();
        }
    }
}