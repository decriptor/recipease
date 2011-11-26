<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="results.aspx.cs" Inherits="Shopping_results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Meal Planner Results</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="onecolumn">
        <p>This page is no longer valid.  
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Meals/index.aspx">Go back to the main meals page.</asp:HyperLink>
        </p>
<%--        <h1>Meal Planner Results</h1>
        <!-- CHECK BOX RESULT SET -->
        <span class="emphasis">Categories: Chicken, Mexican</span><br /><br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem Selected="True">Chicken Enchilada Casserole</asp:ListItem>
            <asp:ListItem>Mexican Chicken Delight</asp:ListItem>
            <asp:ListItem Selected="True">Chicken Quesidillas</asp:ListItem>
            <asp:ListItem>Spanish Chicken Dogs</asp:ListItem>
        </asp:CheckBoxList><br /><hr /><br />
        Meals Added: 2
        <div class="largepad">
            <!-- CONTINUE, SAVE, GO BACK BUTTONS -->
            <asp:Button ID="Button1" SkinID="BlackButtonSmallText" runat="server" 
                Text="Continue" PostBackUrl="~/Meals/index.aspx" />
                &nbsp;&nbsp;Save Meals, Continue to Other Categories<br /><br />
            <asp:Button ID="Button2" SkinID="BlackButton" runat="server" Text="Save" 
                PostBackUrl="~/Shopping/index.aspx" />
                &nbsp;&nbsp;Save Meals, Continue to Shopping List<br /><br />
            <asp:Button ID="Button3" SkinID="BlackButton" runat="server" Text="Go back" 
                PostBackUrl="~/Meals/index.aspx" />
                &nbsp;&nbsp;Go back, do NOT Save
        </div>--%>
    </div>
</asp:Content>


