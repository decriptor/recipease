using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Recipes_addRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Page.Form.DefaultFocus = RecipeNameTXT.ClientID; // DO NOT USE - will erase default text
        this.Form.DefaultButton = this.AddRecipeBTN.UniqueID; // default button when enter is pressed
    }
    protected void AddRecipeBTN_Click(object sender, EventArgs e)
    {
        string FileName = Path.GetFileName(FileUpload1.FileName); // stores relative filename path of uploaded image
        if (FileName != "")
        {
            FileName = "~/Images/Recipes/" + FileName;
            FileUpload1.SaveAs(Server.MapPath(FileName));
        }
        else
        {
            FileName = "";
        }

        try
        {
            // insert form data as a new row in the RECIPE Table
            if (RecipeNameTXT.Text != "Recipe Name") // default text check
            {
                RecipeaseSDS.InsertParameters["rec_name"].DefaultValue = RecipeNameTXT.Text;
            }
            if (RecipeDescriptionTXT.Text != "Recipe Description")
            {
                RecipeaseSDS.InsertParameters["rec_desc"].DefaultValue = RecipeDescriptionTXT.Text;
            }
            if (PrepTimeTXT.Text != "Prep Time")
            {
                RecipeaseSDS.InsertParameters["rec_prep_time"].DefaultValue = PrepTimeTXT.Text;
            }
            if (CookTimeTXT.Text != "Cook Time")
            {
                RecipeaseSDS.InsertParameters["rec_cook_time"].DefaultValue = CookTimeTXT.Text;
            }
            if (CookTempTXT.Text != "Cook Temp")
            {
                RecipeaseSDS.InsertParameters["rec_cook_temp"].DefaultValue = CookTempTXT.Text;
            }
            if (TotalTimeTXT.Text != "Total Time")
            {
                RecipeaseSDS.InsertParameters["rec_ready_time"].DefaultValue = TotalTimeTXT.Text;
            }
            if (ServingSizeTXT.Text != "Serving Size")
            {
                RecipeaseSDS.InsertParameters["rec_serving_size"].DefaultValue = ServingSizeTXT.Text;
            }
            RecipeaseSDS.InsertParameters["rec_date"].DefaultValue = DateTime.Now.ToString();
            RecipeaseSDS.InsertParameters["rec_image_path"].DefaultValue = FileName;
            RecipeaseSDS.InsertParameters["rec_owner"].DefaultValue = User.Identity.Name.ToString();
            if (RatingTXT.Text != "Rating (1-5)")
            {
                RecipeaseSDS.InsertParameters["rec_rating"].DefaultValue = RatingTXT.Text;
            }
            if (DirectionsTXT.Text != "Directions")
            {
                RecipeaseSDS.InsertParameters["rec_directions"].DefaultValue = DirectionsTXT.Text;
            }

            // perform actual insert
            RecipeaseSDS.Insert();

            // reset stuff to default values if insert succeeds
            RecipeNameTXT.Text = "Recipe Name";
            RecipeDescriptionTXT.Text = "Recipe Description";
            PrepTimeTXT.Text = "Prep Time";
            CookTimeTXT.Text = "Cook Time";
            CookTempTXT.Text = "Cook Temp";
            TotalTimeTXT.Text = "Total Time";
            ServingSizeTXT.Text = "Serving Size";
            DirectionsTXT.Text = "Directions";

            // go back to main recipe page if insert succeeds
            Response.Redirect("index.aspx");
            
        }
        catch (Exception ex)
        {
            ErrorsLBL.Text = "An exception occurrred adding the order. " + ex.Message;
        }
    }
}