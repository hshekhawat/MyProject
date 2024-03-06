<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="admin_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
  Services
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   Services
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
   
    <div class="row" id="form">
        <div class="col-xs-12">
            <button class="btn btn-primary btn-md pull-right" data-target="#ServicesModal" data-toggle="modal" style="  background-color:#7a526f; font-size:20px;">
                <i class="glyphicon glyphicon-plus txtcolor"></i>
                <span><strong> Services</strong></span>
            </button>
        </div>
    </div>

    <form id="Form1" runat="server" class="form-container">
        <div class="row" id="data">
            <div class="col-lg-12">
                <asp:GridView ID="ServiceGridView" runat="server"  AutoGenerateColumns="False" DataKeyNames="ServiceId"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-border table-hover dt-responsive" OnRowCancelingEdit="ServiceGridView_RowCancelingEdit" OnRowUpdating="ServiceGridView_RowUpdating" OnRowEditing="ServiceGridView_RowEditing" OnRowDeleting="ServiceGridView_RowDeleting" OnPageIndexChanging="ServiceGridView_PageIndexChanging" >
     
                    <Columns>
                        <asp:TemplateField HeaderText="ServiceId" InsertVisible="False" SortExpression="ServiceId" Visible="False">
                           
                            <ItemTemplate>
                                <asp:Label ID="ServiceId" runat="server" Text='<%# Bind("ServiceId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service Name" SortExpression="ServiceName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1"  runat="server" Text='<%# Bind("ServiceName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is required" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ServiceName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Service Key" SortExpression="ServiceKey">
                            <EditItemTemplate>
                                <asp:TextBox ID="ServiceKey" runat="server" Text='<%# Bind("ServiceKey") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Service Key is Required" ForeColor="Red" ControlToValidate="ServiceKey"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblservicekey" runat="server" Text='<%# Bind("ServiceKey") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service Image" SortExpression="ServiceImage">
                           <EditItemTemplate>
                      <asp:FileUpload ID="FileUpload1" runat="server" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="image is required" ForeColor="Red" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                           </EditItemTemplate>
                    <ItemTemplate>
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ServiceImage") %>' />
                           </ItemTemplate>
                      <ControlStyle CssClass="img-thumbnail img-responsive" Height="100px" Width="80px" />
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Service Desc" SortExpression="ServiceDesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ServiceDesc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="description is required" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ServiceDesc") %>'></asp:Label>
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
                            </ItemTemplate><HeaderStyle ForeColor="White"></HeaderStyle>
                        </asp:TemplateField>
              
                    </Columns>
                    
                      <HeaderStyle BackColor="#7a526f" Font-Bold="True" ForeColor="White" />
                
                </asp:GridView>
           
                <script type="text/javascript">
                    jQuery.noConflict();
                    $(function () {
                        $("#ContentPlaceHolder1_ServiceGridView").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                            dom: 'lBfrtip',
                            buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
                        });
                    });
                </script>
  <div class="modal fade" tabindex="-1" id="ServicesModal" data-backdrop="static">
                    <div class="modal-dialog modalCenter modal-dialog-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    &times;</button>
                                <h2 class="modal-title text-center">Add Service</h2>
                            </div>

                            <asp:Panel ID="Panel1" runat="server">
                                <div class="modal-body">
                              

                                     <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ServiceName"  CssClass="form-control" placeholder="Service Name"></asp:TextBox>
                                        </div>
                                    </div>
                                      <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="fa fa-key"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="ServiceKey"  CssClass="form-control" placeholder="Service Key"></asp:TextBox>
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
                                            <asp:TextBox runat="server" ID="ServiceDesc" ClientIDMode="Static" CssClass="form-control" placeholder="Service Description" TextMode="MultiLine"></asp:TextBox>
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
                    ctl00$ContentPlaceHolder1$Servicename: {
                        validators: {
                            notEmpty: {
                                message: 'The product name is required and cannot be empty'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$ServiceKey: {
                        validators: {
                            notEmpty: {
                                message: 'The Keyword is required and cannot be empty'
                            }
                        }
                    },
                    ctl00$ContentPlaceHolder1$Servicedesc: {

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