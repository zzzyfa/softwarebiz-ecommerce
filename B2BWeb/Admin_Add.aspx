<%@ Page Language="C#" MasterPageFile="~/Admin_Masterpage.master" AutoEventWireup="true" CodeFile="Admin_Add.aspx.cs" Inherits="Admin_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add New Product | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 150px">
                <h2>Add Product</h2>
                
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
                            <asp:TextBox ID="txtDesc" runat="server" class="form-control" TextMode="MultiLine" ></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtDesc"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Product Specifications:</label>
                            <asp:TextBox ID="txtSpecs" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtSpecs"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Price:</label>
                            <asp:TextBox ID="txtPrice" step=".01" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPrice"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <label>Product Image:</label>
                            <asp:FileUpload ID="uploadPic" class="form-control" runat="server" text="Upload a photo" method="post" enctype="multipart/form-data" name="productpic1" />
                        </div>
                        <div class="form-group" style="margin-top:30px">
                            <asp:Button ID="btnAdd" runat="server" Text="Add Product" class="btn btn-primary btn-lg" OnClick="btnAdd_Click" />
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
