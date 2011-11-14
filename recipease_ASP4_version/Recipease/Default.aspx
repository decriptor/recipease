<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease Homepage</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- LEFT COLUMN MAIN CONTENT -->
    <div id="leftcolumn">
        <div class="largepad">
        <h1>Welcome to RecipEASE</h1>
            <p>
                RecipEASE is your one stop shop for your recipes, items you have in your food pantry, and a 
                shopping list of the items you still need.  You'll never need to ask what's for dinner again.
            </p>
            <p>
                After entering your recipes and food pantry items, you will be able to choose your menu for the day/week/2 weeks/month.  Your 
                shopping list will be created based off what you need for your recipe and what you already have in 
                your food pantry.
            </p>
            <p>
                To begin, <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/register.aspx">register</asp:HyperLink> for an account, 
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/login.aspx">log in</asp:HyperLink>, start adding 
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Recipes/index.aspx">recipes</asp:HyperLink> and 
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Pantry/index.aspx">food pantry items</asp:HyperLink>, and then let the 
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Meals/index.aspx">meal planner</asp:HyperLink> take care of the rest.  Your 
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Shopping/index.aspx">shopping list</asp:HyperLink> will then 
                automatically be generated. It's just that easy.
            </p>
            <p>
                <span class="emphasis">Bon Appetit!</span>
            </p>
        </div>
    </div>
    <!-- RIGHT COLUMN MAIN CONTENT -->
    <div id="rightcolumn">
        <div class="smallpad">
            <p>
                <asp:Image ID="Image1" runat="server" CssClass="imgleft" AlternateText="Steak and Potatoes" ImageUrl="~/Images/recipease_homepage_img.jpg" Height="300px" Width="300px" />
            </p>
        </div>
    </div>
</asp:Content>
