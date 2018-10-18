<%@ Page Language="C#" MasterPageFile="~/Admin_Masterpage.master" AutoEventWireup="true" CodeFile="Admin_Update.aspx.cs" Inherits="Admin_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Update Product | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <asp:HiddenField ID="HiddenField_Id1" runat="server" OnValueChanged="HiddenField_Id_ValueChanged" />
            <div class="center" style="margin-top: 120px">
                <h2>Edit Product</h2>
            </div>

            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <hr style="margin-bottom:50px" />
                        <div class="form-group">
                            <label>Product Name:</label>
                            <asp:TextBox ID="txtProdName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtProdName"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Category:</label>
                            <asp:DropDownList ID="drlCategory" runat="server" class="form-control"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Product Description:</label>
                            <asp:TextBox ID="txtDesc" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtDesc"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Product Specifications:</label>
                            <asp:TextBox ID="txtSpecs" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtSpecs"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Price:</label>
                            <asp:TextBox ID="txtPrice" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Product Image:</label><br />
                            <img src="upload/<%=image%>" class="img-responsive" height="50" width="50" /><br />
                            <asp:Label ID="lblImageName" runat="server" style="color:black"><%=image %></asp:Label><br /><br />
                            <asp:FileUpload ID="uploadPic" class="form-control" runat="server" text="Upload a photo" method="post" enctype="multipart/form-data" name="productpic1" />
                            <%--<asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload a picture." ControlToValidate="uploadPic"></asp:RequiredFieldValidator><br />--%>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [softwares]"></asp:SqlDataSource>

                        <div class="form-group" style="margin-top:30px">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update Product" style="width:180px" class="btn btn-primary btn-lg" OnClick="btnUpdate_Click" />
                        </div>
                       
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#contact-page-->

</asp:Content>
