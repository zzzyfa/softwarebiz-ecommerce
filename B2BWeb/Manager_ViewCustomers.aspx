<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager_Masterpage.master" CodeFile="Manager_ViewCustomers.aspx.cs" Inherits="Admin_ViewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Customers | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 130px">
                <h2>View Customers</h2>

            </div>
            <hr />

            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">
                        
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="userID" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="800px" AllowPaging="True" AllowSorting="true" OnSorting="gridView_Sorting">

                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="userID" HeaderText="ID" ReadOnly="True" SortExpression="userID" InsertVisible="False" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="fullName" HeaderText="Full Name" SortExpression="fullName" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="companyName" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="role" HeaderText="Role" SortExpression="role" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" HeaderStyle-Font-Underline="true"/>
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" HeaderStyle-Font-Underline="true"/>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([userType] = @userType)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField2" DefaultValue="" Name="userType" PropertyName="Value" Type="String" />
                            </SelectParameters>

                        </asp:SqlDataSource>
                        <asp:HiddenField ID="HiddenField2" runat="server" Value="customer" />
                        <br />
                        <br />

                        <div class="form-group">
                            <h3>View Orders from a Customer</h3>
                        </div>
                        <hr />
                        <div class="form-group">
                            <label>Enter Customer ID:</label>
                            <asp:TextBox ID="txtCustID" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required." ControlToValidate="txtCustID"></asp:RequiredFieldValidator><br />
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnView" runat="server" Text="Submit" class="btn btn-primary btn-lg" OnClick="btnView_Click" />

                            <asp:Label ID="lbl1" runat="server"></asp:Label>
                        </div>
                    </div>


                    <div class="col-sm-3"></div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
</asp:Content>
