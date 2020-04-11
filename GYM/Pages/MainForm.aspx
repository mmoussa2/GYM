<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="GYM.Pages.MainForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%" border="0">
        <tr>
            <td>
                <asp:MultiView ID="mvMain" runat="server">
                    <asp:View ID="vCustomer" runat="server">
                        <table width="100%" border="0">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Plan</asp:LinkButton>
                                                <asp:HiddenField ID="hfMode" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>First Name </td>
                                            <td>
                                                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Last Name</td>
                                            <td>
                                                <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>

                                            <td>
                                                <asp:DropDownList ID="ddlGender" runat="server" Width="50">
                                                    <asp:ListItem>M</asp:ListItem>
                                                    <asp:ListItem>F</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Birth Date</td>
                                            <td>
                                                <asp:TextBox ID="txtBithDate" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td>
                                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tel</td>
                                            <td>
                                                <asp:TextBox ID="txtTel" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>BarCode</td>
                                            <td>
                                                <asp:TextBox ID="txtBarCode" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Note</td>
                                            <td>
                                                <asp:TextBox ID="txtNode" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Is Acitve</td>
                                            <td>
                                                <asp:CheckBox ID="ckbIsActive" runat="server" Checked="True" />
                                            </td>
                                        </tr>

                                    </table>

                                </td>
                            </tr>
                        </table>

                    </asp:View>
                    <asp:View ID="vContract" runat="server">
                        <table width="100%">
                            <tr>
                                <td style="height: 58px">
                                    <table>
                                        <tr>
                                            <td>Plan Type</td>
                                            <td>
                                                <asp:DropDownList ID="ddlPlanTypeContract" runat="server"></asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Plan </td>
                                            <td>
                                                <asp:DropDownList ID="ddlPlanContract" runat="server"></asp:DropDownList>
                                            </td>
                                        </tr>

                                    </table>

                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlContractTerm" runat="server" GroupingText="Contract Term" Width="350px">
                                                    <table>
                                                        <tr>
                                                            <td style="width: 150px">Contract Begin Date
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtContBeginDate" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">Contract End Date</td>
                                                            <td>
                                                                <asp:TextBox ID="txtContEndDate" runat="server"></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>

                                        </tr>
                                    </table>

                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Panel ID="pnlFees" runat="server" GroupingText="Payment Fees" Width="350px">
                                                    <table>
                                                        <tr>
                                                            <td style="width: 150px">Total Fees</td>
                                                            <td>
                                                                <asp:TextBox ID="txtTotalFees" runat="server"></asp:TextBox></td>

                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">MemberShip Fees</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMemberShipFees" runat="server"></asp:TextBox></td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>

                                        </tr>
                                    </table>

                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </asp:View>

                    <asp:View ID="vPayment" runat="server">
                        <table width="100%" border="0">
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="vPlan" runat="server">
                        <table width="100%" border="0">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="btnNewPlan" runat="server"> New Plan</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlPlanType_Plan" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPlanType_Plan_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:ListBox ID="lbxPlan" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lbxPlan_SelectedIndexChanged"  ></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>Plan Name</td>
                                                        <td>
                                                            <asp:TextBox ID="txtPlanName_Plan" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Contract Length </td>
                                                        <td>
                                                            <asp:TextBox ID="txtContractLength_Plan" runat="server"></asp:TextBox>
                                                            /Months
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td >Total Fees</td>
                                                        <td >
                                                            <asp:TextBox ID="txtTotalFees_Plan" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Panel ID="pnlPaymentAmount_Plan" runat="server" GroupingText="Payment Amount">
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:CheckBox ID="ChkDayAmount_Plan" runat="server" AutoPostBack="True" OnCheckedChanged="ChkDayAmount_Plan_CheckedChanged" />
                                                                            Day</td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtDayAmount_Plan" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:CheckBox ID="ChkMonthAmount_Plan" runat="server" AutoPostBack="True" OnCheckedChanged="ChkMonthAmount_Plan_CheckedChanged" />
                                                                            Month</td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtMonthAmount_Plan" runat="server"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:CheckBox ID="chbLimitEntry" runat="server" Text="Limit Hours of Entry"  AutoPostBack="true" OnCheckedChanged="chbLimitEntry_CheckedChanged" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="chbIsActive_Plan" runat="server" Checked="True" Text="Is Active" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Panel ID="pnlAllowedHours" runat="server" GroupingText="Hours Allowed Entry" Visible="false">
                                                                            <table>
                                                                                <tr>
                                                                                    <td>From Time </td>
                                                                                    <td style="width: 58px">
                                                                                      
                                                                                        <asp:DropDownList ID="ddlFromTime_Plan" runat="server">
                                                                                            <asp:ListItem Value="00:00">00:00</asp:ListItem>
                                                                                            <asp:ListItem Value="01:00">01:00</asp:ListItem>
                                                                                            <asp:ListItem>02:00</asp:ListItem>
                                                                                            <asp:ListItem>03:00</asp:ListItem>
                                                                                            <asp:ListItem>04:00</asp:ListItem>
                                                                                            <asp:ListItem>05:00</asp:ListItem>
                                                                                            <asp:ListItem>06:00</asp:ListItem>
                                                                                            <asp:ListItem>07:00</asp:ListItem>
                                                                                            <asp:ListItem>08:00</asp:ListItem>
                                                                                            <asp:ListItem>09:00</asp:ListItem>
                                                                                            <asp:ListItem>10:00</asp:ListItem>
                                                                                            <asp:ListItem>11:00</asp:ListItem>
                                                                                            <asp:ListItem>12:00</asp:ListItem>
                                                                                            <asp:ListItem>13:00</asp:ListItem>
                                                                                            <asp:ListItem>14:00</asp:ListItem>
                                                                                            <asp:ListItem>15:00</asp:ListItem>
                                                                                            <asp:ListItem>16:00</asp:ListItem>
                                                                                            <asp:ListItem>17:00</asp:ListItem>
                                                                                            <asp:ListItem>18:00</asp:ListItem>
                                                                                            <asp:ListItem>19:00</asp:ListItem>
                                                                                            <asp:ListItem>20:00</asp:ListItem>
                                                                                            <asp:ListItem>21:00</asp:ListItem>
                                                                                            <asp:ListItem>22:00</asp:ListItem>
                                                                                            <asp:ListItem>23:00</asp:ListItem>
                                                                                            <asp:ListItem>24:00</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    
                                                                                    </td>
                                                                                   
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>To Time</td>
                                                                                    <td style="width: 58px">
                                                                                        <asp:DropDownList ID="ddlToTime_Plan" runat="server">
                                                                                            <asp:ListItem Value="00:00">00:00</asp:ListItem>
                                                                                            <asp:ListItem Value="01:00">01:00</asp:ListItem>
                                                                                            <asp:ListItem>02:00</asp:ListItem>
                                                                                            <asp:ListItem>03:00</asp:ListItem>
                                                                                            <asp:ListItem>04:00</asp:ListItem>
                                                                                            <asp:ListItem>05:00</asp:ListItem>
                                                                                            <asp:ListItem>06:00</asp:ListItem>
                                                                                            <asp:ListItem>07:00</asp:ListItem>
                                                                                            <asp:ListItem>08:00</asp:ListItem>
                                                                                            <asp:ListItem>09:00</asp:ListItem>
                                                                                            <asp:ListItem>10:00</asp:ListItem>
                                                                                            <asp:ListItem>11:00</asp:ListItem>
                                                                                            <asp:ListItem>12:00</asp:ListItem>
                                                                                            <asp:ListItem>13:00</asp:ListItem>
                                                                                            <asp:ListItem>14:00</asp:ListItem>
                                                                                            <asp:ListItem>15:00</asp:ListItem>
                                                                                            <asp:ListItem>16:00</asp:ListItem>
                                                                                            <asp:ListItem>17:00</asp:ListItem>
                                                                                            <asp:ListItem>18:00</asp:ListItem>
                                                                                            <asp:ListItem>19:00</asp:ListItem>
                                                                                            <asp:ListItem>20:00</asp:ListItem>
                                                                                            <asp:ListItem>21:00</asp:ListItem>
                                                                                            <asp:ListItem>22:00</asp:ListItem>
                                                                                            <asp:ListItem>23:00</asp:ListItem>
                                                                                            <asp:ListItem>24:00</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                  
                                                                                </tr>

                                                                            </table>
                                                                        </asp:Panel>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Panel ID="pnlAllowedDays" runat="server" GroupingText="Days Allowed Entry" Visible="false" >
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table style="width: 100%">
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbMonday" runat="server" Text="Monday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbTuesday" runat="server" Text="Tuesday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbWednesday" runat="server" Text="Wednesday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbThursday" runat="server" Text="Thursday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbFriday" runat="server" Text="Firday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbSaturday" runat="server" Text="Saturday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:CheckBox ID="chbSunday" runat="server" Text="Sunday" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="btnCloseAdvanced" runat="server" OnClick="btnCloseAdvanced_Click" Text="Close" />
                                                                        <asp:Button ID="btnSavePlan" runat="server" Text="Save" OnClick="btnSavePlan_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
