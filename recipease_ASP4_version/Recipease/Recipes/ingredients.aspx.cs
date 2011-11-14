using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;      // For the database connections and objects.
using Microsoft.SqlServer.Server;
using System.Configuration;
using System.Data;

public partial class Recipes_ingredients : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Form.DefaultFocus = Quantity01TXT.ClientID; // default textbox focus on page load
        this.Form.DefaultButton = this.AddIngredientsBTN.UniqueID; // default button when enter is pressed
    }

    //public static string GetNumberDisplay(object value) // removes any trailing zeros (not currently used)
    //{
    //    string number = value.ToString();
    //    number = number.TrimEnd("0".ToCharArray());
    //    number = number.TrimEnd(".".ToCharArray());

    //    return number;
    //}

    protected void AddIngredientsBTN_CLICK(object sender, EventArgs e)
    {
        try 
        {
            Page.Validate();
            if (Page.IsValid == true)
            {
                // add more ingredients to the selected recipe
                /*** INSERT QUERIES START ***/

                // 1.  open the Connection object for the context
                SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["INFO3420_12ConnectionString"].ConnectionString);
                myConnection.Open();

                // 2.  create new sql command object to write to the database
                SqlCommand insert01 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert02 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert03 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert04 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert05 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert06 = new SqlCommand("insert_MORE_RECIPES", myConnection);

                //3. set up sprocs with proper values and execute!
                if (Ingredient01TXT.Text != "" && Quantity01TXT.Text != "")
                {
                    insert01.CommandType = CommandType.StoredProcedure;
                    insert01.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert01.Parameters.AddWithValue("@ing_name", Ingredient01TXT.Text);
                    insert01.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity01TXT.Text));
                    insert01.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.AddWithValue("@unit_name", Amount01DDL.SelectedValue);
                    insert01.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient02TXT.Text != "" && Quantity02TXT.Text != "")
                {
                    insert02.CommandType = CommandType.StoredProcedure;
                    insert02.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert02.Parameters.AddWithValue("@ing_name", Ingredient02TXT.Text);
                    insert02.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity02TXT.Text));
                    insert02.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount02DDL.SelectedValue));
                    insert02.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient03TXT.Text != "" && Quantity03TXT.Text != "")
                {
                    insert03.CommandType = CommandType.StoredProcedure;
                    insert03.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert03.Parameters.AddWithValue("@ing_name", Ingredient03TXT.Text);
                    insert03.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity03TXT.Text));
                    insert03.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount03DDL.SelectedValue));
                    insert03.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient04TXT.Text != "" && Quantity04TXT.Text != "")
                {
                    insert04.CommandType = CommandType.StoredProcedure;
                    insert04.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert04.Parameters.AddWithValue("@ing_name", Ingredient04TXT.Text);
                    insert04.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity04TXT.Text));
                    insert04.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount04DDL.SelectedValue));
                    insert04.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient05TXT.Text != "" && Quantity05TXT.Text != "")
                {
                    insert05.CommandType = CommandType.StoredProcedure;
                    insert05.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert05.Parameters.AddWithValue("@ing_name", Ingredient05TXT.Text);
                    insert05.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity05TXT.Text));
                    insert05.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount05DDL.SelectedValue));
                    insert05.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient06TXT.Text != "" && Quantity06TXT.Text != "")
                {
                    insert06.CommandType = CommandType.StoredProcedure;
                    insert06.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert06.Parameters.AddWithValue("@ing_name", Ingredient06TXT.Text);
                    insert06.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity06TXT.Text));
                    insert06.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert06.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount06DDL.SelectedValue));
                    insert06.ExecuteNonQuery(); //execute the sproc
                }

                // 4.  close the Connection object for the context
                myConnection.Close();
            }
        }
        catch (Exception ex)
        {
            ErrorsLBL.Text = "An error occurrred adding the ingredients. Check to make sure " +
                            "1) you don't have any missing quantities or ingredients, and " +
                            "2) you don't have any duplicate ingredient names  " +
                            ex.Message;
        }

        if (Page.IsValid)
        {
            // page refresh to update data sources if inserts succeed
            Response.Redirect("~/Recipes/ingredients.aspx?rec_id=" + Request.QueryString["rec_id"] + "&rec_name=" + Request.QueryString["rec_name"]);
        }
    }
    
    protected void ResetIngredientsBTN_CLICK(object sender, EventArgs e)
    {
        // reset stuff to default values
        Ingredient01TXT.Text = "";
        Ingredient01TXT.Text = "";
        Ingredient02TXT.Text = "";
        Ingredient03TXT.Text = "";
        Ingredient04TXT.Text = "";
        Ingredient05TXT.Text = "";
        Ingredient06TXT.Text = "";
        Quantity01TXT.Text = "";
        Quantity02TXT.Text = "";
        Quantity03TXT.Text = "";
        Quantity04TXT.Text = "";
        Quantity05TXT.Text = "";
        Quantity06TXT.Text = "";
        Amount01DDL.SelectedIndex = 0; // drop downs for unit amounts will display the default text
        Amount02DDL.SelectedIndex = 0;
        Amount03DDL.SelectedIndex = 0;
        Amount04DDL.SelectedIndex = 0;
        Amount05DDL.SelectedIndex = 0;
        Amount06DDL.SelectedIndex = 0;
    }

    // BEGIN CUSTOM VALIDATION CHECKS OF INGREDIENT AND QUANTITY FIELDS
    protected void Ingredient01CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity01(args.Value); // custom validation of ingredient values entered
    }
    private bool checkQuantity01(string ingredient) // make sure qty and ingredient are both entered in
    {
        if ((Ingredient01TXT.Text != "" && Quantity01TXT.Text != "") || (Ingredient01TXT.Text == "" && Quantity01TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void Ingredient02CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity02(args.Value); // custom validation of ingredient values entered
    }
    private bool checkQuantity02(string ingredient) // make sure qty and ingredient are both entered in
    {
        if ((Ingredient02TXT.Text != "" && Quantity02TXT.Text != "") || (Ingredient02TXT.Text == "" && Quantity02TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void Ingredient03CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity03(args.Value); // custom validation of ingredient values entered
    }
    private bool checkQuantity03(string ingredient) // make sure qty and ingredient are both entered in
    {
        if ((Ingredient03TXT.Text != "" && Quantity03TXT.Text != "") || (Ingredient03TXT.Text == "" && Quantity03TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void Ingredient04CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity04(args.Value); // custom validation of ingredient values entered
    }
    private bool checkQuantity04(string ingredient) // make sure qty and ingredient are both entered in
    {
        if ((Ingredient04TXT.Text != "" && Quantity04TXT.Text != "") || (Ingredient04TXT.Text == "" && Quantity04TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void Ingredient05CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity05(args.Value); // custom validation of ingredient values entered
    }
    private bool checkQuantity05(string ingredient) // make sure qty and ingredient are both entered in
    {
        if ((Ingredient05TXT.Text != "" && Quantity05TXT.Text != "") || (Ingredient05TXT.Text == "" && Quantity05TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void Ingredient06CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity06(args.Value); // custom validation of ingredient values entered
    }
    private bool checkQuantity06(string ingredient) // make sure qty and ingredient are both entered in
    {
        if ((Ingredient06TXT.Text != "" && Quantity06TXT.Text != "") || (Ingredient06TXT.Text == "" && Quantity06TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void IngredientNameCV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkIngredientName(args.Value); // custom validation of ingredient values entered
    }
    private bool checkIngredientName(string ingredient) // make sure no duplicate ingredient names
    {
        int i = 0;
        if (ingredient == Ingredient01TXT.Text)
            i++;
        if (ingredient == Ingredient02TXT.Text)
            i++;
        if (ingredient == Ingredient03TXT.Text)
            i++;
        if (ingredient == Ingredient04TXT.Text)
            i++;
        if (ingredient == Ingredient05TXT.Text)
            i++;
        if (ingredient == Ingredient06TXT.Text)
            i++;
        if (i > 1) // at least one duplicate exists if true
            return false;
        else
            return true;
    }
    // END CUSTOM VALIDATION CHECKS OF INGREDIENT AND QUANTITY FIELDS
    protected void GridView1_ItemUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            ErrorsLBL.Text = "An error occurrred updating the ingredient. Check to make sure " +
                            "1) you don't have any missing quantities or ingredients, and " +
                            "2) you don't have any duplicate ingredient names.  " +
                             e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            ErrorsLBL.Text = "Another user may have updated that product.  Try again.";
        }
        else
        {
            GridView1.DataBind();
            ErrorsLBL.Text = "Ingredient successfully updated.";
        }
    }
}