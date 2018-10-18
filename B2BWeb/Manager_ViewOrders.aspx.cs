using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_ViewOrders : System.Web.UI.Page
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

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT p.payID, p.datepayment, p.quantity, p.prodID, p.totalPrice, p.status, s.prodName, u.fullName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        ViewState["dirState"] = dt;
        ViewState["sortdr"] = "Asc";


    }

    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = "DESC";

        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
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

    protected void btnView_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manager_ViewProductOrders.aspx?id=" + txtProdID.Text);
    }
}