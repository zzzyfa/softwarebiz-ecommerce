<%@ Page Language="C#" MasterPageFile="~/Customer_Masterpage.master" AutoEventWireup="true" CodeFile="CheckOrder.aspx.cs" Inherits="PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Check Order | SoftwareBiz</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <section id="contact-page">
        <div class="container">
            <div class="center" style="margin-top: 150px">
                <h2>Check Order Status</h2>
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </div>
            
            
            <div class="row contact-wrap">
                <div class="status alert alert-success" style="display: none"></div>
                <div id="main-contact-form" class="contact-form">
                    
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                    <br />
                            <asp:Label ID="Label2" Visible="true" runat="server" ForeColor="green" ><%= Request.QueryString["downloading"] %></asp:Label>
                      
                         <div class="form-group">
                            <h3>Approved Orders</h3>
                        </div>
                        <hr />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="payID" DataSourceID="SqlDataSource1" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="800px" AllowPaging="True" OnRowCommand="GridView2_RowCommand" >
                            <EmptyDataTemplate>
                                <h4>You do not have any Approved order yet. <br /><br />
                Check again later.</h4>
                            </EmptyDataTemplate>
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="payID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="payID" />
                                <asp:BoundField DataField="datepayment" HeaderText="Date" SortExpression="datepayment"  />
                                <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodID" />
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                                <asp:BoundField DataField="totalPrice" HeaderText="Total" SortExpression="totalPrice" />
                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                <asp:ButtonField ButtonType="Button" ControlStyle-Width="100px" HeaderText="Download Software" Text="Download"  />
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
                        <br />
                        <br />
                        <div class="form-group">
                            <h3>Transaction History</h3>
                        </div>
                        <hr />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="payID" DataSourceID="SqlDataSource2" Font-Names="Arial" Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="750px" AllowPaging="True"  >
                            <EmptyDataTemplate>
                                <h4>You have not placed any orders.</h4>
                            </EmptyDataTemplate>
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="payID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="payID"  />
                                <asp:BoundField DataField="datepayment" HeaderText="Date" SortExpression="datepayment" />
                                <asp:BoundField DataField="prodName" HeaderText="Product" SortExpression="prodID" />
                                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                                <asp:BoundField DataField="totalPrice" HeaderText="Total" SortExpression="totalPrice" />
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

                        <%--<div class="form-group">
                            <asp:Button ID="btnDownload" runat="server" Text="Download Software" class="btn btn-primary btn-lg" OnClick="btnDownload_Click" />
                        </div>--%>



                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.payID, p.datepayment, p.quantity, p.totalPrice, p.userID, p.status, p.prodID, s.prodName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID WHERE u.userID=@custID AND p.status=@status">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" Name="status" PropertyName="Value" Type="String" />
                                <asp:QueryStringParameter Name="custID" QueryStringField="custid" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.payID, p.datepayment, p.quantity, p.totalPrice, p.userID, p.status, p.prodID, s.prodName FROM payments AS p INNER JOIN softwares AS s ON p.prodID = s.prodID INNER JOIN users AS u ON p.userID = u.userID WHERE u.userID=@custID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1" Name="status" PropertyName="Value" Type="String" />
                                <asp:QueryStringParameter Name="custID" QueryStringField="custid" Type="Int32" />
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
    <!--/#contact-page-->
</asp:Content>
