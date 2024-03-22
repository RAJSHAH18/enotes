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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string email = txt_email.Text;
            string password = txt_password.Text;
            email = email.ToLower();
            cmd = new SqlCommand($"SELECT * FROM users WHERE email = '{email}' AND password = '{password}'",con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if(sdr.HasRows)
            {
                if(sdr.Read())
                {
                    Session["name"] = sdr["name"];
                    Session["email"] = sdr["email"];
                    Session["role"] = sdr["role"];
                    Session["id"] = sdr["user_id"];
                    Session["password"] = sdr["password"];
                    txt_email.Text = "";
                    txt_password.Text = "";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "swal('LOGIN SUCCESSFULL','','success');setTimeout(function(){location.replace('home.aspx');},2000);", true);

                }
                con.Close();
            }
            else
            {
                con.Close();
                string query = $"SELECT count(*) FROM users WHERE email='{email}'";
                cmd = new SqlCommand(query, con);
                con.Open();
                int i = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                if (i == 1)
                {
                        //Response.Write("<script>alert('PASSWORD IS INCORRECT')</script>");
                        Session["password_error"] = "PASSWORD IS INCORRECT";
                    
                }
                else
                {
                    Session["register_error"] = "PLEASE REGISTER FIRST!";

                    //Response.Write("<script>alert('PLEASE REGISTER FIRST!')</script>");
                }
            }
        }
    }
}