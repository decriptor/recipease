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

public partial class Pantry_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PantrySDS.SelectParameters["rec_owner"].DefaultValue = User.Identity.Name.ToString(); // get UN
        PantrySDS.UpdateParameters["pantry_date"].DefaultValue = DateTime.Now.ToString(); // get date;
        Page.Form.DefaultFocus = Quantity01TXT.ClientID; // default textbox focus on page load
        this.Form.DefaultButton = this.AddPantryItemsBTN.UniqueID; // default button when enter is pressed
    }

    protected void AddPantryItemsBTN_CLICK(object sender, EventArgs e)
    {
        string rec_owner = User.Identity.Name.ToString();
        string pantry_date = DateTime.Now.ToString();

        try
        {
            Page.Validate();
            if (Page.IsValid == true)
            {
                // add more pantry items to the selected recipe
                /*** INSERT QUERIES START ***/

                // 1.  open the Connection object for the context
                SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["INFO3420_12ConnectionString"].ConnectionString);
                myConnection.Open();

                // 2.  create new sql command object to write to the database
                SqlCommand insert01 = new SqlCommand("insert_into_RECIPE_PANTRY", myConnection);
                SqlCommand insert02 = new SqlCommand("insert_into_RECIPE_PANTRY", myConnection);
                SqlCommand insert03 = new SqlCommand("insert_into_RECIPE_PANTRY", myConnection);
                SqlCommand insert04 = new SqlCommand("insert_into_RECIPE_PANTRY", myConnection);
                SqlCommand insert05 = new SqlCommand("insert_into_RECIPE_PANTRY", myConnection);
                SqlCommand insert06 = new SqlCommand("insert_into_RECIPE_PANTRY", myConnection);

                //3. set up sprocs with proper values and execute!
                if (PantryItem01TXT.Text != "" && Quantity01TXT.Text != "")
                {
                    insert01.CommandType = CommandType.StoredProcedure;
                    insert01.Parameters.AddWithValue("@rec_owner", rec_owner);
                    insert01.Parameters.AddWithValue("@pantry_item", PantryItem01TXT.Text);
                    insert01.Parameters.AddWithValue("@pantry_item_quantity", Convert.ToDecimal(Quantity01TXT.Text));
                    insert01.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.AddWithValue("@unit_name", Amount01DDL.SelectedValue);
                    insert01.Parameters.Add("@pantry_type_id", SqlDbType.Int).Value = 0;
                    insert01.Parameters.AddWithValue("@pantry_type_name", PantryType01DDL.SelectedValue);
                    insert01.Parameters.AddWithValue("@pantry_date", pantry_date);
                    insert01.ExecuteNonQuery(); //execute the sproc
                }

                if (PantryItem02TXT.Text != "" && Quantity02TXT.Text != "")
                {
                    insert02.CommandType = CommandType.StoredProcedure;
                    insert02.Parameters.AddWithValue("@rec_owner", rec_owner);
                    insert02.Parameters.AddWithValue("@pantry_item", PantryItem02TXT.Text);
                    insert02.Parameters.AddWithValue("@pantry_item_quantity", Convert.ToDecimal(Quantity02TXT.Text));
                    insert02.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.AddWithValue("@unit_name", Amount02DDL.SelectedValue);
                    insert02.Parameters.Add("@pantry_type_id", SqlDbType.Int).Value = 0;
                    insert02.Parameters.AddWithValue("@pantry_type_name", PantryType02DDL.SelectedValue);
                    insert02.Parameters.AddWithValue("@pantry_date", pantry_date);
                    insert02.ExecuteNonQuery(); //execute the sproc
                }

                if (PantryItem03TXT.Text != "" && Quantity03TXT.Text != "")
                {
                    insert03.CommandType = CommandType.StoredProcedure;
                    insert03.Parameters.AddWithValue("@rec_owner", rec_owner);
                    insert03.Parameters.AddWithValue("@pantry_item", PantryItem03TXT.Text);
                    insert03.Parameters.AddWithValue("@pantry_item_quantity", Convert.ToDecimal(Quantity03TXT.Text));
                    insert03.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.AddWithValue("@unit_name", Amount03DDL.SelectedValue);
                    insert03.Parameters.Add("@pantry_type_id", SqlDbType.Int).Value = 0;
                    insert03.Parameters.AddWithValue("@pantry_type_name", PantryType03DDL.SelectedValue);
                    insert03.Parameters.AddWithValue("@pantry_date", pantry_date);
                    insert03.ExecuteNonQuery(); //execute the sproc
                }

                if (PantryItem04TXT.Text != "" && Quantity04TXT.Text != "")
                {
                    insert04.CommandType = CommandType.StoredProcedure;
                    insert04.Parameters.AddWithValue("@rec_owner", rec_owner);
                    insert04.Parameters.AddWithValue("@pantry_item", PantryItem04TXT.Text);
                    insert04.Parameters.AddWithValue("@pantry_item_quantity", Convert.ToDecimal(Quantity04TXT.Text));
                    insert04.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.AddWithValue("@unit_name", Amount04DDL.SelectedValue);
                    insert04.Parameters.Add("@pantry_type_id", SqlDbType.Int).Value = 0;
                    insert04.Parameters.AddWithValue("@pantry_type_name", PantryType04DDL.SelectedValue);
                    insert04.Parameters.AddWithValue("@pantry_date", pantry_date);
                    insert04.ExecuteNonQuery(); //execute the sproc
                }

                if (PantryItem05TXT.Text != "" && Quantity05TXT.Text != "")
                {
                    insert05.CommandType = CommandType.StoredProcedure;
                    insert05.Parameters.AddWithValue("@rec_owner", rec_owner);
                    insert05.Parameters.AddWithValue("@pantry_item", PantryItem05TXT.Text);
                    insert05.Parameters.AddWithValue("@pantry_item_quantity", Convert.ToDecimal(Quantity05TXT.Text));
                    insert05.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.AddWithValue("@unit_name", Amount05DDL.SelectedValue);
                    insert05.Parameters.Add("@pantry_type_id", SqlDbType.Int).Value = 0;
                    insert05.Parameters.AddWithValue("@pantry_type_name", PantryType05DDL.SelectedValue);
                    insert05.Parameters.AddWithValue("@pantry_date", pantry_date);
                    insert05.ExecuteNonQuery(); //execute the sproc
                }

                if (PantryItem06TXT.Text != "" && Quantity06TXT.Text != "")
                {
                    insert06.CommandType = CommandType.StoredProcedure;
                    insert06.Parameters.AddWithValue("@rec_owner", rec_owner);
                    insert06.Parameters.AddWithValue("@pantry_item", PantryItem06TXT.Text);
                    insert06.Parameters.AddWithValue("@pantry_item_quantity", Convert.ToDecimal(Quantity06TXT.Text));
                    insert06.Parameters.Add("@unit_id", SqlDbType.Int).Value = 0;
                    insert06.Parameters.AddWithValue("@unit_name", Amount06DDL.SelectedValue);
                    insert06.Parameters.Add("@pantry_type_id", SqlDbType.Int).Value = 0;
                    insert06.Parameters.AddWithValue("@pantry_type_name", PantryType06DDL.SelectedValue);
                    insert06.Parameters.AddWithValue("@pantry_date", pantry_date);
                    insert06.ExecuteNonQuery(); //execute the sproc
                }

                // 4.  close the Connection object for the context
                myConnection.Close();
            }
        }
        catch (Exception ex)
        {
            ErrorsLBL.Text = "An error occurrred adding the pantry items. Check to make sure " +
                            "1) you don't have any missing quantities or pantry items, and " +
                            "2) you don't have any duplicate pantry item names  " +
                            ex.Message;
        }

        if (Page.IsValid)
        {
            // page refresh to update data sources if inserts succeed
            Response.Redirect("~/Pantry/index.aspx");
        }
    }

    protected void ResetPantryItemsBTN_CLICK(object sender, EventArgs e)
    {
        // reset stuff to default values
        PantryItem01TXT.Text = "";
        PantryItem01TXT.Text = "";
        PantryItem02TXT.Text = "";
        PantryItem03TXT.Text = "";
        PantryItem04TXT.Text = "";
        PantryItem05TXT.Text = "";
        PantryItem06TXT.Text = "";
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

    // BEGIN CUSTOM VALIDATION CHECKS OF PANTRY ITEM AND QUANTITY FIELDS
    protected void PantryItem01CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity01(args.Value); // custom validation of pantry item values entered
    }
    private bool checkQuantity01(string pantryItem) // make sure qty and pantry item are both entered in
    {
        if ((PantryItem01TXT.Text != "" && Quantity01TXT.Text != "") || (PantryItem01TXT.Text == "" && Quantity01TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void PantryItem02CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity02(args.Value); // custom validation of pantry item values entered
    }
    private bool checkQuantity02(string pantryItem) // make sure qty and pantry item are both entered in
    {
        if ((PantryItem02TXT.Text != "" && Quantity02TXT.Text != "") || (PantryItem02TXT.Text == "" && Quantity02TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void PantryItem03CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity03(args.Value); // custom validation of pantry item values entered
    }
    private bool checkQuantity03(string pantryItem) // make sure qty and pantry item are both entered in
    {
        if ((PantryItem03TXT.Text != "" && Quantity03TXT.Text != "") || (PantryItem03TXT.Text == "" && Quantity03TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void PantryItem04CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity04(args.Value); // custom validation of pantry item values entered
    }
    private bool checkQuantity04(string pantryItem) // make sure qty and pantry item are both entered in
    {
        if ((PantryItem04TXT.Text != "" && Quantity04TXT.Text != "") || (PantryItem04TXT.Text == "" && Quantity04TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void PantryItem05CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity05(args.Value); // custom validation of pantry item values entered
    }
    private bool checkQuantity05(string pantryItem) // make sure qty and pantry item are both entered in
    {
        if ((PantryItem05TXT.Text != "" && Quantity05TXT.Text != "") || (PantryItem05TXT.Text == "" && Quantity05TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void PantryItem06CV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkQuantity06(args.Value); // custom validation of pantry item values entered
    }
    private bool checkQuantity06(string pantryItem) // make sure qty and pantry item are both entered in
    {
        if ((PantryItem06TXT.Text != "" && Quantity06TXT.Text != "") || (PantryItem06TXT.Text == "" && Quantity06TXT.Text == ""))
            return true;
        else
            return false;
    }

    protected void PantryItemNameCV_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = checkPantryItemName(args.Value); // custom validation of pantry item values entered
    }
    private bool checkPantryItemName(string PantryItem) // make sure no duplicate pantry item names
    {
        int i = 0;
        if (PantryItem == PantryItem01TXT.Text)
            i++;
        if (PantryItem == PantryItem02TXT.Text)
            i++;
        if (PantryItem == PantryItem03TXT.Text)
            i++;
        if (PantryItem == PantryItem04TXT.Text)
            i++;
        if (PantryItem == PantryItem05TXT.Text)
            i++;
        if (PantryItem == PantryItem06TXT.Text)
            i++;
        if (i > 1) // at least one duplicate exists if true
            return false;
        else
            return true;
    }
    // END CUSTOM VALIDATION CHECKS OF PANTRY ITEM AND QUANTITY FIELDS
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            ErrorsLBL.Text = "An error occurrred updating the pantry item. Check to make sure " +
                            "1) you don't have any missing quantities or pantry items, and " +
                            "2) you don't have any duplicate pantry item names.  " +
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
            ErrorsLBL.Text = "Pantry item successfully updated.";
        }
    }
}