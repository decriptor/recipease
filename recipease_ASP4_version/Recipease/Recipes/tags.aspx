<%@ Page Title="Recipease - View/Edit Tags" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="tags.aspx.cs" Inherits="Recipes_tags" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - View/Edit Tags</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="leftcolumn">
    <h1>Tags for Recipe: <%=Request.QueryString["rec_name"] %></h1>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Recipes/index.aspx">Return to recipes</asp:HyperLink><br /><br />
    </p>  

    <!-- data source for GridView -->
    <asp:SqlDataSource ID="RecipeTagSDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT rec_id, RT.tag_id, tag_name
                        FROM RECIPEASE_RECIPE_TAG RT INNER JOIN RECIPEASE_TAG T ON T.tag_id = RT.tag_id 
                        WHERE (RT.rec_id = @rec_id)"
        DeleteCommand="DELETE FROM [RECIPEASE_RECIPE_TAG] WHERE [rec_id] = @original_rec_id AND [tag_id] = @original_tag_id" 
        UpdateCommand="UPDATE [RECIPEASE_RECIPE_TAG] SET [tag_id] = @tag_id WHERE [rec_id] = @original_rec_id AND [tag_id] = @original_tag_id" 
        InsertCommand="INSERT INTO [RECIPEASE_RECIPE_TAG] ([rec_id], [tag_id]) VALUES (@rec_id, @tag_id)" > 
          <DeleteParameters>
              <asp:Parameter Name="original_rec_id" Type="Int32" />
              <asp:Parameter Name="original_tag_id" Type="Int32" />
          </DeleteParameters>
        <UpdateParameters>
              <asp:Parameter Name="tag_id" Type="Int32" />
              <asp:Parameter Name="original_rec_id" Type="Int32" />
              <asp:Parameter Name="original_tag_id" Type="String" />
          </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="rec_id" QueryStringField="rec_id" 
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="rec_id" Type="Int32" />
            <asp:Parameter Name="tag_id" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

      <!-- SQL data source for the TAG drop down lists -->
      <asp:SqlDataSource ID="TagSDS" runat="server" 
          ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
          SelectCommand="SELECT * FROM [RECIPEASE_TAG]">
      </asp:SqlDataSource>

    <!-- GridView for tag data -->
    <asp:Label ID="Label2" runat="server" Text="">Current tags for recipe: <%=Request.QueryString["rec_name"] %></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="RecipeTagSDS" ForeColor="Black" 
        GridLines="Vertical" AutoGenerateColumns="False" AllowSorting="True" 
        DataKeyNames="rec_id, tag_id" 
        onrowdeleted="GridView1_RowDeleted" onrowupdated="GridView1_RowUpdated" >
        <EmptyDataTemplate>
            No tags currently exist for this recipe.  To add tags, edit the list on the right.<br /><br />
        </EmptyDataTemplate>
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:TemplateField HeaderText="Tag" SortExpression="tag_name">
                <EditItemTemplate>
                    <asp:DropDownList ID="TagDDL" DataSourceID="TagSDS" runat="server" 
                    DataTextField="tag_name" SelectedValue='<%# Bind("tag_id") %>' DataValueField="tag_id">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("tag_name") %>'></asp:Label>
                </ItemTemplate>
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

<div id="rightcolumn, smallpad">
    <p>
    <br /><br /><br />Add new tags to recipe: <%=Request.QueryString["rec_name"] %>
    </p>

    <!-- TAGS FOR INSERTING-->
        <asp:Label ID="TagsLBL" runat="server" Text="Tags">Tags</asp:Label>
        <asp:SqlDataSource ID="TagsSDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:INFO3420_12ConnectionString %>" 
            SelectCommand="SELECT * FROM [RECIPEASE_TAG]
                            WHERE tag_id not in (SELECT tag_id
                                                FROM RECIPEASE_RECIPE_TAG
                                                WHERE rec_id = @rec_id)" >
            <SelectParameters>
                <asp:QueryStringParameter Name="rec_id" QueryStringField="rec_id" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListBox ID="TagsLBX" runat="server" Rows="6" ToolTip="Tags" 
        DataSourceID="TagsSDS" DataTextField="tag_name" DataValueField="tag_name" 
        SelectionMode="Multiple">
        </asp:ListBox><br /><br />

     <!-- ADD, RESET, CANCEL BUTTONS -->
        <asp:Button ID="AddTagsBTN" SkinID="BlackButton" runat="server" Text="Add" 
            onclick="AddTagsBTN_Click" />
        <asp:Button ID="ResetTagsBTN" SkinID="BlackButton" runat="server" 
            OnClick="ResetTagsBTN_Click" Text="Reset"  />
</div>
</asp:Content>

