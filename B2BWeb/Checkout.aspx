<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Checkout | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section id="contact-page">
        <div class="center" style="margin-top: 150px">
            <h2>Checkout</h2>
        </div>

        <div class="row contact-wrap">
            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form" class="contact-form">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <h3>Order Summary</h3>
                    <hr />
                    <h5><%=name%></h5>
                    <div class="col-md-3">
                        <img src="upload/<%=image%>" class="img-responsive" height="50" width="50" />
                    </div>
                    <div style="float: right; width: 200px">
                        <div>
                            <h5 class="media-heading" style="float: left">Price per Unit: </h5>
                            <h5 class="media-heading" style="float: right">RM <%=price%></h5>
                        </div>
                        <br />
                        <div>
                            <h5 class="media-heading" style="float: left">Quantity: </h5>
                            <h5 class="media-heading" style="float: right"><%=quantity %></h5>
                        </div>
                        <br />
                        <div>
                            <h5 class="media-heading" style="float: left">Total Price: </h5>
                            <h5 class="media-heading" style="float: right">RM <%=totalprice.ToString() %></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <div class="row contact-wrap">
            <div class="status alert alert-success" style="display: none"></div>
            <div id="main-contact-form2" class="contact-form">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <h3>Payment Details</h3>
                    <hr />
                    <div class="form-group">
                        <label>Credit Card Number:</label>
                        <asp:TextBox ID="txtCardNo" TextMode="Number" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCardNo"></asp:RequiredFieldValidator><br />

                    </div>
                    <div class="form-group">
                        <label>Expiry Month/Year:</label>
                        <asp:TextBox ID="txtExpiry" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="This field is required." ControlToValidate="txtExpiry"></asp:RequiredFieldValidator><br />
                    </div>
                    <div class="form-group">
                        <label>CVV:</label>
                        <asp:TextBox ID="txtCVV" TextMode="Number" runat="server" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCVV"></asp:RequiredFieldValidator><br />
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" class="btn btn-primary btn-lg" OnClick="btnConfirm_Click" />

                    </div>
                   
                
                </div>
            </div>
        </div>
    </section>


    <!--/#contact-page-->


</asp:Content>
