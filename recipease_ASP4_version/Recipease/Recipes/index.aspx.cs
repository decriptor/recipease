using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;      // For the database connections and objects.
using Microsoft.SqlServer.Server;
using System.Configuration;
using System.Data;

public partial class Recipes_index : System.Web.UI.Page
{
    // public Boolean isLoggedIn = HttpContext.Current.Request.IsAuthenticated;
    
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

    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int selected_rec_id = (int)DetailsView1.SelectedValue; // rec_id to be targeted for deletion

        // 1.  open the Connection object for the context
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["INFO3420_12ConnectionString"].ConnectionString);
        myConnection.Open();

        // 2.  create new sql command object to write to the database
        SqlCommand delete = new SqlCommand("delete_RECIPE", myConnection);

        // 3. set up sprocs with proper values and execute!
        delete.CommandType = CommandType.StoredProcedure;
        delete.Parameters.Add("@rec_id", SqlDbType.Int).Value = selected_rec_id;
        delete.ExecuteNonQuery(); //execute the sproc

        // 4.  close the Connection object for the context
        myConnection.Close();
         
        // 5.  update the grid view
        GridView1.DataBind();
    }
    protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            ErrorLBL.Text = "A database error has occurred.  Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            ErrorLBL.Text = "Another user may have updated that product.  Try again.";
        }
        else
        {
            GridView1.DataBind();
            ErrorLBL.Text = "Recipe was successfully deleted.";
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        FileUpload FileUpload1 = (FileUpload)DetailsView1.FindControl("FileUpload1");

        //string currentFilename = FileUploadLBL.TXT;  // need to find a way to access this label!

        string FileName = Path.GetFileName(FileUpload1.FileName); // stores relative filename path of uploaded image

        if (FileName != "")  // && FileName != currentFilename
        {
            FileName = "~/Images/Recipes/" + FileName;
            FileUpload1.SaveAs(Server.MapPath(FileName));
            RecipeaseDetailsViewSDS.UpdateParameters["rec_image_path"].DefaultValue = FileName;
        }
        else
        {
            FileName = "";
        }
    }
}