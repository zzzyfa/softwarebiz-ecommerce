using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml;

public partial class Contact : System.Web.UI.Page
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        XmlDocument myDoc = new XmlDocument();
        XmlElement myFeedbackElement;
        XmlElement myNameElement;
        XmlElement myEmailElement;
        XmlElement myCompanyNameElement;
        XmlElement myCountryElement;
        XmlElement mySubjectElement;
        XmlElement myMessageElement;
        XmlElement myDateElement;
        XmlText myTextNode;

        myDoc.Load(Request.PhysicalApplicationPath + @"\App_Data\userfeedback.xml");
        
        myFeedbackElement = myDoc.CreateElement("feedback");
        myNameElement = myDoc.CreateElement("name");
        myEmailElement = myDoc.CreateElement("email");
        myDateElement = myDoc.CreateElement("date");
        myCompanyNameElement = myDoc.CreateElement("companyName");
        myCountryElement = myDoc.CreateElement("country");
        mySubjectElement = myDoc.CreateElement("subject");
        myMessageElement = myDoc.CreateElement("message");

        myTextNode = myDoc.CreateTextNode(txtName.Text);
        myNameElement.AppendChild(myTextNode);

        myTextNode = myDoc.CreateTextNode(txtEmail.Text);
        myEmailElement.AppendChild(myTextNode);

        myTextNode = myDoc.CreateTextNode(DateTime.Now.ToString());
        myDateElement.AppendChild(myTextNode);

        myTextNode = myDoc.CreateTextNode(txtCoName.Text);
        myCompanyNameElement.AppendChild(myTextNode);

        myTextNode = myDoc.CreateTextNode(drlCountry.SelectedItem.Value);
        myCountryElement.AppendChild(myTextNode);

        myTextNode = myDoc.CreateTextNode(txtSubject.Text);
        mySubjectElement.AppendChild(myTextNode);

        myTextNode = myDoc.CreateTextNode(txtMessage.Text);
        myMessageElement.AppendChild(myTextNode);
        
        myFeedbackElement.AppendChild(myNameElement);
        myFeedbackElement.AppendChild(myEmailElement);
        myFeedbackElement.AppendChild(myDateElement);
        myFeedbackElement.AppendChild(myCompanyNameElement);
        myFeedbackElement.AppendChild(myCountryElement);
        myFeedbackElement.AppendChild(mySubjectElement);
        myFeedbackElement.AppendChild(myMessageElement);

        myDoc.DocumentElement.AppendChild(myFeedbackElement);
        myDoc.Save(Request.PhysicalApplicationPath + @"\App_Data\userfeedback.xml");



        SqlConnection con = new SqlConnection
            (ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
            System.Diagnostics.Debug.WriteLine("Test3");
            con.Open();
            string query = "INSERT INTO feedback (name, email, companyName, country," +
                " subject, message, date) values ('" + txtName.Text + "','" + txtEmail.Text + "','" 
                + txtCoName.Text + "','" + drlCountry.SelectedValue.ToString() + "', '" 
                + txtSubject.Text + "', '" + txtMessage.Text + "', '" 
                + DateTime.Now.ToString() + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lbl1.Text = "Your message has been sent! We will get back to you shortly.";
            txtName.Text = String.Empty;
            txtEmail.Text = String.Empty;
            txtCoName.Text = String.Empty;
            txtSubject.Text = String.Empty;
            txtMessage.Text = String.Empty;
            drlCountry.SelectedItem.Value = String.Empty;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
            Response.Write("Error: " + ex.ToString());
        }


    }
}