using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // This is for SQL Server
using System.Configuration; // This is for ConfigurationManager
using System.Data; // This is for CommandType


namespace TMSProject
{
    public partial class Tutor_Signup : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["TMSDBConnection"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCountryDDL();
            }

        }

        void clear()
        {
            NameTextBox.Text = "";
            SurnameTextBox.Text = "";
            GenderDropDownList.ClearSelection();
            AgeTextBox.Text = "";
            EmailTextBox.Text = "";
            MaritalStatusDropDownList.ClearSelection();
            CountryDropDownList.ClearSelection();
            CityDropDownList.ClearSelection();
            AddressTextBox.Text = "";
            QualificationDropDownList.ClearSelection();
            DegreeTextBox.Text = "";
            ExperienceDropDownList.ClearSelection();
            ContactTextBox.Text = "";
            UsernameTextBox.Text = "";
            PasswordTextBox.Text = "";
            ConfirmPasswordTextBox.Text = "";
        }

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

        protected void TutorSignUpButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            try
            {
                string query = "insert into tutor_signup values(@name, @surname, @gender, @age, @email, @maritalStatus, @country, @city, @address, @qualification, @degree, @experience,@contact, @username, @password)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@surname", SurnameTextBox.Text);
                cmd.Parameters.AddWithValue("@gender", GenderDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(AgeTextBox.Text));
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text);
                cmd.Parameters.AddWithValue("@maritalStatus", MaritalStatusDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@city", CityDropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text);
                cmd.Parameters.AddWithValue("@qualification", QualificationDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@degree", DegreeTextBox.Text);
                cmd.Parameters.AddWithValue("@experience", ExperienceDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@contact", ContactTextBox.Text);
                cmd.Parameters.AddWithValue("@username", UsernameTextBox.Text);
                cmd.Parameters.AddWithValue("@password", PasswordTextBox.Text);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    //Response.Write("<script>alert('You have Registered Successfully')</script>");
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Success','You have Registered Successfully','success')", true);
                    clear();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Failure','Registeration Failed..','error')", true);
                    //Response.Write("<script>alert('Registeration Failed.. Try Another Username')</script>");
                }
            }
           catch (SqlException ex)
            {
                if (ex.Message.Contains("UNIQUE KEY constraint"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Failure','Registeration Failed.. " + UsernameTextBox.Text + " already Exist.','error')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire('Failure','Registeration Failed..','error')", true);
                }
            }
            finally
            {
                con.Close();
            }
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

        protected void CityDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}