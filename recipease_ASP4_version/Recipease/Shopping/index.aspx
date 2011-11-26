<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Shopping_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Shopping List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="onecolumn">
        <h1>My Shopping List</h1>
        <p>
            <asp:Label ID="ErrorsLBL" CssClass="emphasis" runat="server" SkinID="errorLabel" Text=""></asp:Label><br />
            <asp:Button ID="printBTN" runat="server" SkinId="BlackButtonSmallTextLONG" 
                Text="Print List" onclick="printBTN_Click" /> 
        </p>
        <p>
            Your shopping list is dynamically generated based on the 
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Meals/index.aspx" runat="server">meals you have planned</asp:HyperLink> 
            <br />and the item amounts currently listed in your 
            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Pantry/index.aspx" runat="server">food pantry</asp:HyperLink>. 
        </p>

        <!-- SHOPPING LIST RESULTS TABLE -->
        <asp:SqlDataSource ID="shoppingListSDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            SelectCommand="SELECT RECIPEASE_RECIPE_INGREDIENT.ing_name, RECIPEASE_RECIPE_INGREDIENT.rec_ing_quantity, RECIPEASE_UNIT.unit_name 
                            FROM RECIPEASE_MEAL INNER JOIN RECIPEASE_RECIPE_INGREDIENT ON RECIPEASE_MEAL.rec_id = RECIPEASE_RECIPE_INGREDIENT.rec_id 
                                INNER JOIN RECIPEASE_UNIT ON RECIPEASE_RECIPE_INGREDIENT.unit_id = RECIPEASE_UNIT.unit_id
                                WHERE RECIPEASE_MEAL.meal_owner = @selected_meal_owner
                                ORDER BY RECIPEASE_RECIPE_INGREDIENT.ing_name">
        <SelectParameters>
            <asp:QueryStringParameter Name="selected_meal_owner" QueryStringField="meal_owner" 
                Type="String" />
        </SelectParameters>                    
        </asp:SqlDataSource>
        <h2>Current shopping list for <% =User.Identity.Name.ToString() %>: </h2>
        <asp:GridView ID="GridView1" runat="server" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" EmptyDataText="Your shopping list is empty, because: 
                             1) you haven't planned any meals, 
                             2) your meals that you have planned don't have any ingredients associated with them, or 
                             3) you already have all the ingredients needed in your food pantry." 
            DataSourceID="shoppingListSDS" ForeColor="Black" 
            GridLines="Vertical" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ing_name" HeaderText="Item" />
                <asp:BoundField DataField="rec_ing_quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="unit_name" HeaderText="Amount" />
            </Columns>
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
        <br /><br /><br />
    </div>
</asp:Content>

