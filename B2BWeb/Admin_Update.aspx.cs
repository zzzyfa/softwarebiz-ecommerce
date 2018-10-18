using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Admin_Update : System.Web.UI.Page
{
    private object item_name;
    public string image = "";
    public object HiddenField_Id { get; private set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataSet ds = new DataSet();
            
            ds.ReadXml(Request.PhysicalApplicationPath + @"\App_Data\category.xml");
            //bind the dropdown list with dataset
            drlCategory.DataSource = ds;
            drlCategory.DataTextField = "Name";
            drlCategory.DataValueField = "Code";
            drlCategory.DataBind();
            XmlDocument MyDoc = new XmlDocument();
        }

        if (!IsPostBack)
        {
            try
            {
                String contact_id = Request.QueryString["Id"];
                int intTest = Convert.ToInt32(contact_id);

                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM softwares WHERE prodID=" + contact_id))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                //return dt;
                                foreach (DataRow row in dt.Rows)
                                {
                                    string itemid = row["prodID"].ToString();
                                    string item_name = row["prodName"].ToString();
                                    string item_category = row["category"].ToString();
                                    string item_description = row["description"].ToString();
                                    string item_price = row["price"].ToString();
                                    string item_specs = row["specifications"].ToString();
                                    image = row["image"].ToString();

                                    this.HiddenField_Id1.Value = itemid;
                                    this.txtProdName.Text = item_name;
                                    this.txtDesc.Text = item_description;
                                    this.txtPrice.Text = item_price;
                                    this.txtSpecs.Text = item_specs;
                                    drlCategory.SelectedValue = drlCategory.Items.FindByText(row["category"].ToString()).Value;
                                }
                                con.Close();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            if (uploadPic.HasFile)
            {
                string file_name = uploadPic.FileName.ToString() + "";
                uploadPic.PostedFile.SaveAs(Server.MapPath("~/upload/") + file_name);



                string query =
                "UPDATE softwares SET prodName=@item_name, description=@item_description, price=@item_price, specifications=@specifications, category=@category, image=@image WHERE prodID=@itemid";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());
                cmd.Parameters.AddWithValue("@item_name", txtProdName.Text);
                cmd.Parameters.AddWithValue("@item_description", txtDesc.Text);
                cmd.Parameters.AddWithValue("@item_price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@specifications", txtSpecs.Text);
                cmd.Parameters.AddWithValue("@category", drlCategory.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@image", file_name);

                cmd.ExecuteNonQuery();
                Response.Redirect("Admin_ViewProducts.aspx");
                con.Close();
            }
            else
            {
                
                string query =
                "UPDATE softwares SET prodName=@item_name, description=@item_description, price=@item_price, specifications=@specifications, category=@category WHERE prodID=@itemid";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@itemid", HiddenField_Id1.Value.ToString());
                cmd.Parameters.AddWithValue("@item_name", txtProdName.Text);
                cmd.Parameters.AddWithValue("@item_description", txtDesc.Text);
                cmd.Parameters.AddWithValue("@item_price", txtPrice.Text);
                cmd.Parameters.AddWithValue("@specifications", txtSpecs.Text);
                cmd.Parameters.AddWithValue("@category", drlCategory.SelectedValue.ToString());

                cmd.ExecuteNonQuery();
                Response.Redirect("Admin_ViewAll.aspx");
                con.Close();
            }
        }

        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
            Response.Write("Error: " + ex.ToString());
        }
    }



    protected void HiddenField_Id_ValueChanged(object sender, EventArgs e)
    {

    }
}
