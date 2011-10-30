<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Shopping_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Shopping List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="onecolumn">
        <h1>My Shopping List</h1>
        <!-- SHOPPING LIST RESULTS TABLE -->
        <div>
            <asp:Table ID="Table1" runat="server" CellPadding="4" GridLines="None" 
            HorizontalAlign="Left" CellSpacing="5" Width="600px">
            <asp:TableRow>
                <asp:TableHeaderCell CssClass="underline">Item</asp:TableHeaderCell>
                <asp:TableHeaderCell CssClass="underline">Category</asp:TableHeaderCell>
                <asp:TableHeaderCell CssClass="underline">Amount</asp:TableHeaderCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Chicken Breast, boneless, skinless</asp:TableCell>
                <asp:TableCell>Chicken</asp:TableCell>
                <asp:TableCell>4 lbs</asp:TableCell>
                <asp:TableCell>
                   <asp:TextBox ID="TextBox10" runat="server" Height="16px" 
                   Width="70px" SkinID="SmallestText">Change Amt</asp:TextBox>&nbsp;&nbsp;
                   <asp:HyperLink ID="HyperLink1" runat="server" CssClass="removeX" NavigateUrl="~/shopping.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                </asp:TableCell>

            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Oatmeal</asp:TableCell>
                <asp:TableCell>Boxed</asp:TableCell>
                <asp:TableCell>1 box</asp:TableCell>
                <asp:TableCell>
                   <asp:TextBox ID="TextBox11" runat="server" Height="16px" 
                   Width="70px" SkinID="SmallestText">Change Amt</asp:TextBox>&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="removeX" NavigateUrl="~/shopping.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Corn, Whole Kernal</asp:TableCell>
                <asp:TableCell>Canned</asp:TableCell>
                <asp:TableCell>16 oz</asp:TableCell>
                <asp:TableCell>
                   <asp:TextBox ID="TextBox12" runat="server" Height="16px" 
                   Width="70px" SkinID="SmallestText">Change Amt</asp:TextBox>&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="removeX" NavigateUrl="~/shopping.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div><br /><br />
        <div style="margin-top: 150px;">
            <!-- Add item section -->
            <asp:HyperLink ID="HyperLink21" runat="server" CssClass="addMore" NavigateUrl="~/shopping.aspx">[ + ] Add an item</asp:HyperLink><br /><br />
            <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="150px">Category</asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="125px">Amount</asp:TextBox>&nbsp;&nbsp;<br />
            <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="150px">Category</asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" Height="25px" Width="125px">Amount</asp:TextBox>&nbsp;&nbsp;<br />
            <asp:TextBox ID="TextBox7" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox8" runat="server" Height="25px" Width="150px">Category</asp:TextBox>&nbsp;&nbsp;
            <asp:TextBox ID="TextBox9" runat="server" Height="25px" Width="125px">Amount</asp:TextBox>&nbsp;&nbsp;<br /><br />
        </div>
        <!-- PRINT BUTTON -->
                <asp:Button ID="Button1" SkinID="BlackButton" runat="server" Text="Print" /> 
    </div>
</asp:Content>

