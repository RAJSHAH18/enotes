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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void ServerClick(object sender, EventArgs e)
        {
            string name = Request["txt_name"];
            string email = Request["txt_email"];
            string password = Request["txt_password"];
            name = name.ToUpper();
            email = email.ToLower();
            int id = Convert.ToInt32(Session["id"]);
            cmd = new SqlCommand($"UPDATE users SET name='{name}',email='{email}',password='{password}' WHERE user_id={id}", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                Session["name"] = name;
                Session["email"] = email;
                Session["password"] = password;
                Response.Write("<script>alert('Porfile Updated Successfully')</script>");

            }
            else
            {
                Response.Write("<script>alert('Something Went Wrong')</script>");

            }
        }
    }
}