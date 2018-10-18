<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 150px">
                <h2>Register</h2>

            </div>
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <asp:label runat="server" ID="lbl1" style="color:red"></asp:label>
                        <br />
                        <br />
                        <div class="form-group">
                            <label>Full Name *</label>
                            <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Company Name *</label>
                            <asp:TextBox ID="txtCoName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCoName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Role in the Company *</label>
                            <asp:TextBox ID="txtRole" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="This field is required." ControlToValidate="txtRole"></asp:RequiredFieldValidator>
                        </div>
                       <div class="form-group">
                            <label>Country *</label>
                            <asp:DropDownList ID="drlCountry" runat="server" class="form-control"></asp:DropDownList>
                        </div>
                         <div class="form-group">
                            <label>Email Address *</label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label>Password *</label>
                             <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password *</label>
                             <asp:TextBox ID="txtPassword2" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator><br />
                            <asp:CompareValidator ForeColor="Red" ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match." ControlToCompare="txtPassword" ControlToValidate="txtPassword2"></asp:CompareValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnReg" runat="server" Text="Create Account" class="btn btn-primary btn-lg" OnClick="btnReg_Click" />
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
