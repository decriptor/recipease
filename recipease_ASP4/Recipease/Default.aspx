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
            shopping list of the items you still need.
            </p>
            <p>
            After entering your recipes, you will be able to choose your menu for the week/2 weeks/month.  Your 
            shopping list will be created based off what you need for your recipe and what you already have in 
            your pantry.
            </p>
            <p>
            For easy entry, use the Pantry Scanner for automatic entry or enter your pantry items manually.
            </p>
            <p>
            Also, for each item in your pantry you can set a minimum amount.  Once you use those items in your menu, 
            your pantry will update.  Once you reach below the minimum amount, that item will be added to your shopping 
            list.
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
