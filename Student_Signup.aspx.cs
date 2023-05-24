using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace TMSProject
{
    public partial class Student_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TMSDBConnection"].ConnectionString;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountryDDL();
            }
        }

        protected void CountryTextBox_TextChanged(object sender, EventArgs e)
        {

        }
        //void BindGoingToDDL()
        //{
        //    SqlConnection con = new SqlConnection(cs);
        //    //string query = "select * from country";
        //    string query = "SELECT country_id, country_name FROM country";
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    con.Open();
        //    CountryDropDownList.DataSource = cmd.ExecuteReader();
        //    CountryDropDownList.DataTextField = "country_name";
        //    CountryDropDownList.DataValueField = "country_name";

        //    CountryDropDownList.DataBind();

        //    ListItem selectItem = new ListItem("--Select Country--", "0");
        //    CountryDropDownList.Items.Insert(0, selectItem);
        //    con.Close();

        //}

        void BindCountryDDL()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from country";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            CountryDropDownList.DataSource = reader;
            //CountryDropDownList.DataValueField = "country_id";

            CountryDropDownList.DataTextField = "country_name";
            CountryDropDownList.DataValueField = "country_id";
            CountryDropDownList.DataBind();

            ListItem selectItem = new ListItem("--Select Country--", "0");
            CountryDropDownList.Items.Insert(0, selectItem);
            con.Close();
        }


        void BindCityDDL(int country_id)
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from city where c_id = @country_id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@country_id", CountryDropDownList.SelectedValue);
            con.Open();
            CityDropDownList.DataSource = cmd.ExecuteReader();
            CityDropDownList.DataTextField = "city_name";
            CityDropDownList.DataValueField = "city_id";
            CityDropDownList.DataBind();

            ListItem selectItem = new ListItem("--Select City--", "0");
            CityDropDownList.Items.Insert(0, selectItem);
            con.Close();

        }

        void clear()
        {
            NameTextBox.Text = "";
            ParentTextBox.Text = "";
            LastnameTextBox.Text = "";
            GenderDropDownList.ClearSelection();
            AgeTextBox.Text = "";
            CountryDropDownList.ClearSelection();
            //CityTextBox.Text = "";
            CityDropDownList.ClearSelection();
            AddressTextBox.Text = "";
            GradeTextBox.Text = "";
            GoingToDropDownList.ClearSelection();
            SubjectTextBox.Text = "";
            ContactTextBox.Text = "";
            TuitionTypeDropDownList.ClearSelection();
            TuitorPreferenceDropDownList.ClearSelection();
            UsernameTextBox.Text = "";
            PasswordTextBox.Text = "";
            ConfirmPasswordTextBox.Text = "";

        }
        protected void StudentSignUpButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "insert into student_signup values(@name, @parent, @lastname, @gender, @age, @country, @city, @address, @grade, @goingto, @subject, @contact, @tuitiontype, @tuitorpreference, @username, @password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@parent", ParentTextBox.Text);
                cmd.Parameters.AddWithValue("@lastname", LastnameTextBox.Text);
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(AgeTextBox.Text));
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@city", CityDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text);
                cmd.Parameters.AddWithValue("@grade", GradeTextBox.Text);
                cmd.Parameters.AddWithValue("@goingto", GoingToDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@subject", SubjectTextBox.Text);
                cmd.Parameters.AddWithValue("@contact", ContactTextBox.Text);
                cmd.Parameters.AddWithValue("@tuitiontype", TuitionTypeDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@tuitorpreference", TuitorPreferenceDropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);


                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('You have Registered Successfully')</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Success','You have Registered Successfully','success')", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Failure','Registeration Failed..','error')", true);
                    //Response.Write("<script>alert('Registeration Failed.. Try Another Username')</script>");
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Violation of Unique KEY constraint"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Failure','Registeration Failed.. " + UsernameTextBox.Text + " already Exist.','error')", true);
                    //Response.Write("<script>alert('Username Already Exists')</script>");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Failure','Registeration Failed.." + UsernameTextBox.Text + "','error')", true);
                    //Response.Write("<script>alert('Data Insertion Failed')</script>");
                }
            }
            finally
            {
                con.Close();
            }
        }

        protected void GenderDropDownList0_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CountryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int contry_id = Convert.ToInt32(CountryDropDownList.SelectedValue);
                BindCityDDL(contry_id);
                BindCityDDL(CountryDropDownList.SelectedIndex);
                CountryDropDownList.SelectedItem.ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Country is required')</script>");
            }

        }
    }
}