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
    public partial class users : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\enotes\ENOTES\App_Data\enotes.mdf;Integrated Security=True");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                gridfill();
            }
        }
        protected void gridfill()
        {

            cmd = new SqlCommand("SELECT * FROM users WHERE role not like 'admin'",con);
            con.Open();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int count = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox cbox = (row.Cells[0].FindControl("Checkbox1") as CheckBox);
                int id = Convert.ToInt32((row.FindControl("Label4") as Label).Text);
                if (cbox.Checked)
                {
                    deleterow(id);
                    count = count + 1;
                }
            }
            if(count>0)
            {
               ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('DELETED SUCCESSFULLY','','success');setTimeout(function(){location.replace('users.aspx');},2000)", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('SOMETHING WENTWRONG','','error')", true);
            }

        }
        protected void deleterow(int id)
        {
            cmd = new SqlCommand($"DELETE FROM users WHERE user_id={id}", con);
            con.Open();
                int i = cmd.ExecuteNonQuery();
            con.Close();
            //if(i==1)
            //{
            //    ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('DELETED SUCCESSFULLY','','success');", true);
            //}
            //else
            //{
            //    ClientScript.RegisterClientScriptBlock(this.GetType(), "message", "swal('SOMETHING WENTWRONG','','error')", true);
            //}
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType!=DataControlRowType.EmptyDataRow)
            {
                e.Row.Cells[4].Visible = false;
            }
        }
    }
}