<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Pantry_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Food Pantry Editor</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="leftcolumn">
    <h1>My Food Pantry</h1>

    <p>
        <asp:Label ID="ErrorsLBL" CssClass="emphasis" runat="server" SkinID="errorLabel" Text=""></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Please correct the following errors: " />
        <p>
        <br />
    </p>

    <!-- data source for gridview -->
    <asp:SqlDataSource ID="PantrySDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT RP.pantry_item, RP.pantry_item_quantity, RP.unit_id, RPT.pantry_type_name, RP.rec_owner, RP.pantry_type_id, RP.pantry_date, RU.unit_name
                        FROM RECIPEASE_PANTRY RP INNER JOIN RECIPEASE_PANTRY_TYPE RPT ON RP.pantry_type_id = RPT.pantry_type_id INNER JOIN RECIPEASE_UNIT RU ON  RU.unit_id = RP.unit_id
                        WHERE (RP.rec_owner = @rec_owner)
                        ORDER BY RP.pantry_item"
        DeleteCommand="DELETE FROM [RECIPEASE_PANTRY] WHERE [rec_owner] = @original_rec_owner AND [pantry_item] = @original_pantry_item"
        UpdateCommand="UPDATE [RECIPEASE_PANTRY] SET [pantry_item] = @pantry_item, [pantry_item_quantity] = @pantry_item_quantity, [unit_id] = @unit_id, [pantry_type_id] = @pantry_type_id, [pantry_date] = @pantry_date 
                        WHERE [rec_owner] = @original_rec_owner AND [pantry_item] = @original_pantry_item" >
        <SelectParameters>
            <asp:Parameter Name="rec_owner" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="original_rec_owner" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="GridView1" Name="original_pantry_item" 
                PropertyName="SelectedValue" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_rec_owner" Type="String" />
            <asp:Parameter Name="pantry_item" Type="String" />
            <asp:Parameter Name="original_pantry_item" Type="String" />
            <asp:Parameter Name="pantry_item_quantity" Type="Decimal" />
            <asp:Parameter Name="unit_id" Type="Int32" />
            <asp:Parameter Name="pantry_type_id" Type="Int32" />
            <asp:Parameter Name="pantry_date" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!-- SQL data source for the AMOUNT drop down lists -->
    <asp:SqlDataSource ID="UnitsSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        SelectCommand="SELECT * FROM [RECIPEASE_UNIT] ORDER BY unit_name">
    </asp:SqlDataSource>

    <!-- SQL data source for the Pantry type drop down lists -->
    <asp:SqlDataSource ID="PantryTypeSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        SelectCommand="SELECT * FROM [RECIPEASE_PANTRY_TYPE]"></asp:SqlDataSource>

    <!-- gridview for pantry items -->
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        EmptyDataText="Your pantry is empty.  Add pantry items using the form on the right." 
        ForeColor="Black" GridLines="Vertical" AllowPaging="True" DataKeyNames="rec_owner,pantry_item"
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="PantrySDS" 
        onrowupdated="GridView1_RowUpdated" PageSize="15">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty">
                <EditItemTemplate>
                    <asp:RangeValidator ID="RangeValidator" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Textbox1" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pantry_item_quantity") %>' Width="35px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("pantry_item_quantity") %>' Width="35px"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Amount">
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

            <asp:TemplateField HeaderText="Item">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="50" Text='<%# Bind("pantry_item") %>' Width="110px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("pantry_item") %>' Width="110px"></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Type">
                <EditItemTemplate>
                    <asp:DropDownList ID="PantryTypeDDL" DataSourceID="PantryTypeSDS" runat="server" 
                    DataTextField="pantry_type_name" SelectedValue='<%# Bind("pantry_type_id") %>' DataValueField="pantry_type_id" Width="75px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("pantry_type_name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Width="5px"></HeaderStyle>
                <ItemStyle Width="55px"></ItemStyle>
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
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</div>

