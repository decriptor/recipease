<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Recipes_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Current Recipes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="leftcolumn">
        <h1>Current Recipes</h1>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/addRecipe.aspx">Add a new recipe</asp:HyperLink><br /><br />
        </p>  

        <!-- data source for grid view -->
        <asp:SqlDataSource ID="RecipeaseSDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            SelectCommand="SELECT * FROM [RECIPEASE_RECIPE] WHERE ([rec_owner] = @userName) ORDER BY rec_date DESC">
            <SelectParameters>
                <asp:Parameter Name="userName" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- grid view -->
        <div>
        <asp:Label ID="Label1" runat="server" Text=" " >Current recipes for <% =User.Identity.Name.ToString() %>: </asp:Label><br /><br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
            DataSourceID="RecipeaseSDS" AutoGenerateColumns="False" AllowPaging="True" 
            BackColor="White" BorderColor="Black" BorderWidth="2px" 
            CellPadding="4" ForeColor="Black" Width="370px" PageSize="10" 
            DataKeyNames="rec_id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="rec_name" HeaderText="Name" SortExpression="rec_name"/>
                <asp:BoundField DataField="rec_date" HeaderText="Date Modified" SortExpression="rec_date" 
                    DataFormatString="{0:g}" />
            </Columns>
            <EmptyDataTemplate>
                No recipes have been added yet. <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/addRecipe.aspx">Add a new recipe</asp:HyperLink> 
                to get started.
            </EmptyDataTemplate>
            <PagerSettings Mode="NextPrevious" NextPageText="Next page" PreviousPageText="Previous page" />
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        </div>
    </div>
    <div id="rightcolumn, smallpad">
        <!-- data source for details view -->
        <asp:SqlDataSource ID="RecipeaseDetailsViewSDS" runat="server" 
            ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            OldValuesParameterFormatString="original_{0}"

            SelectCommand="SELECT * FROM [RECIPEASE_RECIPE] WHERE ([rec_id] = @rec_id)" 
            DeleteCommand="DELETE FROM [RECIPEASE_RECIPE] WHERE [rec_id] = @original_rec_id" 
            InsertCommand="INSERT INTO [RECIPEASE_RECIPE] ([rec_name], [rec_desc], [rec_prep_time], [rec_cook_time], [rec_cook_temp], [rec_ready_time], [rec_serving_size], [rec_date], [rec_image_path], [rec_owner], [rec_rating], [rec_directions]) VALUES (@rec_name, @rec_desc, @rec_prep_time, @rec_cook_time, @rec_cook_temp, @rec_ready_time, @rec_serving_size, @rec_date, @rec_image_path, @rec_owner, @rec_rating, @rec_directions)" 
            UpdateCommand="UPDATE [RECIPEASE_RECIPE] SET [rec_name] = @rec_name, [rec_desc] = @rec_desc, [rec_prep_time] = @rec_prep_time, [rec_cook_time] = @rec_cook_time, [rec_cook_temp] = @rec_cook_temp, [rec_ready_time] = @rec_ready_time, [rec_serving_size] = @rec_serving_size, [rec_date] = @cur_date, [rec_image_path] = @rec_image_path, [rec_rating] = @rec_rating, [rec_directions] = @rec_directions WHERE [rec_id] = @original_rec_id">
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
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="rec_id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="rec_name" Type="String" />
                <asp:Parameter Name="rec_desc" Type="String" />
                <asp:Parameter Name="rec_prep_time" Type="String" />
                <asp:Parameter Name="rec_cook_time" Type="String" />
                <asp:Parameter Name="rec_cook_temp" Type="String" />
                <asp:Parameter Name="rec_ready_time" Type="String" />
                <asp:Parameter Name="rec_serving_size" Type="String" />
                <asp:Parameter Name="cur_date" Type="DateTime" />
                <asp:Parameter Name="rec_image_path" Type="String" />
                <asp:Parameter Name="rec_owner" Type="String" />
                <asp:Parameter Name="rec_rating" Type="Byte" />
                <asp:Parameter Name="rec_directions" Type="String" />
                <asp:Parameter Name="rec_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- details view for updating/deleting -->
        <div>
        <br /><br />Details for selected recipe:<br /><br />
        <asp:Label ID="ErrorLBL" runat="server" EnableViewState="false">Test</asp:Label>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="300px" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" ForeColor="Black" DataSourceID="RecipeaseDetailsViewSDS" 
            AutoGenerateRows="False" DataKeyNames="rec_id">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <EmptyDataTemplate>
                No rows selected.&nbsp; Click the &#39;Select&#39; link to the left of the row to display 
                recipe details.
            </EmptyDataTemplate>
            <Fields>
                <asp:TemplateField HeaderText="Name" SortExpression="rec_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("rec_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("rec_name") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("rec_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="rec_desc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("rec_desc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("rec_desc") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("rec_desc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Prep Time" SortExpression="rec_prep_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("rec_prep_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("rec_prep_time") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("rec_prep_time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cook Time" SortExpression="rec_cook_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("rec_cook_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("rec_cook_time") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("rec_cook_time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cook Temp" SortExpression="rec_cook_temp">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("rec_cook_temp") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("rec_cook_temp") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("rec_cook_temp") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ready Time" SortExpression="rec_ready_time">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("rec_ready_time") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("rec_ready_time") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("rec_ready_time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Serving Size" 
                    SortExpression="rec_serving_size">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" 
                            Text='<%# Bind("rec_serving_size") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" 
                            Text='<%# Bind("rec_serving_size") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("rec_serving_size") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Upload image" SortExpression="rec_image_path">
                    <EditItemTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server"/> 
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("rec_image_path") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("rec_image_path") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rating (1-5)" SortExpression="rec_rating">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("rec_rating") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("rec_rating") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("rec_rating") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Directions" SortExpression="rec_directions">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("rec_directions") %>' Rows="6"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("rec_directions") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("rec_directions") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit Recipe"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete Recipe"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:DetailsView>
        </div>
    </div>
</asp:Content>

