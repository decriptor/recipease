<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Meals_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Meal Planner</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="onecolumn">
        <h1>My Meals</h1>
            <span>Find by Category:&nbsp;</span>
            <!-- DROP DOWN LIST ITEMS -->
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True">Main Dishes</asp:ListItem>
                <asp:ListItem>Appetizers</asp:ListItem>
                <asp:ListItem>Italian</asp:ListItem>
                <asp:ListItem>Vegetarian</asp:ListItem>
                <asp:ListItem>Beverages</asp:ListItem>
                <asp:ListItem>Side Dishes</asp:ListItem>
                <asp:ListItem>Mexican</asp:ListItem>
                <asp:ListItem>Chinese</asp:ListItem>
            </asp:DropDownList><br /><br />
            &nbsp;&nbsp;&nbsp;<span>Subcategory (optional):&nbsp;</span>
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Main Dishes</asp:ListItem>
                <asp:ListItem>Appetizers</asp:ListItem>
                <asp:ListItem>Italian</asp:ListItem>
                <asp:ListItem>Vegetarian</asp:ListItem>
                <asp:ListItem>Beverages</asp:ListItem>
                <asp:ListItem>Side Dishes</asp:ListItem>
                <asp:ListItem>Mexican</asp:ListItem>
                <asp:ListItem Selected="True">Chinese</asp:ListItem>
            </asp:DropDownList><br /><br />
            <!-- SEARCH BUTTON -->
                <asp:Button ID="Button1" SkinID="BlackButton" runat="server" 
                    Text="Search" PostBackUrl="~/Meals/results.aspx" />  
            <br /><br /><hr /><br /><br />
            Search ingredients:<br /><br />
            <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;<br />
            <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;<br />
            <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox6" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;<br />
            <asp:TextBox ID="TextBox7" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox8" runat="server" Height="25px" Width="228px">Item</asp:TextBox>&nbsp;<br /><br />
            <!-- SEARCH BUTTON -->
                <asp:Button ID="Button2" SkinID="BlackButton" runat="server" 
                    Text="Search" PostBackUrl="~/Meals/results.aspx" /> 
    </div>
</asp:Content>
