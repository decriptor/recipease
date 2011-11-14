<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="viewRecipe.aspx.cs" Inherits="Recipes_viewRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - View Recipe Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        This page is obviously under construction for formatting.<br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">Return to recipes</asp:HyperLink><br /><br />
    </p>  
    <h1><%=Request.QueryString["rec_name"] %></h1>

    <!-- recipe data source for FormsView -->
    <asp:SqlDataSource ID="RecipeSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        SelectCommand="SELECT * FROM [RECIPEASE_RECIPE] WHERE ([rec_id] = @rec_id)"
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:QueryStringParameter Name="rec_id" QueryStringField="rec_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- ingredient data source for GridView -->
    <asp:SqlDataSource ID="IngredientsSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        SelectCommand="SELECT RECIPEASE_RECIPE_INGREDIENT.rec_ing_quantity AS [Quantity], RECIPEASE_UNIT.unit_name AS [Amount], RECIPEASE_RECIPE_INGREDIENT.ing_name AS [Ingredient] FROM RECIPEASE_RECIPE_INGREDIENT INNER JOIN RECIPEASE_UNIT ON RECIPEASE_RECIPE_INGREDIENT.unit_id = RECIPEASE_UNIT.unit_id WHERE (RECIPEASE_RECIPE_INGREDIENT.rec_id = @rec_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="rec_id" QueryStringField="rec_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- tag data source for GridView -->
    <asp:SqlDataSource ID="TagsSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        SelectCommand="SELECT RECIPEASE_TAG.tag_name AS [Tags] FROM RECIPEASE_RECIPE_TAG INNER JOIN RECIPEASE_TAG ON RECIPEASE_RECIPE_TAG.tag_id = RECIPEASE_TAG.tag_id WHERE (RECIPEASE_RECIPE_TAG.rec_id = @rec_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="rec_id" QueryStringField="rec_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- FormsView for recipe details -->
    <asp:FormView ID="FormView1" runat="server" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        DataSourceID="RecipeSDS" ForeColor="Black" GridLines="Vertical" Width="700px">
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <EmptyDataTemplate>
            You need to select a recipe first. Please return to the recipe page using the 
            link above.
        </EmptyDataTemplate>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <ItemTemplate>
        <asp:Image ID="imgRecipe" runat="server" ImageUrl='<%# Eval("rec_image_path") %>' />
        <table>
        <tr>
            <td>
                <asp:Label ID="descLBL" runat="server" Text='<%# Eval("rec_desc") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="ratingHEADER" runat="server" SkinID="recipeLabelHeader" Text="Rating (1-5)"></asp:Label>
                <asp:Label ID="ratingLBL" runat="server" Text='<%# Eval("rec_rating") %>'></asp:Label>
            </td>
        </tr><br /><br />
        <tr>
            <td></td>
            <td>
                <asp:Label ID="prepHEADER" runat="server" SkinID="recipeLabelHeader" Text="Prep Time"></asp:Label><br />
                <asp:Label ID="prepLBL" runat="server" Text='<%# Eval("rec_prep_time") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="cook_timeHEADER" runat="server" SkinID="recipeLabelHeader" Text="Cook Time"></asp:Label><br />
                <asp:Label ID="cook_timeLBL" runat="server" Text='<%# Eval("rec_cook_time") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="ready_timeHEADER" runat="server" SkinID="recipeLabelHeader" Text="Total Time"></asp:Label><br />
                <asp:Label ID="ready_timeLBL" runat="server" Text='<%# Eval("rec_ready_time") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="serving_sizeHEADER" runat="server" SkinID="recipeLabelHeader" Text="Serves: "></asp:Label><br />
                <asp:Label ID="serving_sizeLBL" runat="server" Text='<%# Eval("rec_serving_size") %>'></asp:Label>
            </td>
        </tr>

        <h2>Ingredients</h2>
        <!-- GridView for ingredients -->
        <asp:GridView ID="GridView1" runat="server" DataSourceID="IngredientsSDS" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="true">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>

        <tr>
            <td>
                <asp:Label ID="directionsHEADER" runat="server" SkinID="recipeLabelHeader" Text="Directions"></asp:Label><br />
                <asp:Label ID="directionsLBL" runat="server" Text='<%# Eval("rec_directions") %>'></asp:Label>
            </td>
        </tr><br /><br />
        <tr>
            <td>
                <asp:Label ID="dateHEADER" runat="server" SkinID="recipeLabelHeader" Text="Last edited on:"></asp:Label><br />
                <asp:Label ID="dateLBL" runat="server" Text='<%# Eval("rec_date") %>'></asp:Label>
            </td>
            <td>
                <asp:Label ID="ownerHEADER" runat="server" SkinID="recipeLabelHeader" Text="Recipe owner:"></asp:Label><br />
                <asp:Label ID="ownerLBL" runat="server" Text='<%# Eval("rec_owner") %>'></asp:Label>
            </td>
        </tr>
        </table><br /><br />
    </ItemTemplate>
    </asp:FormView>

    <!-- Gridview for tags -->
    <div style="margin-left: 170px;">
    <asp:GridView ID="GridView2" runat="server" DataSourceID="TagsSDS" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" GridLines="Vertical" AllowSorting="true">
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    </div>
</asp:Content>

