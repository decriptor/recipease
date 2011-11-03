<%@ Page Title="" Language="C#" MasterPageFile="~/RecipeaseMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Pantry_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <title>Recipease - Food Pantry Editor</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="onecolumn">
        <h1>My Food Pantry</h1>
            <span class="emphasis">Boxed</span> <hr />
                <asp:TextBox ID="TextBox0" runat="server" Height="25px" Width="102px">2 boxes</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="200px">Oatmeal</asp:TextBox>&nbsp;
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp; 
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink><br />
                <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox6" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox7" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink4" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink21" runat="server" CssClass="addMore moveright smallpad" NavigateUrl="~/Pantry/index.aspx">[ + ] add more</asp:HyperLink><br /><br />
            <span class="emphasis">Canned</span> <hr />
                <asp:TextBox ID="TextBox8" runat="server" Height="25px" Width="102px">28 oz</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox9" runat="server" Height="25px" Width="200px">Corn, Whole Kernal</asp:TextBox>&nbsp;
                    <asp:ImageButton ID="ImageButton17" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink17" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox10" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox11" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp; 
                    <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink5" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink><br />
                <asp:TextBox ID="TextBox12" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox13" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink6" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox14" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox15" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink7" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>    
                    <asp:HyperLink ID="HyperLink22" runat="server" CssClass="addMore moveright smallpad" NavigateUrl="~/Pantry/index.aspx">[ + ] add more</asp:HyperLink><br /><br />
            <span class="emphasis">Meat</span> <hr />
                <asp:TextBox ID="TextBox16" runat="server" Height="25px" Width="102px">4 lbs</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox17" runat="server" Height="25px" Width="200px">Chicken Breast, Boneless</asp:TextBox>&nbsp;
                    <asp:ImageButton ID="ImageButton18" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink18" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox18" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox19" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp; 
                    <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink8" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink><br />
                <asp:TextBox ID="TextBox20" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox21" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink9" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox22" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox23" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink10" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink23" runat="server" CssClass="addMore moveright smallpad" NavigateUrl="~/Pantry/index.aspx">[ + ] add more</asp:HyperLink><br /><br />        
            <span class="emphasis">Dairy</span> <hr />
                <asp:TextBox ID="TextBox24" runat="server" Height="25px" Width="102px">16 oz</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox25" runat="server" Height="25px" Width="200px">Sour Cream</asp:TextBox>&nbsp;
                    <asp:ImageButton ID="ImageButton19" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink19" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox26" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox27" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp; 
                    <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink11" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink><br />
                <asp:TextBox ID="TextBox28" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox29" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink12" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox30" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox31" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton13" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink13" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink24" runat="server" CssClass="addMore moveright smallpad" NavigateUrl="~/Pantry/index.aspx">[ + ] add more</asp:HyperLink><br /><br />  
            <span class="emphasis">Vegetables</span> <hr />
                <asp:TextBox ID="TextBox32" runat="server" Height="25px" Width="102px">16 oz bag</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox33" runat="server" Height="25px" Width="200px">carrots, frozen</asp:TextBox>&nbsp;
                    <asp:ImageButton ID="ImageButton20" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink20" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox34" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox35" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp; 
                    <asp:ImageButton ID="ImageButton14" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink14" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink><br />
                <asp:TextBox ID="TextBox36" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox37" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton15" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink15" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>&nbsp;
                <asp:TextBox ID="TextBox38" runat="server" Height="25px" Width="102px">Amount</asp:TextBox>&nbsp; 
                <asp:TextBox ID="TextBox39" runat="server" Height="25px" Width="200px">Item</asp:TextBox>&nbsp;
                <asp:ImageButton ID="ImageButton16" runat="server" ImageUrl="~/Images/barcode_icon_2.jpg" ToolTip="Scan Item" />&nbsp;
                    <asp:HyperLink ID="HyperLink16" runat="server" CssClass="removeX" NavigateUrl="~/Pantry/index.aspx" ToolTip="Remove Item"> X </asp:HyperLink>
                    <asp:HyperLink ID="HyperLink25" runat="server" CssClass="addMore moveright smallpad" NavigateUrl="~/Pantry/index.aspx">[ + ] add more</asp:HyperLink><br /><br />
                
                <!-- SAVE BUTTON -->
                <asp:Button ID="Button1" SkinID="BlackButton" runat="server" Text="Save" />      
    </div>
</asp:Content>

