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
        if (!IsPostBack)
        {
            Response.Cookies.Add(new HttpCookie("userName", User.Identity.Name.ToString()));
            //Response.Cookies.Add(new HttpCookie("currentDateTime", DateTime.Now.ToString()));
        }
    }
}