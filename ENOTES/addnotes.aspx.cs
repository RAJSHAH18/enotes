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
    public partial class addnotes : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string title = txt_title.Text;
            string content = txt_content.Text;
            int uid = Convert.ToInt32(Session["id"]);
            cmd = new SqlCommand($"INSERT INTO notes(title,content,uid) VALUES('{title}','{content}',{uid})",con);
            con.Open();
            int i = Convert.ToInt32(cmd.ExecuteNonQuery());
            con.Close();
            if(i==1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('NOTES ADDED SUCCESSFULLY','','success')", true);
                txt_title.Text = "";
                txt_content.Text = "";
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('NOTES ADDED SUCCESSFULLY','','error')", true);

            }

        }
    }
}