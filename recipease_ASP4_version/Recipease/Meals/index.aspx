<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Meals_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Meal Planner</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="leftcolumn" style="width: 280px; padding-right: 20px;">
        <h1>My Meals</h1>
            <p>The meal date and recipe name are the only required fields for adding meals.
            </p>
            <p>
            Can't see any recipe names for meal planning? Visit your 
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">recipe page</asp:HyperLink>
            to get started!
            </p>
            <p>
            <asp:Label ID="ErrorsLBL" CssClass="emphasis" runat="server" SkinID="errorLabel" Text=""></asp:Label>
            </p>

            <!-- ADD NEW MEAL SECTION -->
            <div style="border: 1px solid black; padding: 0 0 10px 10px">
                <h2>Add a new meal:</h2>
                <!-- MEAL DATE SELECTION -->
                Meal date: <asp:Label ID="mealDateLBL" runat="server" Text=""></asp:Label>
                <asp:Button ID="mealDateBTN" runat="server" SkinID="BlackButtonSmallTextLONGER" 
                    Text="Select Date" onclick="mealDateBTN_Click" />
                <asp:Calendar ID="mealCalendar" runat="server" 
                    BackColor="White" BorderColor="#999999" CellPadding="4" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                    Height="180px" Width="200px" Visible="false" 
                    onselectionchanged="mealCalendar_SelectionChanged" >
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar><br /><br />
            
                <!-- MEAL TYPE SELECTION -->
                Meal Type: 
                <asp:DropDownList ID="mealTypeDDL" runat="server">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>breakfast</asp:ListItem>
                    <asp:ListItem>lunch</asp:ListItem>
                    <asp:ListItem>dinner</asp:ListItem>
                    <asp:ListItem>snack</asp:ListItem>
                    <asp:ListItem>other</asp:ListItem>
                </asp:DropDownList><br /><br />

                <!-- MEAL SUBTYPE SELECTION -->
                Meal Subtype: 
                <asp:DropDownList ID="mealSubTypeDDL" runat="server">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem>appetizer</asp:ListItem>
                    <asp:ListItem>beverage</asp:ListItem>
                    <asp:ListItem>bread</asp:ListItem>
                    <asp:ListItem>dessert</asp:ListItem>
                    <asp:ListItem>main dish</asp:ListItem>
                    <asp:ListItem>other</asp:ListItem>
                    <asp:ListItem>salad</asp:ListItem>
                    <asp:ListItem>soup</asp:ListItem>
                    <asp:ListItem>side dish</asp:ListItem>
                </asp:DropDownList><br /><br />
     
                <!-- RECIPE SELECTION -->
                <asp:SqlDataSource ID="RecipeSDS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
                    SelectCommand="SELECT * FROM [RECIPEASE_RECIPE] WHERE ([rec_owner] = @userName) ORDER BY rec_name">
                    <SelectParameters>
                        <asp:Parameter Name="userName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                Recipe name: 
                <asp:DropDownList ID="RecipeDDL" runat="server" Width="250px" DataSourceID="RecipeSDS" 
                    DataTextField="rec_name" DataValueField="rec_id">
                </asp:DropDownList><br /><br />
            
                <!-- ADD MEAL BUTTON -->
                    <asp:Button ID="addMealBTN" SkinID="BlackButtonLONG" OnClick="addMealBTN_Click" runat="server" 
                        Text="Add Meal" />  
            </div>
            <!-- END ADD NEW MEAL SECTION -->
    </div>
    <div id="rightcolumn smallpad" style="padding-left: 10px">
        <!-- SQL DATA SOURCE FOR MEALS GRIDVIEW -->
        <asp:SqlDataSource ID="MealSDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT RECIPEASE_MEAL.meal_date, RECIPEASE_MEAL.meal_type, RECIPEASE_MEAL.meal_subtype, RECIPEASE_MEAL.meal_owner, RECIPEASE_RECIPE.rec_id, RECIPEASE_RECIPE.rec_name 
                            FROM RECIPEASE_MEAL INNER JOIN RECIPEASE_RECIPE ON RECIPEASE_MEAL.rec_id = RECIPEASE_RECIPE.rec_id
                            WHERE (RECIPEASE_MEAL.meal_owner = @rec_owner)
                            ORDER BY RECIPEASE_MEAL.meal_date" 
            InsertCommand="INSERT INTO [RECIPEASE_MEAL]
                            (meal_date, rec_id, meal_type, meal_subtype, meal_owner, meal_timestamp) VALUES
                            (@meal_date, @rec_id, @meal_type, @meal_subtype, @meal_owner, @meal_timestamp)"
            DeleteCommand="DELETE FROM [RECIPEASE_MEAL] 
                            WHERE [meal_date] = @original_meal_date 
                                AND [rec_id] = @original_rec_id"
            UpdateCommand="UPDATE [RECIPEASE_MEAL] 
                            SET [meal_date] = @meal_date, 
                                [rec_id] = @rec_id, 
                                [meal_type] = @meal_type, 
                                [meal_subtype] = @meal_subtype, 
                                [meal_timestamp] = @meal_timestamp 
                           WHERE [meal_date] = @original_meal_date 
                                AND [rec_id] = @original_rec_id" >
        <SelectParameters>
            <asp:Parameter Name="rec_owner" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="original_meal_date" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="GridView1" Name="original_rec_id" 
                PropertyName="SelectedValue" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_meal_date" Type="String" />
            <asp:Parameter Name="meal_date" Type="String" />
            <asp:Parameter Name="original_rec_id" Type="Decimal" />
            <asp:Parameter Name="rec_id" Type="Decimal" />
            <asp:Parameter Name="meal_type" Type="String" />
            <asp:Parameter Name="meal_subtype" Type="String" />
            <asp:Parameter Name="meal_timestamp" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="meal_date" Type="String" />
            <asp:Parameter Name="rec_id" Type="Decimal" />
            <asp:Parameter Name="meal_type" Type="String" />
            <asp:Parameter Name="meal_subtype" Type="String" />
            <asp:Parameter Name="meal_owner" Type="String" />
            <asp:Parameter Name="meal_timestamp" Type="DateTime" />
        </InsertParameters>
        </asp:SqlDataSource>
        
        <!-- MEALS GRIDVIEW -->
        <p>
        Done planning meals? 
        <asp:HyperLink ID="shoppingListLINK" runat="server" NavigateUrl="~/Shopping/index.aspx" >Generate your shopping list.</asp:HyperLink>
        </p>
        <h2>Current meals for <% =User.Identity.Name.ToString() %>: </h2><br />
        <asp:Label ID="Errors2LBL" CssClass="emphasis" runat="server" SkinID="errorLabel" Text=""></asp:Label><br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="MealSDS" DataKeyNames="meal_date,rec_id" PageSize="10"
            ForeColor="Black" GridLines="Vertical"
            
            EmptyDataText="Your meals list is empty.  Plan meals using the form on the left." 
            onrowupdated="GridView1_RowUpdated" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    <br /><asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    <br />&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Date">
                <EditItemTemplate>
                    <asp:Label ID="Label0" runat="server" Text='<%# Bind("meal_date") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("meal_date") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Recipe">
                <EditItemTemplate>
                    <asp:DropDownList ID="RecipeEditDDL" DataSourceID="RecipeSDS" runat="server" Width="75px"
                    DataTextField="rec_name" SelectedValue='<%# Bind("rec_id") %>' DataValueField="rec_id">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("rec_name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
                <ItemStyle Width="5px"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Type">
                <EditItemTemplate>
                    <asp:DropDownList ID="mealTypeEditDDL"
                        SelectedValue='<%# Bind("meal_type") %>' runat="server">
                        <asp:ListItem> </asp:ListItem>
                        <asp:ListItem>breakfast</asp:ListItem>
                        <asp:ListItem>lunch</asp:ListItem>
                        <asp:ListItem>dinner</asp:ListItem>
                        <asp:ListItem>snack</asp:ListItem>
                        <asp:ListItem>other</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("meal_type") %>' ></asp:Label>
                </ItemTemplate>
                <HeaderStyle></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Subtype">
                <EditItemTemplate>
                    <asp:DropDownList ID="mealSubTypeEditDDL"
                        SelectedValue='<%# Bind("meal_subtype") %>' runat="server">
                        <asp:ListItem> </asp:ListItem>
                        <asp:ListItem>main dish</asp:ListItem>
                        <asp:ListItem>appetizer</asp:ListItem>
                        <asp:ListItem>beverage</asp:ListItem>
                        <asp:ListItem>bread</asp:ListItem>
                        <asp:ListItem>dessert</asp:ListItem>
                        <asp:ListItem>other</asp:ListItem>
                        <asp:ListItem>salad</asp:ListItem>
                        <asp:ListItem>soup</asp:ListItem>
                        <asp:ListItem>side dish</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("meal_subtype") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle></HeaderStyle>
                <ItemStyle></ItemStyle>
            </asp:TemplateField>
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
    </div>
</asp:Content>
