<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="addRecipe.aspx.cs" Inherits="Recipes_addRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Add a Recipe</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
    </asp:SqlDataSource>
    <div id="onecolumn">
        <h1>Enter Recipe</h1>
        <p>
            <asp:Label ID="ErrorsLBL" CssClass="emphasis" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">Return to viewing your recipes</asp:HyperLink>
        </p>
        
        <!-- RECIPE NAME & INFO -->
        <asp:TextBox ID="RecipeNameTXT" runat="server" Height="29px" MaxLength="50" Width="320px" onfocus="if(this.value=='Recipe Name') this.value='';" ToolTip="Recipe Name">Recipe Name</asp:TextBox>&nbsp;
            <!-- to make text disappear: onfocus="if(this.value==this.defaultValue) this.value='';" -->
            <!-- alternative: onfocus="if(this.value=='Recipe Name') this.value='';" -->
        <asp:TextBox ID="PrepTimeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Prep Time') this.value='';" ToolTip="Prep Time">Prep Time</asp:TextBox>&nbsp;
        <asp:TextBox ID="CookTimeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Cook Time') this.value='';" ToolTip="Cook Time">Cook Time</asp:TextBox>&nbsp;
        <asp:TextBox ID="CookTempTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Cook Temp') this.value='';" ToolTip="Cook Temp">Cook Temp</asp:TextBox>&nbsp;
        <asp:TextBox ID="TotalTimeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Total Time') this.value='';" ToolTip="Total Time">Total Time</asp:TextBox>&nbsp;
        <asp:TextBox ID="ServingSizeTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText" onfocus="if(this.value=='Serving Size') this.value='';" ToolTip="Serving Size">Serving Size</asp:TextBox>&nbsp;<br /><br />
        <asp:TextBox ID="RecipeDescriptionTXT" runat="server" Height="55px" Width="660px" onfocus="if(this.value=='Recipe Description') this.value='';" ToolTip="Recipe Description">Recipe Description</asp:TextBox>&nbsp;
        <asp:TextBox ID="RatingTXT" runat="server" Height="25px" Width="71px" SkinID="SmallText">Rating (1-5)</asp:TextBox><br /><br />
        <!-- ROW 1 -->
        <asp:TextBox ID="Amount01TXT" runat="server" Height="27px" Width="102px">Amount</asp:TextBox>&nbsp; 
        <asp:TextBox ID="Ingredient01TXT" runat="server" Height="27px" Width="220px">Ingredient</asp:TextBox>&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
        <asp:TextBox ID="Amount02TXT" runat="server" Height="27px" Width="102px">Amount</asp:TextBox>&nbsp; 
        <asp:TextBox ID="Ingredient02TXT" runat="server" Height="27px" Width="220px">Ingredient</asp:TextBox>&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;<br />
        <!-- ROW 2 -->
        <asp:TextBox ID="Amount03TXT" runat="server" Height="27px" Width="102px">Amount</asp:TextBox>&nbsp; 
        <asp:TextBox ID="Ingredient03TXT" runat="server" Height="27px" Width="220px">Ingredient</asp:TextBox>&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
        <asp:TextBox ID="Amount04TXT" runat="server" Height="27px" Width="102px">Amount</asp:TextBox>&nbsp; 
        <asp:TextBox ID="Ingredient04TXT" runat="server" Height="27px" Width="220px">Ingredient</asp:TextBox>&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;<br />
        <!-- ROW 3 -->
        <asp:TextBox ID="Amount05TXT" runat="server" Height="27px" Width="102px">Amount</asp:TextBox>&nbsp; 
        <asp:TextBox ID="Ingredient05TXT" runat="server" Height="27px" Width="220px">Ingredient</asp:TextBox>&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
        <asp:TextBox ID="Amount06TXT" runat="server" Height="27px" Width="102px">Amount</asp:TextBox>&nbsp; 
        <asp:TextBox ID="Ingredient06TXT" runat="server" Height="27px" Width="220px">Ingredient</asp:TextBox>&nbsp;&nbsp;
            <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;<br />
            <asp:HyperLink ID="HyperLink21" runat="server" CssClass="addMore" 
                NavigateUrl="~/Recipes/addRecipe.aspx">[ + ] add more ingredients</asp:HyperLink><br /><br />
        <!-- DIRECTIONS -->
        <asp:TextBox ID="DirectionsTXT" runat="server" Height="70px" Width="690px" onfocus="if(this.value=='Directions') this.value='';" ToolTip="Directions">Directions</asp:TextBox><br /><br />
        <!-- IMAGE UPLOAD -->
        <asp:Label ID="FileUploadLBL" runat="server" Text="Label">Upload Recipe Image: </asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />
        <!-- TAGS -->
        <asp:TextBox ID="TagsTXT" runat="server" Width="710px" onfocus="if(this.value=='Tags') this.value='';" ToolTip="Tags">Tags</asp:TextBox> <br /><br />
        <!-- ADD BUTTON -->
        <asp:Button ID="AddRecipeBTN" SkinID="BlackButton" runat="server" Text="Add" 
            onclick="AddRecipeBTN_Click" />
     </div>
</asp:Content>
