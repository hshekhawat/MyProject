<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Feedback Faculty.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <form id="Form1" runat="server">
        <div class="col-lg-12" style="background: #fff; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1); color: brown;">

            <div style="padding-left: 1px;" class="row pull-left">
                <asp:Label ID="Label1" runat="server" Text="facultyId :" Font-Size="Large" Visible="false"></asp:Label>
                <asp:Label ID="lbfacId" runat="server" Text="" Font-Size="Large" Visible="false"></asp:Label>
            </div>
        </div>
        <div class="col-lg-12" style="background: #fff; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.1); color: brown;">
            <asp:Label ID="Label2" runat="server" Text="Subjects:"></asp:Label>
                             <div style="padding-right: 10px;" class="row pull-left">
                                 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                                 </div>
            </div>
          <div>
            <table style="border: 1px solid black; font-family: Arial">
                <tr>
                    <td colspan="2">.
                        <asp:Chart ID="Chart1" runat="server" Width="1000px" Height="400px" BackColor="#FFCCFF" CanResize="true" CssClass="table  table-bordered table-condensed table-responsive" BackGradientStyle="LeftRight" BackImageTransparentColor="Transparent" BackImageWrapMode="Scaled" Palette="Excel">
                            <Titles>
                                <asp:Title Text="Overall Feedback"></asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series Name="Series1" ChartArea="ChartArea1" ChartType="Column" IsValueShownAsLabel="true" ></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                    <AxisX Title="Subject Name"></AxisX>
                                    <AxisY Title="total marks"></AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                </tr>
            </table>
        </div>
          <div>
            <table style="border: 1px solid black; font-family: Arial">
                <tr>
                    <td colspan="2">
                        <asp:Chart ID="Chart2" runat="server" Width="1200px" Height="400px" BackColor="#FFCCFF" CanResize="true" CssClass="table  table-bordered table-condensed table-responsive" BackGradientStyle="LeftRight" BackImageTransparentColor="Transparent"   >
                             <Titles>
                                <asp:Title Text="FEEDBACK ON THE BASIS OF EACH QUESTION"></asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series Name="Series2" ChartArea="ChartArea2" ChartType="Column" IsValueShownAsLabel="true"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea2">
                                    <AxisX Title="QUESTION TITLE"  ></AxisX>
                                    <AxisY Title="MARKS"></AxisY>
                                    
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <%--<asp:Chart ID="Chart3" runat="server"Width="1000px" Height="400px" BackColor="#FFCCFF" CanResize="true" CssClass="table  table-bordered table-condensed table-responsive" BackGradientStyle="LeftRight" BackImageTransparentColor="Transparent" BackImageWrapMode="Scaled" Palette="Excel">
                            <Titles>
                                <asp:Title Text="FEEDBACK ON THE BASIS OF EACH QUESTION"></asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series Name="Series2" ChartArea="ChartArea2">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea2">
                                    <AxisX Title="QUESTION TITLE"></AxisX>
                                    <AxisY Title="MARKS"></AxisY>
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>--%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
