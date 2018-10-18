<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 200px">
                <h2>Login</h2>

            </div>
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">

                        <div class="form-group">
                            <label>Email *</label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" ></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email address." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label>Password *</label>
                             <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                            
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lbl1" ForeColor="red" runat="server"></asp:Label>
                            <asp:Button ID="btnLog" runat="server" Text="Login" class="btn btn-primary btn-lg" OnClick="btnLog_Click" />
                        </div>
                        <%--<div class="form-group">
                            <asp:Button ID="btnLog2" runat="server" Text="Login2" class="btn btn-primary btn-lg" OnClick="btnLog2_Click" />
                        </div>--%>
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
            <asp:label runat="server" text="Label" id="Label1"></asp:label>
             <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <!--/#contact-page-->

</asp:Content>
