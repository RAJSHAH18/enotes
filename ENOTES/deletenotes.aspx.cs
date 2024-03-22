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
    public partial class deletenotes : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                cmd = new SqlCommand("DELETE FROM notes WHERE Id ="+id, con);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i == 1)
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('DELETED SUCCESSFULLY','','success');setTimeout(function(){location.replace('shownotes.axpx');},2000)", true);
                    Response.Write("<script>alert('DELETED SUCCESSFULLY');location.replace('shownotes.aspx')</script>");
                }
                else
                {
                    Response.Write("<script>alert('SOMETHING WENT WRONG');loca tion.replace('shownotes.aspx')</script>");
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('SOMETHING WENTWRONG','','error');setTimeout(function(){location.replace('shownotes.axpx');},2000)", true);
                }
            }



        }
    }
}