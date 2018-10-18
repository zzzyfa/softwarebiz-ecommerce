<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 150px">
                <h2>Drop Your Message</h2>
                <br />

            </div>
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <asp:Label ID="lbl1" runat="server" ForeColor="Green"></asp:Label>
                        <div class="form-group">
                            <label>Name *</label>
                            <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Email Address *</label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Company Name *</label>
                            <asp:TextBox ID="txtCoName" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCoName"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Country *</label>
                            <asp:DropDownList ID="drlCountry" runat="server" class="form-control"></asp:DropDownList>
                        </div>


                        <div class="form-group">
                            <label>Subject *</label>
                            <asp:TextBox ID="txtSubject" runat="server" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="This field is required." ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Message *</label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required." ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit Message" class="btn btn-primary btn-lg" OnClick="btnSubmit_Click" />

                        </div>

                        <div class="col-sm-3"></div>
                    </div>
                </div>

                <!--/.row-->
            </div>
        </div>
        <!--/.container-->
    </section>
    <!--/#contact-page-->
</asp:Content>

