<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Enquiry1.aspx.cs" Inherits="Enquiry1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Customer Enquiries
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      Customer Enquiries
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EnquiryId"  CssClass="table table-striped table-border table-hover dt-responsive" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" Font-Size="Large" OnRowCommand="GridView1_RowCommand" PageSize="20" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="EnquiryId" InsertVisible="False" SortExpression="EnquiryId" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="EnquiryId" runat="server" Text='<%# Bind("EnquiryId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer Name" SortExpression="CustomerName">
               
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CustomerName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer MailId" SortExpression="CustomerMailId">
                
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CustomerMailId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer PhoneNo" SortExpression="CustomerPhoneNo">
                
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CustomerPhoneNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer Query" SortExpression="CustomerQuery">
                
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("CustomerQuery") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
      <asp:TemplateField HeaderText="Action"  HeaderStyle-ForeColor="White" ShowHeader="False">
                           
                            <ItemTemplate>
                                <asp:Button ID="Button1" CommandArgument='<%# Eval("EnquiryId") %>' runat="server" CausesValidation="False"    CommandName="Reply" Text="Reply" />
                               <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>
                        </asp:TemplateField> 

                    </Columns>
                    <HeaderStyle BackColor="#7a526f" Font-Bold="True" ForeColor="White" />
                
        </asp:GridView>
       
                <asp:LinkButton ID="lnk" runat="server" ></asp:LinkButton>
                <cc1:ModalPopupExtender TargetControlID="lnk"   CancelControlID="close" ID="ModalPopupExtender1" PopupControlID="pnlview" runat="server">

                </cc1:ModalPopupExtender>
     
        <asp:Panel ID="pnlview" runat="server">

             <div class="modal-dialog modalCenter modal-dialog-md">
                        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title text-center">
            Reply</h2>
        </div>
                                <div class="modal-body">
                               <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="EmailId"  CssClass="form-control" placeholder="EmailId"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="EmailId required" ControlToValidate="EmailId" ForeColor="Red"></asp:RequiredFieldValidator>
                                           
                                        </div>
                                   </div>
                                  <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-align-center"></span>
                                            </span>
                                            <asp:TextBox runat="server" ID="Reply" ClientIDMode="Static" CssClass="form-control" placeholder="Reply" TextMode="MultiLine">
                                              
                                            </asp:TextBox>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required some words at least 10" ControlToValidate="Reply" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                 </div>
                                     <asp:Button ID="Save" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Save_Click"  />
            <asp:Literal ID="LitMsg" runat="server"></asp:Literal>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">Close</button>
                                </div>
                            </div>
                 </div>
                            </asp:Panel>
          
           
    </form>
</asp:Content>
