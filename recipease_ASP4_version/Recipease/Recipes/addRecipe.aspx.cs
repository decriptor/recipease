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

public partial class Recipes_addRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Page.Form.DefaultFocus = RecipeNameTXT.ClientID; // DO NOT USE - will erase default text of textbox
        this.Form.DefaultButton = this.AddRecipeBTN.UniqueID; // default button when enter is pressed
    }

    protected void AddRecipeBTN_Click(object sender, EventArgs e) // adds recipe data to various tables in db
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
            // insert form data as a new row in the RECIPE table
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

            // perform actual insert in RECIPE table
            RecipeaseSDS.Insert();

            // now that recipe has been created, insert form data as new row(s) in the INGREDIENT table 
            // ONLY insert new row if ing_name does not exist -- NATHAN needs to add this db trigger/sproc
            if (Ingredient01TXT.Text != "Ingredient" && Ingredient01TXT.Text != "")
            {
                IngredientSDS.InsertParameters["ing_name"].DefaultValue = Ingredient01TXT.Text;
                IngredientSDS.Insert(); // perform actual insert
            }
            if (Ingredient02TXT.Text != "Ingredient" && Ingredient02TXT.Text != "")
            {
                IngredientSDS.InsertParameters["ing_name"].DefaultValue = Ingredient02TXT.Text;
                IngredientSDS.Insert();
            }
            if (Ingredient03TXT.Text != "Ingredient" && Ingredient03TXT.Text != "")
            {
                IngredientSDS.InsertParameters["ing_name"].DefaultValue = Ingredient03TXT.Text;
                IngredientSDS.Insert();
            }
            if (Ingredient04TXT.Text != "Ingredient" && Ingredient04TXT.Text != "")
            {
                IngredientSDS.InsertParameters["ing_name"].DefaultValue = Ingredient04TXT.Text;
                IngredientSDS.Insert();
            }
            if (Ingredient05TXT.Text != "Ingredient" && Ingredient05TXT.Text != "")
            {
                IngredientSDS.InsertParameters["ing_name"].DefaultValue = Ingredient05TXT.Text;
                IngredientSDS.Insert();
            }
            if (Ingredient06TXT.Text != "Ingredient" && Ingredient06TXT.Text != "")
            {
                IngredientSDS.InsertParameters["ing_name"].DefaultValue = Ingredient06TXT.Text;
                IngredientSDS.Insert();
            }

            // now that any new recipe ingredients are added to INGREDIENT table, and the recipe data has 
            // been added to the RECIPE table, insert form data as new row(s) in the RECIPE_INGREDIENT table
            // in order to link the two together

            /*** INSERT QUERIES START ***/
            if (Ingredient01TXT.Text != "Ingredient"
                    || Ingredient02TXT.Text != "Ingredient"
                    || Ingredient03TXT.Text != "Ingredient"
                    || Ingredient04TXT.Text != "Ingredient"
                    || Ingredient05TXT.Text != "Ingredient"
                    || Ingredient06TXT.Text != "Ingredient")
            {
                // 1.  open the Connection object for the context
                SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["INFO3420_12ConnectionString"].ConnectionString);
                myConnection.Open();

                // 2.  create new sql command object to write to the database
                SqlCommand insert01 = new SqlCommand("insert_into_RECIPE_INGREDIENT", myConnection);
                SqlCommand insert02 = new SqlCommand("insert_into_RECIPE_INGREDIENT", myConnection);
                SqlCommand insert03 = new SqlCommand("insert_into_RECIPE_INGREDIENT", myConnection);
                SqlCommand insert04 = new SqlCommand("insert_into_RECIPE_INGREDIENT", myConnection);
                SqlCommand insert05 = new SqlCommand("insert_into_RECIPE_INGREDIENT", myConnection);
                SqlCommand insert06 = new SqlCommand("insert_into_RECIPE_INGREDIENT", myConnection);

                //3. set up sprocs with proper values and execute!
                if (Ingredient01TXT.Text != "Ingredient" && Ingredient01TXT.Text != "")
                {
                    insert01.CommandType = CommandType.StoredProcedure;
                    insert01.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.Add("@ing_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.AddWithValue("@ing_name", Ingredient01TXT.Text);
                    insert01.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity01TXT.Text));
                    insert01.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.AddWithValue("@unit_name", Amount01DDL.SelectedValue);
                    insert01.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient02TXT.Text != "Ingredient" && Ingredient02TXT.Text != "")
                {
                    insert02.CommandType = CommandType.StoredProcedure;
                    insert02.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.Add("@ing_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.AddWithValue("@ing_name", Ingredient02TXT.Text);
                    insert02.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity02TXT.Text));
                    insert02.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount02DDL.SelectedValue));
                    insert02.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient03TXT.Text != "Ingredient" && Ingredient03TXT.Text != "")
                {
                    insert03.CommandType = CommandType.StoredProcedure;
                    insert03.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.Add("@ing_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.AddWithValue("@ing_name", Ingredient03TXT.Text);
                    insert03.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity03TXT.Text));
                    insert03.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount03DDL.SelectedValue));
                    insert03.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient04TXT.Text != "Ingredient" && Ingredient04TXT.Text != "")
                {
                    insert04.CommandType = CommandType.StoredProcedure;
                    insert04.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.Add("@ing_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.AddWithValue("@ing_name", Ingredient04TXT.Text);
                    insert04.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity04TXT.Text));
                    insert04.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount04DDL.SelectedValue));
                    insert04.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient05TXT.Text != "Ingredient" && Ingredient05TXT.Text != "")
                {
                    insert05.CommandType = CommandType.StoredProcedure;
                    insert05.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.Add("@ing_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.AddWithValue("@ing_name", Ingredient05TXT.Text);
                    insert05.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity05TXT.Text));
                    insert05.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount05DDL.SelectedValue));
                    insert05.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient06TXT.Text != "Ingredient" && Ingredient06TXT.Text != "")
                {
                    insert06.CommandType = CommandType.StoredProcedure;
                    insert06.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                    insert06.Parameters.Add("@ing_id", SqlDbType.Int).Value = 0;
                    insert06.Parameters.AddWithValue("@ing_name", Ingredient06TXT.Text);
                    insert06.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity06TXT.Text));
                    insert06.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert06.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount06DDL.SelectedValue));
                    insert06.ExecuteNonQuery(); //execute the sproc
                }

                // loop through items in the TAG list box and insert user-selected values into the TAG table
                foreach (ListItem item in TagsLBX.Items)
                {
                    if (item.Selected)
                    {
                        SqlCommand insertTAG = new SqlCommand("insert_into_RECIPE_TAG", myConnection);
                        insertTAG.CommandType = CommandType.StoredProcedure;
                        insertTAG.Parameters.Add("@rec_id", SqlDbType.Int).Value = 0;
                        insertTAG.Parameters.Add("@tag_id", SqlDbType.Int).Value = 0;
                        insertTAG.Parameters.AddWithValue("@tag_name", item.Text);
                        insertTAG.ExecuteNonQuery(); //execute the sproc
                    }
                } 

                // 4.  close the Connection object for the context
                myConnection.Close();

                //REFERENCE: to capture output variable, do: 
                // insert01.Parameters["@OUTPUT_VARIABLE_NAME"].Direction = ParameterDirection.Output;
                // insert01.ExecuteNonQuery();
                // int ID_var = (int) maxRecID.Parameters["@OUTPUT_VARIABLE_NAME"].Value;
                //REFERENCE: then in the sproc, declare as an output variable, and for identity columns, 
                //REFERENCE: at the end SET @OUTPUT_VARIABLE_NAME = SCOPE_IDENTITY()
            }
            /*** INSERT QUERIES END ***/

            // reset stuff to default values if insert succeeds
            RecipeNameTXT.Text = "Recipe Name";
            RecipeDescriptionTXT.Text = "Recipe Description";
            PrepTimeTXT.Text = "Prep Time";
            CookTimeTXT.Text = "Cook Time";
            CookTempTXT.Text = "Cook Temp";
            TotalTimeTXT.Text = "Total Time";
            ServingSizeTXT.Text = "Serving Size";
            RatingTXT.Text = "Rating (1-5)";
            DirectionsTXT.Text = "Directions";
            Ingredient01TXT.Text = "Ingredient";
            Ingredient01TXT.Text = "Ingredient";
            Ingredient02TXT.Text = "Ingredient";
            Ingredient03TXT.Text = "Ingredient";
            Ingredient04TXT.Text = "Ingredient";
            Ingredient05TXT.Text = "Ingredient";
            Ingredient06TXT.Text = "Ingredient";
            Quantity01TXT.Text = "Qty";
            Quantity02TXT.Text = "Qty";
            Quantity03TXT.Text = "Qty";
            Quantity04TXT.Text = "Qty";
            Quantity05TXT.Text = "Qty";
            Quantity06TXT.Text = "Qty";
            Amount01DDL.SelectedIndex = 0; // drop downs for unit amounts will display the default text
            Amount02DDL.SelectedIndex = 0;
            Amount03DDL.SelectedIndex = 0;
            Amount04DDL.SelectedIndex = 0;
            Amount05DDL.SelectedIndex = 0;
            Amount06DDL.SelectedIndex = 0;
            TagsLBX.SelectedIndex = -1; // resets all listbox selections

            foreach (ListItem item in TagsLBX.Items)
            {
                if (item.Selected)
                {
                    item.Selected = false;
                }
            }

            // go back to main recipe page if insert succeeds
            Response.Redirect("index.aspx");
        }
        catch (Exception ex)
        {
            ErrorsLBL.Text = "An exception occurrred adding the recipe. " + ex.Message;
        }
    }

    protected void ResetRecipeBTN_Click(object sender, EventArgs e)
    {
            // reset stuff to default values
            RecipeNameTXT.Text = "Recipe Name";
            RecipeDescriptionTXT.Text = "Recipe Description";
            PrepTimeTXT.Text = "Prep Time";
            CookTimeTXT.Text = "Cook Time";
            CookTempTXT.Text = "Cook Temp";
            TotalTimeTXT.Text = "Total Time";
            ServingSizeTXT.Text = "Serving Size";
            RatingTXT.Text = "Rating (1-5)";
            DirectionsTXT.Text = "Directions";
            Ingredient01TXT.Text = "Ingredient";
            Ingredient01TXT.Text = "Ingredient";
            Ingredient02TXT.Text = "Ingredient";
            Ingredient03TXT.Text = "Ingredient";
            Ingredient04TXT.Text = "Ingredient";
            Ingredient05TXT.Text = "Ingredient";
            Ingredient06TXT.Text = "Ingredient";
            Quantity01TXT.Text = "Qty";
            Quantity02TXT.Text = "Qty";
            Quantity03TXT.Text = "Qty";
            Quantity04TXT.Text = "Qty";
            Quantity05TXT.Text = "Qty";
            Quantity06TXT.Text = "Qty";
            Amount01DDL.SelectedIndex = 0; // drop downs for unit amounts will display the default text
            Amount02DDL.SelectedIndex = 0;
            Amount03DDL.SelectedIndex = 0;
            Amount04DDL.SelectedIndex = 0;
            Amount05DDL.SelectedIndex = 0;
            Amount06DDL.SelectedIndex = 0;
            TagsLBX.SelectedIndex = -1;
    }
}