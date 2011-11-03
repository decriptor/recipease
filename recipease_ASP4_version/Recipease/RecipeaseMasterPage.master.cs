using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RecipeaseMasterPageNEW : System.Web.UI.MasterPage
{
    public DateTime LastModified;

    protected void Page_Load(object sender, EventArgs e)
    {
        // FNameTXT.Focus(); // set default focus code
        // (Page.Master.FindControl("SubmitBTN") as HtmlForm).DefaultButton = this.cmdSubmit.UniqueID; // set default button when enter is pressed

        // get date the page was last modified
        System.IO.FileInfo loFile = new System.IO.FileInfo(Server.MapPath(Request.Url.AbsolutePath));
        LastModified = loFile.LastWriteTime;
    }
}
