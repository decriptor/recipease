<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Recipes_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Current Recipes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="oneColumn">
        <h1>Current Recipes</h1>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/addRecipe.aspx">Add a new recipe</asp:HyperLink><br /><br />
            <asp:Label ID="Label1" runat="server" Text=" " >Current recipes for <% =User.Identity.Name.ToString() %>: </asp:Label>
        </p>  
        <asp:SqlDataSource ID="RecipeaseSDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [RECIPEASE_RECIPE] WHERE ([rec_owner] = @rec_owner)">
            <SelectParameters>
                <asp:CookieParameter CookieName="userName" Name="rec_owner" 
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            DataSourceID="RecipeaseSDS" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="rec_name" HeaderText="Name" />
                <asp:BoundField DataField="rec_desc" HeaderText="Description" />
                <asp:BoundField DataField="rec_owner" HeaderText="Owner" />
                <asp:BoundField DataField="rec_date" HeaderText="Date" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

