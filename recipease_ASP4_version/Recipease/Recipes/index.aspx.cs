using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recipes_index : System.Web.UI.Page
{
    public Boolean isLoggedIn = HttpContext.Current.Request.IsAuthenticated;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        RecipeaseSDS.SelectParameters["userName"].DefaultValue = User.Identity.Name.ToString(); // get UN
        RecipeaseDetailsViewSDS.UpdateParameters["cur_date"].DefaultValue = DateTime.Now.ToString(); // get date

        if (!IsPostBack)
        {
            //Response.Cookies.Add(new HttpCookie("userName", User.Identity.Name.ToString()));
            //Response.Cookies.Add(new HttpCookie("currentDateTime", DateTime.Now.ToString()));
        }
    }

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            ErrorLBL.Text = "A database error has occurred.  Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            ErrorLBL.Text = "Another user may have updated that product.  Try again.";
        }
        else
        {
            GridView1.DataBind();
            ErrorLBL.Text = "Recipe successfully updated.";
        }
    }

    protected void DetailsView1_ItemDeleted(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            ErrorLBL.Text = "A database error has occurred.  Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            ErrorLBL.Text = "Another user may have updated that product.  Try again.";
        }
        else
        {
            GridView1.DataBind();
            ErrorLBL.Text = "Recipe successfully deleted.";
        }
    }
}