<div id="rightcolumn, smallpad">
    <p>
    <br /><br /><br />Add new items to your pantry:
       <!-- QUANTITY, AMOUNT, and PANTRY ITEM controls -->
        <table>
        <!-- ROW 1 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity01TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="Quantity01TXT" 
                    onservervalidate="PantryItem01CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="Quantity01LBL" runat="server" Text="Qty" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="Quantity01TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:Label ID="Amount01LBL" runat="server" Text="Amount" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:DropDownList ID="Amount01DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount" Width="85px"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="PantryItem01CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="PantryItem01TXT" 
                    onservervalidate="PantryItem01CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator7" runat="server" 
                    ErrorMessage="Two pantry items cannot have the same name" ControlToValidate="PantryItem01TXT" 
                    onservervalidate="PantryItemNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:Label ID="PantryItem01LBL" runat="server" Text="Pantry Item" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:TextBox ID="PantryItem01TXT" MaxLength="50" runat="server"  Width="115px" 
                    onfocus="if(this.value=='Pantry Item'') this.value='';" ToolTip="Pantry Item"></asp:TextBox>&nbsp;&nbsp;
                    <!-- <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp; -->
            </td>
            <td>
                <asp:Label ID="PantryType01LBL" runat="server" Text="Type" SkinID="recipeLabel"></asp:Label><br /> 
                <asp:DropDownList ID="PantryType01DDL" runat="server" DataSourceID="PantryTypeSDS" 
                    DataTextField="pantry_type_name" DataValueField="pantry_type_name" 
                    ToolTip="Pantry Item Type" Width="75px"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <!-- ROW 2 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator2" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity02TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="Quantity02TXT" 
                    onservervalidate="PantryItem02CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity02TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount02DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount" Width="85px"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="PantryItem02CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="PantryItem02TXT" 
                    onservervalidate="PantryItem02CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator8" runat="server" 
                    ErrorMessage="Two pantry items cannot have the same name" ControlToValidate="PantryItem02TXT" 
                    onservervalidate="PantryItemNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="PantryItem02TXT" MaxLength="50" runat="server"  Width="115px" 
                    onfocus="if(this.value=='Pantry Item'') this.value='';" ToolTip="Pantry Item"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="PantryType02DDL" runat="server" DataSourceID="PantryTypeSDS" 
                    DataTextField="pantry_type_name" DataValueField="pantry_type_name" 
                    ToolTip="Pantry Item Type" Width="75px"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <!-- ROW 3 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator3" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity03TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator3" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="Quantity03TXT" 
                    onservervalidate="PantryItem03CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity03TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount03DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount" Width="85px"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="PantryItem03CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="PantryItem03TXT" 
                    onservervalidate="PantryItem03CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator9" runat="server" 
                    ErrorMessage="Two pantry items cannot have the same name" ControlToValidate="PantryItem03TXT" 
                    onservervalidate="PantryItemNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="PantryItem03TXT" MaxLength="50" runat="server"  Width="115px" 
                    onfocus="if(this.value=='Pantry Item'') this.value='';" ToolTip="Pantry Item"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="PantryType03DDL" runat="server" DataSourceID="PantryTypeSDS" 
                    DataTextField="pantry_type_name" DataValueField="pantry_type_name" 
                    ToolTip="Pantry Item Type" Width="75px"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <!-- ROW 4 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator4" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity04TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator4" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="Quantity04TXT" 
                    onservervalidate="PantryItem04CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity04TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount04DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount" Width="85px"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="PantryItem04CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="PantryItem04TXT" 
                    onservervalidate="PantryItem04CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator10" runat="server" 
                    ErrorMessage="Two pantry items cannot have the same name" ControlToValidate="PantryItem04TXT" 
                    onservervalidate="PantryItemNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="PantryItem04TXT" MaxLength="50" runat="server"  Width="115px" 
                    onfocus="if(this.value=='Pantry Item'') this.value='';" ToolTip="Pantry Item"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="PantryType04DDL" runat="server" DataSourceID="PantryTypeSDS" 
                    DataTextField="pantry_type_name" DataValueField="pantry_type_name" 
                    ToolTip="Pantry Item Type" Width="75px"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <!-- ROW 5 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator5" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity05TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator5" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="Quantity05TXT" 
                    onservervalidate="PantryItem05CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity05TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="Amount05DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount" Width="85px"></asp:DropDownList>&nbsp;
            </td>
            <td class="style1">
                <asp:CustomValidator ID="PantryItem05CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="PantryItem05TXT" 
                    onservervalidate="PantryItem05CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator11" runat="server" 
                    ErrorMessage="Two pantry items cannot have the same name" ControlToValidate="PantryItem05TXT" 
                    onservervalidate="PantryItemNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="PantryItem05TXT" MaxLength="50" runat="server"  Width="115px" 
                    onfocus="if(this.value=='Pantry Item'') this.value='';" ToolTip="Pantry Item"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="PantryType05DDL" runat="server" DataSourceID="PantryTypeSDS" 
                    DataTextField="pantry_type_name" DataValueField="pantry_type_name" 
                    ToolTip="Pantry Item Type" Width="75px"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        <!-- ROW 6 -->
        <tr>
            <td>
                <asp:RangeValidator ID="RangeValidator6" runat="server" Display="Dynamic"
                        ErrorMessage="Quantity must be a number" ControlToValidate="Quantity06TXT" Type="Double" 
                        MinimumValue="0" MaximumValue="32000">*</asp:RangeValidator>
                <asp:CustomValidator ID="CustomValidator6" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="Quantity06TXT" 
                    onservervalidate="PantryItem06CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="Quantity06TXT" runat="server" Width="35px" 
                    onfocus="if(this.value=='Qty') this.value='';" ToolTip="Quantity"></asp:TextBox>&nbsp;
                
            </td>
            <td>
                <asp:DropDownList ID="Amount06DDL" runat="server" DataSourceID="UnitsSDS" 
                    DataTextField="unit_name" DataValueField="unit_name" 
                    ToolTip="Amount" Width="85px"></asp:DropDownList>&nbsp;
            </td>
            <td>
                <asp:CustomValidator ID="PantryItem06CV" runat="server" 
                    ErrorMessage="You must specify both a quantity and a pantry item" ControlToValidate="PantryItem05TXT" 
                    onservervalidate="PantryItem06CV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidator12" runat="server" 
                    ErrorMessage="Two pantry items cannot have the same name" ControlToValidate="PantryItem06TXT" 
                    onservervalidate="PantryItemNameCV_ServerValidate" Display="Dynamic">*</asp:CustomValidator>
                <asp:TextBox ID="PantryItem06TXT" MaxLength="50" runat="server"  Width="115px" 
                    onfocus="if(this.value=='Pantry Item'') this.value='';" ToolTip="Pantry Item"></asp:TextBox>&nbsp;&nbsp;
            </td>
            <td>
                <asp:DropDownList ID="PantryType06DDL" runat="server" DataSourceID="PantryTypeSDS" 
                    DataTextField="pantry_type_name" DataValueField="pantry_type_name" 
                    ToolTip="Pantry Item Type" Width="75px"></asp:DropDownList>&nbsp;
            </td>
        </tr>
        </table>

        <!-- ADD, RESET, CANCEL BUTTONS -->
    <asp:Button ID="AddPantryItemsBTN" SkinID="BlackButton" runat="server" Text="Add" 
        onclick="AddPantryItemsBTN_CLICK" />
    <asp:Button ID="ResetPantryItemsBTN" SkinID="BlackButton" runat="server" 
        OnClick="ResetPantryItemsBTN_CLICK" Text="Reset"  CausesValidation="False" />
</div>
</asp:Content>

