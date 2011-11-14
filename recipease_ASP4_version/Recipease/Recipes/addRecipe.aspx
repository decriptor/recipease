<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="addRecipe.aspx.cs" Inherits="Recipes_addRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Add a Recipe</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <!-- SQL Data source for processing inserts into the RECIPE table -->
    <asp:SqlDataSource ID="RecipeaseSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        DeleteCommand="DELETE FROM [RECIPEASE_RECIPE] WHERE [rec_id] = @rec_id" 
        InsertCommand="INSERT INTO [RECIPEASE_RECIPE] ([rec_name], [rec_desc], [rec_prep_time], [rec_cook_time], [rec_cook_temp], [rec_ready_time], [rec_serving_size], [rec_date], [rec_image_path], [rec_owner], [rec_rating], [rec_directions]) VALUES (@rec_name, @rec_desc, @rec_prep_time, @rec_cook_time, @rec_cook_temp, @rec_ready_time, @rec_serving_size, @rec_date, @rec_image_path, @rec_owner, @rec_rating, @rec_directions)" 
        SelectCommand="SELECT * FROM [RECIPEASE_RECIPE]" 
        UpdateCommand="UPDATE [RECIPEASE_RECIPE] SET [rec_name] = @rec_name, [rec_desc] = @rec_desc, [rec_prep_time] = @rec_prep_time, [rec_cook_time] = @rec_cook_time, [rec_cook_temp] = @rec_cook_temp, [rec_ready_time] = @rec_ready_time, [rec_serving_size] = @rec_serving_size, [rec_date] = @rec_date, [rec_image_path] = @rec_image_path, [rec_owner] = @rec_owner, [rec_rating] = @rec_rating, [rec_directions] = @rec_directions WHERE [rec_id] = @rec_id">
        <DeleteParameters>
            <asp:Parameter Name="rec_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rec_name" Type="String" />
            <asp:Parameter Name="rec_desc" Type="String" />
            <asp:Parameter Name="rec_prep_time" Type="String" />
            <asp:Parameter Name="rec_cook_time" Type="String" />
            <asp:Parameter Name="rec_cook_temp" Type="String" />
            <asp:Parameter Name="rec_ready_time" Type="String" />
            <asp:Parameter Name="rec_serving_size" Type="String" />
            <asp:Parameter Name="rec_date" Type="DateTime" />
            <asp:Parameter Name="rec_image_path" Type="String" />
            <asp:Parameter Name="rec_owner" Type="String" />
            <asp:Parameter Name="rec_rating" Type="Byte" />
            <asp:Parameter Name="rec_directions" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="rec_name" Type="String" />
            <asp:Parameter Name="rec_desc" Type="String" />
            <asp:Parameter Name="rec_prep_time" Type="String" />
            <asp:Parameter Name="rec_cook_time" Type="String" />
            <asp:Parameter Name="rec_cook_temp" Type="String" />
            <asp:Parameter Name="rec_ready_time" Type="String" />
            <asp:Parameter Name="rec_serving_size" Type="String" />
            <asp:Parameter Name="rec_date" Type="DateTime" />
            <asp:Parameter Name="rec_image_path" Type="String" />
            <asp:Parameter Name="rec_owner" Type="String" />
            <asp:Parameter Name="rec_rating" Type="Byte" />
            <asp:Parameter Name="rec_id" Type="Int32" />
            <asp:Parameter Name="rec_directions" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="rec_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div id="onecolumn">
        <h1>Enter Recipe</h1>
        <p>
            <asp:Label ID="ErrorsLBL" CssClass="emphasis" runat="server" SkinID="errorLabel" Text=""></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Please correct the following errors: " />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">Return to viewing your recipes</asp:HyperLink> (changes will NOT be saved)
            <br /><br />Note: All fields are optional, except for the name of the recipe.
        </p>
        
        <!-- RECIPE NAME & INFO -->  
        <table style="height: 63px">
         <tr>
            <td>
                <asp:Label ID="RecipeNameLBL" runat="server" Text="Recipe Name" SkinID="recipeLabel"></asp:Label><br />
                <asp:RequiredFieldValidator ID="RecipeNameRFV" runat="server" 
                    ErrorMessage="You must provide a recipe name" 
                    ControlToValidate="RecipeNameTXT" 
                    Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:TextBox ID="RecipeNameTXT" runat="server" MaxLength="50" Width="250px" onfocus="if(this.value=='Recipe Name') this.value='';" ToolTip="Recipe Name"></asp:TextBox>&nbsp;&nbsp;
                <!-- ValidationExpression="[\s\S]{1,500}" default to limit anything to 500 chars or less-->
            </td>
            <td>
                <asp:Label ID="PrepTimeLBL" runat="server" Text="Prep Time" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="PrepTimeTXT" runat="server" MaxLength="20" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Prep Time') this.value='';" ToolTip="Prep Time"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="CookTimeLBL" runat="server" Text="Cook Time" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="CookTimeTXT" runat="server" MaxLength="20" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Cook Time') this.value='';" ToolTip="Cook Time"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="CookTempLBL" runat="server" Text="Cook Temp" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="CookTempTXT" runat="server" MaxLength="20" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Cook Temp') this.value='';" ToolTip="Cook Temp"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="TotalTimeLBL" runat="server" Text="Total Time" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="TotalTimeTXT" runat="server" MaxLength="20" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Total Time') this.value='';" ToolTip="Total Time"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="ServingSizeLBL" runat="server" Text="Servings" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="ServingSizeTXT" runat="server" MaxLength="20" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Serving Size') this.value='';" ToolTip="Serving Size"></asp:TextBox>&nbsp;
            </td>
         </tr>
         </table>
         <!-- RECIPE DESCRIPTION AND RATING -->
         <table>
         <tr>
            <td>
                <asp:Label ID="RecipeDescriptionLBL" runat="server" Text="Recipe Description" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="RecipeDescriptionTXT" MaxLength="256" runat="server" Width="660px" onfocus="if(this.value=='Recipe Description') this.value='';" ToolTip="Recipe Description"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RatingRV" runat="server" ErrorMessage="Rating must a number, 1-5" 
                    ControlToValidate="RatingTXT" Display="Dynamic" MinimumValue="1" MaximumValue="5" 
                    ToolTip="Must be a number, 1-5" Type="Integer">*</asp:RangeValidator>
                <asp:Label ID="RatingLBL" runat="server" Text="Rating (1-5)" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="RatingTXT" runat="server" MaxLength="1" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Rating (1-5)') this.value='';" ToolTip="Rating (1-5)"></asp:TextBox>
            </td>
         </tr>
        </table>
        <!-- to make text disappear: onfocus="if(this.value==this.defaultValue) this.value='';" -->
        <!-- alternative: onfocus="if(this.value=='Recipe Name') this.value='';" -->

        <!-- SQL data source for the AMOUNT drop down lists -->
        <asp:SqlDataSource ID="UnitsSDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            SelectCommand="SELECT * FROM [RECIPEASE_UNIT] ORDER BY UNIT_NAME">
        </asp:SqlDataSource>

        <!-- QUANTITY, AMOUNT, and INGREDIENT controls (20 entries, 10 rows total)-->
        <table>
        <!-- ROW 1 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity01TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity01TXT" 
                    onservervalidate="Ingredient01CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Quantity01LBL" runat="server" Text="Qty" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Quantity01TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="Amount01LBL" runat="server" Text="Amount" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:DropDownList ID="Amount01DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient01CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient01TXT" 
                    onservervalidate="Ingredient01CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator21" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient01TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Ingredient01LBL" runat="server" Text="Ingredient" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Ingredient01TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
                    <!-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp; -->
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity02TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity02TXT" 
                    onservervalidate="Ingredient02CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Quantity02LBL" runat="server" Text="Qty" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Quantity02TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:Label ID="Amount02LBL" runat="server" Text="Amount" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:DropDownList ID="Amount02DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient02CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient02TXT" 
                    onservervalidate="Ingredient02CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator22" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient02TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Ingredient02LBL" runat="server" Text="Ingredient" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="Ingredient02TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 2 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity03TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity03TXT" 
                    onservervalidate="Ingredient03CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity03TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount03DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient03CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient03TXT" 
                    onservervalidate="Ingredient03CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator23" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient03TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient03TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity04TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity04TXT" 
                    onservervalidate="Ingredient04CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity04TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount04DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient04CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient04TXT" 
                    onservervalidate="Ingredient04CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator24" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient04TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient04TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 3 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity05TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity05TXT" 
                    onservervalidate="Ingredient05CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity05TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount05DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient05CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient05TXT" 
                    onservervalidate="Ingredient05CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator25" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient05TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient05TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator6" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity06TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity06TXT" 
                    onservervalidate="Ingredient06CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity06TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount06DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient06CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient06TXT" 
                    onservervalidate="Ingredient06CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator26" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient06TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient06TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        </table>

        <!-- ADD MORE INGREDIENTS (ONLY DISPLAYS WHEN BOX IS CHECKED BY USER)-->
        <asp:CheckBox ID="AddMoreIngredients01CB" Text="Add more ingredients" runat="server" AutoPostBack="true" oncheckedchanged="AddMoreIngredients01CB_CheckedChanged" 
            ToolTip="Add more ingredients" />
        <!-- ROW 4 -->
        <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table>
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator7" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity07TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator7" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity07TXT" 
                    onservervalidate="Ingredient07CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity07TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount07DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient07CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient07TXT" 
                    onservervalidate="Ingredient07CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator27" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient07TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient07TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator8" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity08TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator8" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity08TXT" 
                    onservervalidate="Ingredient08CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity08TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount08DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient08CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient08TXT" 
                    onservervalidate="Ingredient08CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator28" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient08TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient08TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 5 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator9" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity09TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator9" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity09TXT" 
                    onservervalidate="Ingredient09CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity09TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount09DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient09CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient09TXT" 
                    onservervalidate="Ingredient09CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator29" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient09TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient09TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator10" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity10TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator10" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity10TXT" 
                    onservervalidate="Ingredient10CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity10TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount10DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient10CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient10TXT" 
                    onservervalidate="Ingredient10CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator30" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient10TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient10TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 6 -->
		<tr>
            <td>
                <asp:RangeValidator ID="RangeValidator11" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity11TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator11" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity11TXT" 
                    onservervalidate="Ingredient11CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity11TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount11DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient11CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient11TXT" 
                    onservervalidate="Ingredient11CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator31" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient11TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient11TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator12" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity12TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator12" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity12TXT" 
                    onservervalidate="Ingredient12CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity12TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount12DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient12CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient12TXT" 
                    onservervalidate="Ingredient12CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator32" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient12TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient12TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 7 -->
		<tr>
            <td>
                <asp:RangeValidator ID="RangeValidator13" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity13TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator13" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity13TXT" 
                    onservervalidate="Ingredient13CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity13TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount13DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient13CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient13TXT" 
                    onservervalidate="Ingredient13CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator33" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient13TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient13TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator14" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity14TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator14" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity14TXT" 
                    onservervalidate="Ingredient14CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity14TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount14DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient14CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient14TXT" 
                    onservervalidate="Ingredient14CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator34" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient14TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient14TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 8 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator15" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity15TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator15" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity15TXT" 
                    onservervalidate="Ingredient15CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity15TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount15DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient15CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient15TXT" 
                    onservervalidate="Ingredient15CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator35" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient15TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient15TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator16" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity16TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator16" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity16TXT" 
                    onservervalidate="Ingredient16CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity16TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount16DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient16CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient16TXT" 
                    onservervalidate="Ingredient16CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator36" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient16TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient16TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 9 -->
		<tr>
            <td>
                <asp:RangeValidator ID="RangeValidator17" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity17TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator17" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity17TXT" 
                    onservervalidate="Ingredient17CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity17TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount17DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient17CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient17TXT" 
                    onservervalidate="Ingredient17CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator37" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient17TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient17TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator18" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity18TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator18" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity18TXT" 
                    onservervalidate="Ingredient18CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity18TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount18DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient18CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient18TXT" 
                    onservervalidate="Ingredient18CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator38" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient18TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient18TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 10 -->
		<tr>
            <td>
                <asp:RangeValidator ID="RangeValidator19" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity19TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator19" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity19TXT" 
                    onservervalidate="Ingredient19CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity19TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount19DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient19CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient19TXT" 
                    onservervalidate="Ingredient19CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator39" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient19TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient19TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator20" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity20TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator20" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Quantity20TXT" 
                    onservervalidate="Ingredient20CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity20TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount20DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="Ingredient20CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and an ingredient" ControlToValidate="Ingredient20TXT" 
                    onservervalidate="Ingredient20CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator40" runat="server" 
                    ErrorMessage="Two ingredients cannot have the same name" ControlToValidate="Ingredient20TXT" 
                    onservervalidate="IngredientNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Ingredient20TXT" runat="server" MaxLength="50" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        </table>
        </asp:Panel>

        <!-- DIRECTIONS -->
        <table>
        <tr>
            <td>
                <asp:Label ID="DirectionsLBL" runat="server" Text="Directions" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="DirectionsTXT" MaxLength="2000" runat="server" Width="690px" 
                    onfocus="if(this.value=='Directions') this.value='';" ToolTip="Directions" Rows="4" TextMode="MultiLine"></asp:TextBox><br /><br />
            </td>
        </tr>
        </table>
        
        <!-- IMAGE UPLOAD -->
        <asp:Label ID="FileUploadLBL" runat="server" Text="Upload Recipe Image" SkinID="recipeLabel">Upload Recipe Image: </asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />

        <!-- TAGS -->
        <asp:Label ID="TagsLBL" runat="server" Text="Tags:" SkinID="recipeLabel">Tags:</asp:Label>
        <asp:SqlDataSource ID="TagsSDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            SelectCommand="SELECT * FROM [RECIPEASE_TAG]" >
        </asp:SqlDataSource>
        <asp:ListBox ID="TagsLBX" runat="server" Rows="6" ToolTip="Tags" 
            DataSourceID="TagsSDS" DataTextField="tag_name" DataValueField="tag_name" 
            SelectionMode="Multiple"></asp:ListBox> <br /><br />

        <!-- ADD, RESET, CANCEL BUTTONS -->
        <asp:Button ID="AddRecipeBTN" SkinID="BlackButton" runat="server" Text="Add" 
            onclick="AddRecipeBTN_Click" />
        <asp:Button ID="ResetRecipeBTN" SkinID="BlackButton" runat="server" OnClick="ResetRecipeBTN_Click" Text="Reset"  CausesValidation="False" />
        <asp:Button ID="GoBackBTN" SkinID="BlackButton" runat="server" PostBackUrl="~/Recipes/index.aspx" Text="Cancel"  CausesValidation="False" />
     </div>
</asp:Content>
