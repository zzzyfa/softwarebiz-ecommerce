using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;




public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataSet ds = new DataSet();
            // read countries list from XML
            ds.ReadXml(Request.PhysicalApplicationPath + @"\App_Data\country.xml");
            //bind the dropdown list with dataset
            drlCountry.DataSource = ds;
            drlCountry.DataTextField = "Name";
            drlCountry.DataValueField = "Code";
            drlCountry.DataBind();
            XmlDocument MyDoc = new XmlDocument();
        }
    }


    protected void btnReg_Click(object sender, EventArgs e)
    {
        SqlConnection con = new
    SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
            con.Open();
            string query = 
             "INSERT INTO users (fullName, companyName, role, country, email, password, userType)" +
             " values (@fullName, @coName, @role, @country, @emailAdd, @password, @userType)";
            SqlCommand cmd = new SqlCommand(query, con);
            System.Diagnostics.Debug.WriteLine(txtName.Text);
            System.Diagnostics.Debug.WriteLine(txtEmail.Text);
            System.Diagnostics.Debug.WriteLine(txtPassword.Text);
            System.Diagnostics.Debug.WriteLine(txtCoName.Text);
            cmd.Parameters.AddWithValue("@fullName", txtName.Text);
            cmd.Parameters.AddWithValue("@emailAdd", txtEmail.Text);
            cmd.Parameters.AddWithValue("@role", txtRole.Text);
            cmd.Parameters.AddWithValue("@country", drlCountry.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@coName", txtCoName.Text);
            cmd.Parameters.AddWithValue("@userType", "customer");

            cmd.ExecuteNonQuery();

            Users userManager = new Users();
            if (userManager.registerUser(txtEmail.Text, txtName.Text, txtCoName.Text, 
                txtRole.Text, drlCountry.SelectedValue.ToString(), txtPassword.Text, positionEnum.customer))
            {
                XmlDocument xDoc = userManager.getXmlDocument();
                xDoc.Save(MapPath("~\\App_Data\\Users.xml"));
                this.lbl1.Text = "New user registered succesfully!";
                txtName.Text = String.Empty;
                txtEmail.Text = String.Empty;
                txtCoName.Text = String.Empty;
                txtPassword.Text = String.Empty;
                txtPassword2.Text = String.Empty;
                txtRole.Text = String.Empty;
                System.Diagnostics.Debug.WriteLine("Test6");
                con.Close();
            }
            else
            {
                this.lbl1.Text = "An account with this email already exists.";
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }
    }
}
