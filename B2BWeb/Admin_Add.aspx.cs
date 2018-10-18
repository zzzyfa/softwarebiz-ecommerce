using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;
public partial class Admin_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataSet ds = new DataSet();
            // read countries list from XML
            //string xmlPath = Request.PhysicalApplicationPath + @”\App_Data\Books.xml”;
            ds.ReadXml(Request.PhysicalApplicationPath + @"\App_Data\category.xml");
            //bind the dropdown list with dataset
            drlCategory.DataSource = ds;
            drlCategory.DataTextField = "Name";
            drlCategory.DataValueField = "Code";
            drlCategory.DataBind();
            XmlDocument MyDoc = new XmlDocument();


        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Test1");
        SqlConnection con = new
    SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        System.Diagnostics.Debug.WriteLine("Test2");
        try
        {
            System.Diagnostics.Debug.WriteLine("Test3");
            con.Open();
            string file_name = uploadPic.FileName.ToString() + "";
            uploadPic.PostedFile.SaveAs(Server.MapPath("~/upload/") + file_name);
            string query = "INSERT INTO softwares (prodName, description, specifications, price, category, image) values ('"+txtProdName.Text+"','"+txtDesc.Text+ "','" + txtSpecs.Text + "'," + Convert.ToDouble(txtPrice.Text) + ", '"+ drlCategory.SelectedValue.ToString() + "', '"+file_name+"')";
            SqlCommand cmd = new SqlCommand(query, con);

            //cmd.Parameters.AddWithValue("@productName", txtProdName.Text);
            //cmd.Parameters.AddWithValue("@description", txtDesc.Text);
            //cmd.Parameters.AddWithValue("@price", Convert.ToDouble(txtPrice.Text));
            //cmd.Parameters.AddWithValue("@stock", Convert.ToInt32(txtStock.Text));
            //cmd.Parameters.AddWithValue("@category", drlCategory.SelectedValue.ToString());
            //cmd.Parameters.AddWithValue("@filename", file_name);
            System.Diagnostics.Debug.WriteLine("Test5");
            cmd.ExecuteNonQuery();
            System.Diagnostics.Debug.WriteLine("Test6");

            Response.Redirect("Admin_ViewProducts.aspx");
            System.Diagnostics.Debug.WriteLine("Test7");
            con.Close();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
            Response.Write("Error: " + ex.ToString());
        }
    }

    
}