<%@ Page Title="Recipease - View/Edit Ingredients" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="ingredients.aspx.cs" Inherits="Recipes_ingredients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - View/Edit Ingredients</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="leftcolumn">
    <h1>Ingredients for Recipe: <%=Request.QueryString["rec_name"] %> </h1>  
    <p>
        <asp:Label ID="ErrorsLBL" CssClass="emphasis" runat="server" SkinID="errorLabel" Text=""></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Please correct the following errors: " />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">Return to recipes</asp:HyperLink><br /><br />
    </p>

    <!-- data source for GridView -->
    <asp:SqlDataSource ID="IngredientSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT rec_id, rec_ing_quantity, ing_name, RI.unit_id, unit_name 
                        FROM RECIPEASE_RECIPE_INGREDIENT RI INNER JOIN RECIPEASE_UNIT RU ON  RU.unit_id = RI.unit_id 
                        WHERE ([rec_id] = @selected_rec_id) 
                        ORDER BY RI.ing_sequence" 
        DeleteCommand="DELETE FROM [RECIPEASE_RECIPE_INGREDIENT] WHERE [rec_id] = @original_rec_id AND [ing_name] = @original_ing_name"
        UpdateCommand="UPDATE [RECIPEASE_RECIPE_INGREDIENT] SET [rec_ing_quantity] = @rec_ing_quantity, [unit_id] = @unit_id, [ing_name] = @ing_name WHERE [rec_id] = @original_rec_id AND [ing_name] = @original_ing_name" 
        InsertCommand="INSERT INTO [RECIPEASE_RECIPE_INGREDIENT] ([rec_id], [ing_name], [rec_ing_quantity], [unit_id]) VALUES (@rec_id, @ing_name, @rec_ing_quantity, @unit_id)" >
        <DeleteParameters>
            <asp:Parameter Name="original_rec_id" Type="Int32" />
            <asp:Parameter Name="original_ing_name" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="rec_ing_quantity" Type="Decimal" />
            <asp:Parameter Name="unit_id" Type="Int32" />
            <asp:Parameter Name="rec_id" Type="Int32" />
            <asp:Parameter Name="ing_name" Type="String" />
            <asp:Parameter Name="original_rec_id" Type="Int32" />
            <asp:Parameter Name="original_ing_name" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="rec_id" Type="Int32" />
            <asp:Parameter Name="ing_name" Type="String" />
            <asp:Parameter Name="rec_ing_quantity" Type="Decimal" />
            <asp:Parameter Name="unit_id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="selected_rec_id" QueryStringField="rec_id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- GridView for ingredient data -->
    <asp:Label ID="Label4" runat="server" Text="">Current ingredients for recipe: <%=Request.QueryString["rec_name"] %> </asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" Width="390px"
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="IngredientSDS" ForeColor="Black" 
        GridLines="Vertical" AutoGenerateColumns="False" AllowSorting="True" 
        DataKeyNames="rec_id,ing_name" onrowupdated="GridView1_ItemUpdated" >
        <EmptyDataTemplate>
            No ingredients currently exist for this recipe.  Add them using the form on the right.<br /><br />
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<br /><asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowDeleteButton="True" />

            <asp:TemplateField HeaderText="Qty" SortExpression="rec_ing_quantity" HeaderStyle-Width="5px">
                <EditItemTemplate>
                    <asp:RangeValidator ID="RangeValidator" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Textbox1" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("rec_ing_quantity") %>' Width="35px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("rec_ing_quantity") %>' Width="35px"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Amount" SortExpression="unit_name" HeaderStyle-Width="5px" ItemStyle-Width="30px">
                <EditItemTemplate>
                    <asp:DropDownList ID="AmountDDL" DataSourceID="UnitsSDS" runat="server" 
                    DataTextField="unit_name" SelectedValue='<%# Bind("unit_id") %>' DataValueField="unit_id" Width="75px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("unit_name") %>'></asp:Label>
                </ItemTemplate>

                <HeaderStyle Width="5px"></HeaderStyle>
                <ItemStyle Width="50px"></ItemStyle>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Ingredient" SortExpression="ing_name" HeaderStyle-Width="5px">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" Text='<%# Bind("ing_name") %>' Width="110px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ing_name") %>' Width="110px"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
            </asp:TemplateField>
        </Columns>
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
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</div>

