using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace ENOTES
{
    public partial class shownotes : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int uid = Convert.ToInt32(Session["id"]);
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand($"SELECT * FROM notes WHERE uid ={uid} ORDER BY id DESC ", con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    rptNotes.DataSource = sdr;
                    rptNotes.DataBind();
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
           
            Response.Write($"{id}");
            cmd = new SqlCommand($"DELETE FROM notes WHERE id = {id}",con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if(i==1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('DELETED SUCCESSFULLY','','success');",true);
                //Response.Write("<script>alert('DELETED SUCCESSFULLY')</script>");
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('SOMETHING WENTWRONG','','error')",true);

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}