using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TMS_Project
{
    public partial class Contact : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TMSDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
         void ResetContact()
        {
            NameTextBox.Text = "";
            EmailTextBox.Text = "";
            SubjectDropDownList.SelectedIndex = 0;
            MessageTextBox.Text = "";
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string sp = "spContact_Insert";
            SqlCommand cmd = new SqlCommand(sp, con);
            cmd.CommandType = CommandType.StoredProcedure;  
            cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
            cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@Subject", SubjectDropDownList.SelectedItem.Text); 
            cmd.Parameters.AddWithValue("@Message", MessageTextBox.Text);
            
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                //Response.Write("<script>alert('Message Sent Successfully!');</script>");
                //Response.Write("<script>SuccessContact()</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessContact", "SuccessContact();", true);
                ResetContact();
            }
            else
            {
                //Response.Write("<script>alert('Message Not Sent!');</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorContact", "ErrorContact();", true);
            }
            con.Close();
            //Response.Redirect("~/Default.aspx");

        }
    }
}