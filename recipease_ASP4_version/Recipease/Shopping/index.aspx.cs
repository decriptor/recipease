using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string meal_owner = User.Identity.Name.ToString(); // get UN for query string param

        // add current user to url for dynamic shopping list generation
        if (Request.Url.ToString() == "http://localhost/Recipease/Shopping/index.aspx" ||
            Request.Url.ToString() == "http://161.28.118.37/Recipease/Shopping/index.aspx" ||
            Request.Url.ToString() == "http://info3420-12/Recipease/Shopping/index.aspx")
        {
            string url = "http://161.28.118.37/Recipease/Shopping/index.aspx?meal_owner=" + meal_owner;
                Response.Redirect(url);
        }
    }
    protected void printBTN_Click(object sender, EventArgs e)
    {
        ErrorsLBL.Text = "Shopping list has been successfully sent to your printer.";
    }
}