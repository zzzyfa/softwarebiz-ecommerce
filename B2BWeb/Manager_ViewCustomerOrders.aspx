<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager_Masterpage.master" CodeFile="Manager_ViewCustomerOrders.aspx.cs" Inherits="Admin_ViewCustomerOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Orders from a Customer | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 130px">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <LayoutTemplate>
                        <div id="itemPlaceHolderContainer" runat="server">
                            <span id="itemPlaceHolder" runat="server" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <h2>View Orders for <%#Eval("fullName") %></h2>
                    </ItemTemplate>
                    
                </asp:ListView>
                <asp:DataPager ID="Number1" runat="server" PagedControlID="ListView1" PageSize="1"></asp:DataPager>

            </div>
            <br />
            <hr />

            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-4">


                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="payID" DataSourceID="SqlDataSource1" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="800px" AllowPaging="True">
                            <EmptyDataTemplate>
                                <h4>This customer has not placed any orders.</h4>
                            </EmptyDataTemplate>
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="payID" HeaderText="ID" ReadOnly="True" SortExpression="payID" InsertVisible="False" />
                                <asp:BoundField DataField="datepayment" HeaderText="Date" SortExpression="datepayment" />
                                <asp:BoundField DataField="fullName" HeaderText="Full Name" SortExpression="fullName" />
                                <asp:BoundField DataField="prodName" HeaderText="Product Name" SortExpression="prodName" />
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                                <asp:BoundField DataField="totalPrice" HeaderText="Amount Paid" SortExpression="totalPrice" />
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />



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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.payID, p.datepayment, p.quantity, p.totalPrice, p.status, s.prodName, u.fullName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID WHERE p.userID = @custID ">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="custID" QueryStringField="id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <br />
                        <br />


                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
</asp:Content>
