
<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="prod.aspx.cs" Inherits="admin_prod" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
  Products
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    Products
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="row" id="form"  >
        <div class="col-xs-12">
            <button class="btn btn-primary btn-md pull-right" data-target="#productModal" data-toggle="modal" style="background-color:#7a526f; font-size:20px;" >
                <i class="glyphicon glyphicon-plus txtcolor"></i>
                <span><strong> Products</strong></span>
            </button>
        </div>
    </div>
     
    
    <form id="Form1" runat="server" class="form-container">
        <div class="row" id="data">
            <div class="col-lg-12">
                <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="False"    DataKeyNames="ProductId"   AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-border table-hover dt-responsive" OnRowUpdating="ProductGridView_RowUpdating"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="15px"  OnRowEditing="ProductGridView_RowEditing"  OnRowCancelingEdit="ProductGridView_RowCancelingEdit" OnRowDeleting="ProductGridView_RowDeleting" OnPageIndexChanging="ProductGridView_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="ProductId" InsertVisible="False" SortExpression="ProductId" Visible="False" ItemStyle-Width="10px" >                            
                            <ItemTemplate>
                   <asp:Label ID="ProductId" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name" SortExpression="ProductName" ItemStyle-Width="15px">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Rows="2"  Text='<%# Bind("ProductName") %>'></asp:TextBox>
                                
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*name is required" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Product Key"  SortExpression="ProductKey" ItemStyle-Width="10px">
                              
                            <EditItemTemplate>
                                <asp:TextBox ID="txtproductkey" runat="server" rows="4" Text='<%# Bind("ProductKey") %>'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Product Key Required" ControlToValidate="txtproductkey" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblprodkey" runat="server" Text='<%# Bind("ProductKey") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Product image" SortExpression="ProductImage" ItemStyle-Width="10px">
                    <EditItemTemplate>
                      <asp:FileUpload ID="FileUpload1" runat="server" /> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="image is required" ControlToValidate="FileUpload1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ProductImage") %>' />
                           </ItemTemplate>
                            
                      <ControlStyle CssClass="img-thumbnail img-responsive" Height="100px" Width="80px" />
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Description" ItemStyle-Width="10px" SortExpression="ProductDesc" >
                            <EditItemTemplate>
                             <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="DESCRIPTION CANT BE EMPTY" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProductDesc") %>'></asp:Label>
                            </ItemTemplate>
                               <ItemStyle Width="10px" />
                          
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Product Document" ItemStyle-Width="10px" SortExpression="ProductDoc">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProductDoc") %>'></asp:Label>
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
                    
                    <HeaderStyle BackColor="#7a526f" Font-Bold="True" ForeColor="White" />
                
                </asp:GridView>
           
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
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ProductName"  CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                                           
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="fa fa-key"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ProductKey"  CssClass="form-control" placeholder="Product Key"></asp:TextBox>
                                           
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-camera"></span>
                                            </span>
                                            <asp:FileUpload ID="FileImgsave" ClientIDMode="Static" CssClass="form-control" runat="server" />
                                        </div>
                                       
                                    </div>

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-align-center"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ProductDesc" ClientIDMode="Static" CssClass="form-control" placeholder="Product Description" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                      <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                             <asp:FileUpload ID="FileDocSave" ClientIDMode="Static" CssClass="form-control" runat="server" />
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
            $("#Content3").css('max-width', '80%');
            $('#Form1').bootstrapValidator({
                //container: '#messages',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    ctl00$ContentPlaceHolder1$ProductName: {
                        validators: {
                            notEmpty: {
                                message: 'The product name is required and cannot be empty'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$ProductDesc: {

                        validators: {
                            notEmpty: {
                                message: 'The product description is required'
                            }
                        }

                    },

                    ctl00$ContentPlaceHolder1$FileImgsave: {

                        validators: {
                            notEmpty: {
                                message: 'product image in necessary'
                            }

                        }
                    },
                    ctl00$ContentPlaceHolder1$ProductKey: {

                        validators: {
                            notEmpty: {
                                message: 'Product key is required at least 10 words'
                            }

                        }
                    },

                }
            });
        });
    </script>
</asp:Content>