<div id="rightcolumn, smallpad" style="margin-left: 25px;">
    <p>
    <br /><br /><br />Add new ingredients to recipe: <%=Request.QueryString["rec_name"] %>
    </p>
    
    <!-- SQL data source for the AMOUNT drop down lists -->
    <asp:SqlDataSource ID="UnitsSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        SelectCommand="SELECT * FROM [RECIPEASE_UNIT] ORDER BY unit_name">
    </asp:SqlDataSource>

    <!-- QUANTITY, AMOUNT, and INGREDIENT controls -->
        <table>
        <!-- ROW 1 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity01TXT" 
                        MinimumValue="0" MaximumValue="32000" Type="Double">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity01TXT" 
                    onservervalidate="Ingredient01CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Quantity01LBL" runat="server" Text="Qty" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Quantity01TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="Amount01LBL" runat="server" Text="Amount" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:DropDownList ID="Amount01DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient01CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient01TXT" 
                    onservervalidate="Ingredient01CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator7" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient01TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Ingredient01LBL" runat="server" Text="Ingredient" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Ingredient01TXT" MaxLength="50" runat="server" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
                    <!-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp; -->
            </td>
        </tr>
        <!-- ROW 2 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity02TXT" 
                        MinimumValue="0" MaximumValue="32000" Type="Double">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity02TXT" 
                    onservervalidate="Ingredient02CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity02TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount02DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient02CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient02TXT" 
                    onservervalidate="Ingredient02CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator8" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient02TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient02TXT" MaxLength="50" runat="server" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
        </tr>
        <!-- ROW 3 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity03TXT" 
                        MinimumValue="0" MaximumValue="32000" Type="Double">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity03TXT" 
                    onservervalidate="Ingredient03CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity03TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount03DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient03CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient03TXT" 
                    onservervalidate="Ingredient03CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator9" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient03TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient03TXT" MaxLength="50" runat="server" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
        </tr>
        <!-- ROW 4 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity04TXT" 
                        MinimumValue="0" MaximumValue="32000" Type="Double">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity04TXT" 
                    onservervalidate="Ingredient04CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity04TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount04DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient04CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient04TXT" 
                    onservervalidate="Ingredient04CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator10" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient04TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient04TXT" MaxLength="50" runat="server" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
        </tr>
        <!-- ROW 5 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity05TXT" 
                        MinimumValue="0" MaximumValue="32000" Type="Double">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity05TXT" 
                    onservervalidate="Ingredient05CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity05TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount05DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td class="style1">
                <asp:CustomValidator ID="Ingredient05CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient05TXT" 
                    onservervalidate="Ingredient05CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator11" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient05TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient05TXT" MaxLength="50" runat="server" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
        </tr>
        <!-- ROW 6 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator6" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity06TXT" 
                        MinimumValue="0" MaximumValue="32000" Type="Double">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity06TXT" 
                    onservervalidate="Ingredient06CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity06TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount06DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient06CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient05TXT" 
                    onservervalidate="Ingredient06CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator12" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient06TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient06TXT" MaxLength="50" runat="server" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
        </tr>
        </table>

        <!-- ADD, RESET, CANCEL BUTTONS -->
    <asp:Button ID="AddIngredientsBTN" SkinID="BlackButton" runat="server" Text="Add" 
        onclick="AddIngredientsBTN_CLICK" />
    <asp:Button ID="ResetIngredientsBTN" SkinID="BlackButton" runat="server" 
        OnClick="ResetIngredientsBTN_CLICK" Text="Reset"  CausesValidation="False" />
</div>
</asp:Content>

