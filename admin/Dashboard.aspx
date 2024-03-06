<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Default3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .mydropdown {
            color: #fff;
            font-size: 30px;
            padding: 5px 10px;
            border-radius: 5px 12px;
            background-color: #cc2a41;
            font-weight: bold;
        }

        .mychart {

            font-size:50px;
        }
    </style>
    <!-- morris JavaScript -->
    <!-- calendar -->
    <script type="text/javascript" src="js/monthly.js"></script>
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        
        
    </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                        <section class="wrapper" style="font-size: medium; font-weight: normal">

            <!-- //market-->
            <div class="market-updates">
                <div class="col-md-3 market-update-gd">
                    <div class="market-update-block clr-block-2">
                        <div class="col-md-4 market-update-right">
                            <i class="fa fa-eye"></i>
                        </div>
                        <div class="col-md-8 market-update-left">
                            <h4>VISITORS</h4>
                            <h3>
                                <asp:Label ID="lbVisitorCount" runat="server"></asp:Label></h3>
                            <a href="Dashboard.aspx">
                                <h2 style="color: white; font-size: 22px;">View<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                </h2>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="col-md-3 market-update-gd">
                    <div class="market-update-block clr-block-1">
                        <div class="col-md-4 market-update-right">

                            <i class="fa fa-product-hunt" style="font-size: 50px; color: white;"></i>
                        </div>
                        <div class="col-md-8 market-update-left">
                            <h4>PRODUCTS</h4>
                            <h3>
                                <asp:Label ID="lbProductCount" runat="server"></asp:Label></h3>
                            <a href="prod.aspx">
                                <h2 style="color: white; font-size: 22px;">View<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                </h2>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3 market-update-gd">
                    <div class="market-update-block clr-block-3">
                        <div class="col-md-4 market-update-right">
                            <i class="fa fa-fw fa-wrench" style="font-size: 45px; color: white;"></i>
                        </div>
                        <div class="col-md-8 market-update-left">
                            <h4>SERVICES</h4>
                            <h3>
                                <asp:Label ID="lbProductServices" runat="server"></asp:Label></h3>
                            <a href="Services.aspx">
                                <h2 style="color: white; font-size: 22px;">View<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                </h2>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-3 market-update-gd">
                    <div class="market-update-block clr-block-4">
                        <div class="col-md-4 market-update-right">
                            <i class="fa fa-fw fa-envelope" style="font-size: 45px; color: white;"></i>
                        </div>
                        <div class="col-md-8 market-update-left">
                            <h4>ENQUIRIES</h4>
                            <h3>
                                <asp:Label ID="lbEnquiry" runat="server"></asp:Label></h3>
                            <a href="Enquiry1.aspx">
                                <h2 style="color: white; font-size: 22px;">View<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                </h2>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <!-- //market-->
            <div>
            <table >
                <tr>
                    <td colspan="2">
                <h1 style="text-align: center">Visitor Statistics</h1>

              <h2> Select Year: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="mydropdown"></asp:DropDownList></h2>
                <br />
                <br />

                <asp:Chart ID="Chart1" runat="server" BackColor="WhiteSmoke" BorderlineColor="Transparent" BorderlineWidth="0" Width="2000px" Palette="Chocolate" Height="400px"  CanResize="true" CssClass="table  table-bordered table-condensed table-responsive" BackGradientStyle="LeftRight" BackImageTransparentColor="Transparent" BackImageWrapMode="Scaled">
                   
                    <Series>
                        <asp:Series Name="Series1" IsValueShownAsLabel="true" ChartArea="ChartArea1">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Month Name"></AxisX>
                                    <AxisY Title="Total visitors"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                    <BorderSkin BackColor="Transparent" BorderColor="Transparent" PageColor="Transparent" />
                </asp:Chart>
 </td>
                </tr>
<tr>
                    <td colspan="2">
        <h2 style="text-align: center;color:whitesmoke; font-weight:bold" >MONTHLY REPORT</h2>
        <p>&nbsp;</p>
        <h3 style="font-weight:bold; font-size:30px"> Select Year:   <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"  ></asp:DropDownList>
     
         Select Month:   <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" ></asp:DropDownList></h3> <br /> <br />
                <br />
		    <asp:Chart ID="Chart2" runat="server" CssClass="table  table-bordered table-condensed table-responsive" Width="2000px" Palette="Chocolate" Height="400px"  CanResize="true" BackColor="WhiteSmoke" BorderlineColor="Transparent" BackGradientStyle="LeftRight" BackImageTransparentColor="Transparent" BackImageWrapMode="Scaled">
                <series>
                    <asp:Series Name="Series1" IsValueShownAsLabel="true">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
          </td>
                </tr>
            </table>
       </div>
        </section>
                </ContentTemplate>
        </asp:UpdatePanel>


    </form>
</asp:Content>
