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
        </p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">Return to viewing your recipes</asp:HyperLink>
        </p>
        
        <!-- RECIPE NAME & INFO -->  
        <table style="height: 63px">
         <tr>
            <td>
                <asp:Label ID="RecipeNameLBL" runat="server" Text="Recipe Name" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="RecipeNameTXT" runat="server" MaxLength="50" Width="250px" onfocus="if(this.value=='Recipe Name') this.value='';" ToolTip="Recipe Name"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:Label ID="PrepTimeLBL" runat="server" Text="Prep Time" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="PrepTimeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Prep Time') this.value='';" ToolTip="Prep Time"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="CookTimeLBL" runat="server" Text="Cook Time" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="CookTimeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Cook Time') this.value='';" ToolTip="Cook Time"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="CookTempLBL" runat="server" Text="Cook Temp" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="CookTempTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Cook Temp') this.value='';" ToolTip="Cook Temp"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="TotalTimeLBL" runat="server" Text="Total Time" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="TotalTimeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Total Time') this.value='';" ToolTip="Total Time"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="ServingSizeLBL" runat="server" Text="Servings" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="ServingSizeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Serving Size') this.value='';" ToolTip="Serving Size"></asp:TextBox>&nbsp;
            </td>
         </tr>
         </table>
         <!-- RECIPE DESCRIPTION AND RATING -->
         <table>
         <tr>
            <td>
                <asp:Label ID="RecipeDescriptionLBL" runat="server" Text="Recipe Description" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="RecipeDescriptionTXT" runat="server" Width="660px" onfocus="if(this.value=='Recipe Description') this.value='';" ToolTip="Recipe Description"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="RatingLBL" runat="server" Text="Rating (1-5)" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="RatingTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Rating (1-5)') this.value='';" ToolTip="Rating (1-5)"></asp:TextBox>
            </td>
         </tr>
        </table>
        <!-- to make text disappear: onfocus="if(this.value==this.defaultValue) this.value='';" -->
        <!-- alternative: onfocus="if(this.value=='Recipe Name') this.value='';" -->

        <!-- SQL data source for the AMOUNT drop down lists -->
        <asp:SqlDataSource ID="UnitsSDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            SelectCommand="SELECT * FROM [RECIPEASE_UNIT]">
        </asp:SqlDataSource>

        <!-- QUANTITY, AMOUNT, and INGREDIENT controls (20 entries, 10 rows total)-->
        <table>
        <!-- ROW 1 -->
        <tr>
            <td>
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
                <asp:Label ID="Ingredient01LBL" runat="server" Text="Ingredient" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Ingredient01TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
                    <!-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp; -->
            </td>
            <td>
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
                <asp:Label ID="Ingredient02LBL" runat="server" Text="Ingredient" SkinID="recipeLabel"></asp:Label><br />
                <asp:TextBox ID="Ingredient02TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 2 -->
        <tr>
            <td>
                <asp:TextBox ID="Quantity03TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount03DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient03TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity04TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount04DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient04TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 3 -->
        <tr>
            <td>
                <asp:TextBox ID="Quantity05TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount05DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient05TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity06TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount06DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient06TXT" runat="server" Height="27px" Width="160px" 
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
                <asp:TextBox ID="Quantity07TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount07DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient07TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity08TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount08DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient08TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 5 -->
        <tr>
            <td>
                <asp:TextBox ID="Quantity09TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount09DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient09TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity10TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount10DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient10TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 6 -->
		<tr>
            <td>
                <asp:TextBox ID="Quantity11TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount11DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient11TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity12TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount12DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient12TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 7 -->
		<tr>
            <td>
                <asp:TextBox ID="Quantity13TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount13DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient13TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity14TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount14DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient14TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 8 -->
        <tr>
            <td>
                <asp:TextBox ID="Quantity15TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount15DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient15TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity16TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount16DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient16TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 9 -->
		<tr>
            <td>
                <asp:TextBox ID="Quantity17TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount17DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient17TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity18TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount18DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient18TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;<br />
            </td>
        </tr>
        <!-- ROW 10 -->
		<tr>
            <td>
                <asp:TextBox ID="Quantity19TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount19DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient19TXT" runat="server" Height="27px" Width="160px" 
                    onfocus="if(this.value=='Ingredient') this.value='';" ToolTip="Ingredient" ></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Quantity20TXT" runat="server" Height="27px" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity" ></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount20DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" Height="27px" 
                    ToolTip="Amount"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:TextBox ID="Ingredient20TXT" runat="server" Height="27px" Width="160px" 
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
                <asp:TextBox ID="DirectionsTXT" runat="server" Width="690px" 
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
        <asp:Button ID="ResetRecipeBTN" SkinID="BlackButton" runat="server" OnClick="ResetRecipeBTN_Click" Text="Reset"  />
        <asp:Button ID="GoBackBTN" SkinID="BlackButton" runat="server" PostBackUrl="~/Recipes/index.aspx" Text="Cancel"  />
     </div>
</asp:Content>
