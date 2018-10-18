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
public partial class Admin_ViewAll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            refreshdata();
        }
    }
    public void refreshdata()
    {
        SqlConnection con = new SqlConnection
            (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand
            ("SELECT * FROM [softwares]", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        ViewState["dirState"] = dt;
        ViewState["sortdr"] = "Asc";
    }
    protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dtrslt = (DataTable)ViewState["dirState"];
        if (dtrslt.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            GridView2.DataSource = dtrslt;
            GridView2.DataBind();           
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Add.aspx");
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (txtProdID.Text != "")
        {
            Response.Redirect("~/Admin_Update.aspx?Id=" + txtProdID.Text);
        }
        else
        {
            lblProdID.Visible = true;
            lblProdID.Text = "Please enter a product ID.";
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = 
            new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string query = "DELETE FROM softwares WHERE prodID=@itemid";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@itemid", txtProdID.Text);
            con.Open();
            cmd.ExecuteNonQuery();

            Response.Redirect("Admin_ViewProducts.aspx");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }
    }
}