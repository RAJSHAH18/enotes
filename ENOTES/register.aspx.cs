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
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_click(object sender, EventArgs e)
        {
            string email = txt_email.Text;
            string password = txt_password.Text;
            string name = txt_username.Text;

            cmd = new SqlCommand($"SELECT count(*) FROM users WHERE email ='{email}'",con);
            con.Open();
            int res = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if(res>0)
            {
                Session["email_error"] = "EMAIL-ID IS ALREADY EXIXTS";

            }
            else
            {
                email = email.ToLower();
                name = name.ToUpper();
               
                string query = $"INSERT INTO users(name,email,password) VALUES('{name}','{email}','{password}')";
                cmd =  new SqlCommand(query, con);
                con.Open();
                int i = Convert.ToInt32(cmd.ExecuteNonQuery());
                con.Close();
                if(i == 1)
                {
                    Session["success_register"] = "REGISTER SUCCESSFULLY";
                    txt_username.Text = "";
                    txt_password.Text = "";
                    txt_email.Text = "";
                }
                else
                {
                    Session["fail_register"] = "SOMETHING WENT WRONG";
                }
            }



        }
    }
}