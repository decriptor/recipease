using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateUserWizard1.Focus(); // set default focus
    }

    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        // need to include System.Web.Security
        string myUser;
        MembershipUser user = Membership.GetUser();
        myUser = user.UserName;
        Roles.AddUserToRole(myUser, "Customer");
        Response.Redirect("~/Default.aspx");
    }
}