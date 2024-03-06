<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="admin_Default2" MaintainScrollPositionOnPostback="true" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
  Products
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    Products
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Content.css" rel="stylesheet" />
       <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
    <style>
        .txtcolor {
        color:white;
        }
    </style>
    <div class="row" id="form">
        <div class="col-xs-12">
            <button class="btn btn-primary btn-md pull-right" data-target="#productModal" data-toggle="modal">
                <i class="glyphicon glyphicon-plus txtcolor"></i>
                <span><strong> Products</strong></span>
            </button>
        </div>
    </div>

    <form id="Form1" runat="server" class="form-container">
        <div class="row" id="data">
            <div class="col-lg-12">
                <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-border table-hover dt-responsive" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True" >
                    <Columns>
                        <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" InsertVisible="False" ReadOnly="True" Visible="False" />
                        <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Product image" SortExpression="ProductImage">
                    <EditItemTemplate>
                      <asp:FileUpload ID="FileUpload1" runat="server" /> </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' />
                           </ItemTemplate>
                      <ControlStyle CssClass="img-thumbnail img-responsive" Height="100px" Width="80px" />
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Description" SortExpression="ProductDesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                             <asp:TemplateField HeaderText="Action"  HeaderStyle-ForeColor="White" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this Product');" />
                            </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>
                        </asp:TemplateField> 

                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection%>"  DeleteCommand="DELETE FROM [Product] WHERE [ProductId]=@ProductId"  InsertCommand="INSERT INTO [Product] ([ProductName], [ProductImage], [ProductDesc]) VALUES (@ProductName, @ProductImage, @ProductDesc)" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product]  SET [ProductName]=@ProductName,[ProductImage]=@ProductImage,[ProductDesc]=@ProductDesc WHERE [ProductId]=@ProductId">
                                   <DeleteParameters>
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductImage" Type="String" />
                        <asp:Parameter Name="ProductDesc" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                         <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductImage" Type="String" />
                        <asp:Parameter Name="ProductDesc" Type="String" />
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <script type="text/javascript">
                    jQuery.noConflict();
                    $(function () {
                        $("#ContentPlaceHolder1_ProductGridView").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                            dom: 'lBfrtip',
                            buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
                        });
                    });
                </script>
  <div class="modal fade" tabindex="-1" id="productModal" data-backdrop="static">
                    <div class="modal-dialog modalCenter modal-dialog-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    &times;</button>
                                <h2 class="modal-title text-center">Add Product</h2>
                            </div>

                            <asp:Panel ID="Panel1" runat="server">
                                <div class="modal-body">
                              

                                     <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-user"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ProductName"  CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                                            <%--<input type="text" id="tbfname" name="tbfname" class="form-control" placeholder="Faculty Name" />--%>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-camera"></span>
                                            </span>
                                            <asp:FileUpload ID="FileImgsave" ClientIDMode="Static" CssClass="form-control" runat="server" />
                                        </div>
                                        <%--                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>--%>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ProductDesc" ClientIDMode="Static" CssClass="form-control" placeholder="Product Description" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                     <asp:Button ID="Save" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Save_Click" />
            <asp:Literal ID="LitMsg" runat="server"></asp:Literal>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <style>
        .modalCenter {
            top: 50% !important;
            transform: translateY(-50%) !important;
        }
    </style>
    <script>

        $(document).ready(function () {
            $('#Form1').bootstrapValidator({
                //container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    ctl00$ContentPlaceHolder1$productname: {
                        validators: {
                            notEmpty: {
                                message: 'The product name is required and cannot be empty'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$productdescrption: {

                        validators: {
                            notEmpty: {
                                message: 'The field is required and cannot be empty'
                            }
                        }

                    },

                    ctl00$ContentPlaceHolder1$FileImgsave: {

                        validators: {
                            notEmpty: {
                                message: 'The field is required and cannot be empty'
                            }

                        }
                    },

                }
            });
        });
    </script>
</asp:Content>



   


