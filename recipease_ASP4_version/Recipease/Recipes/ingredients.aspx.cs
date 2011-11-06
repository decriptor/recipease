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

    }

    public static string GetNumberDisplay(object value) // removes any trailing zeros
    {
        string number = value.ToString();
        number = number.TrimEnd("0".ToCharArray());
        number = number.TrimEnd(".".ToCharArray());

        return number;
    }
    protected void AddIngredientsBTN_CLICK(object sender, EventArgs e)
    {
        try 
        {
            // add more ingredients to the selected recipe
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
                SqlCommand insert01 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert02 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert03 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert04 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert05 = new SqlCommand("insert_MORE_RECIPES", myConnection);
                SqlCommand insert06 = new SqlCommand("insert_MORE_RECIPES", myConnection);

                //3. set up sprocs with proper values and execute!
                if (Ingredient01TXT.Text != "Ingredient" && Ingredient01TXT.Text != "")
                {
                    insert01.CommandType = CommandType.StoredProcedure;
                    insert01.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert01.Parameters.AddWithValue("@ing_name", Ingredient01TXT.Text);
                    insert01.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity01TXT.Text));
                    insert01.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.AddWithValue("@unit_name", Amount01DDL.SelectedValue);
                    insert01.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient02TXT.Text != "Ingredient" && Ingredient02TXT.Text != "")
                {
                    insert02.CommandType = CommandType.StoredProcedure;
                    insert02.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert02.Parameters.AddWithValue("@ing_name", Ingredient02TXT.Text);
                    insert02.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity02TXT.Text));
                    insert02.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount02DDL.SelectedValue));
                    insert02.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient03TXT.Text != "Ingredient" && Ingredient03TXT.Text != "")
                {
                    insert03.CommandType = CommandType.StoredProcedure;
                    insert03.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert03.Parameters.AddWithValue("@ing_name", Ingredient03TXT.Text);
                    insert03.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity03TXT.Text));
                    insert03.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount03DDL.SelectedValue));
                    insert03.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient04TXT.Text != "Ingredient" && Ingredient04TXT.Text != "")
                {
                    insert04.CommandType = CommandType.StoredProcedure;
                    insert04.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert04.Parameters.AddWithValue("@ing_name", Ingredient04TXT.Text);
                    insert04.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity04TXT.Text));
                    insert04.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount04DDL.SelectedValue));
                    insert04.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient05TXT.Text != "Ingredient" && Ingredient05TXT.Text != "")
                {
                    insert05.CommandType = CommandType.StoredProcedure;
                    insert05.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                    insert05.Parameters.AddWithValue("@ing_name", Ingredient05TXT.Text);
                    insert05.Parameters.AddWithValue("@rec_ing_quantity", Convert.ToDecimal(Quantity05TXT.Text));
                    insert05.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.AddWithValue("@unit_name", Convert.ToString(Amount05DDL.SelectedValue));
                    insert05.ExecuteNonQuery(); //execute the sproc
                }

                if (Ingredient06TXT.Text != "Ingredient" && Ingredient06TXT.Text != "")
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
            ErrorsLBL.Text = "An exception occurrred adding the recipe. " + ex.Message;
        }

        // page refresh to update data sources
        Response.Redirect("~/Recipes/ingredients.aspx?rec_id=" + Request.QueryString["rec_id"] + "&rec_name=" + Request.QueryString["rec_name"]);
    }
    
    protected void ResetIngredientsBTN_CLICK(object sender, EventArgs e)
    {
        // reset stuff to default values
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
    }
}