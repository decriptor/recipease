using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Meals_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RecipeSDS.SelectParameters["userName"].DefaultValue = User.Identity.Name.ToString(); // get UN
        MealSDS.SelectParameters["rec_owner"].DefaultValue = User.Identity.Name.ToString(); 
        MealSDS.UpdateParameters["meal_timestamp"].DefaultValue = DateTime.Now.ToString(); // get date
        Page.Form.DefaultFocus = mealDateBTN.ClientID; // default textbox focus on page load
        this.Form.DefaultButton = this.addMealBTN.UniqueID; // default button when enter is pressed

        string meal_owner = User.Identity.Name.ToString(); // get UN for query string param
        shoppingListLINK.NavigateUrl = "~/Shopping/index.aspx?meal_owner=" + meal_owner;
    }
    protected void mealDateBTN_Click(object sender, EventArgs e)
    {
        this.mealCalendar.Visible = true;
        ErrorsLBL.Text = "";
        Errors2LBL.Text = "";
    }
    protected void mealCalendar_SelectionChanged(object sender, EventArgs e)
    {
        this.mealDateLBL.Text = this.mealCalendar.SelectedDate.ToString("MM/dd/yyyy (dddd)");
        this.mealCalendar.Visible = false;
    }
    protected void addMealBTN_Click(object sender, EventArgs e) // adds meal data to meal table in db
    {
        try
        {
            // insert form data as a new row in the MEAL table
            MealSDS.InsertParameters["meal_date"].DefaultValue = mealDateLBL.Text;
            MealSDS.InsertParameters["rec_id"].DefaultValue = RecipeDDL.SelectedValue;
            MealSDS.InsertParameters["meal_type"].DefaultValue = mealTypeDDL.SelectedValue.ToString();
            MealSDS.InsertParameters["meal_subtype"].DefaultValue = mealSubTypeDDL.SelectedValue.ToString();
            MealSDS.InsertParameters["meal_owner"].DefaultValue = User.Identity.Name.ToString();
            MealSDS.InsertParameters["meal_timestamp"].DefaultValue = DateTime.Now.ToString();

            // perform actual insert into MEAL table
            MealSDS.Insert();
        }
        catch (Exception ex)
        {
            ErrorsLBL.Text = "An error occurrred adding the meal. Make sure you have specified " +
                            "a meal date & recipe name, and that the meal date & recipe name don't already exist. " +
                            ex.Message;
        }

        // reset forms to default values if insert succeeds
        mealDateLBL.Text = "";
        RecipeDDL.SelectedIndex = -1;
        mealTypeDDL.SelectedIndex = 0;
        mealSubTypeDDL.SelectedIndex = 0;
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            Errors2LBL.Text = "An error occurrred updating your meals. Check to make sure " +
                            "you don't have duplicate recipe names & meal dates. " +
                             e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            Errors2LBL.Text = "Another user may have updated that meal.  Try again.";
        }
        else
        {
            GridView1.DataBind();
            Errors2LBL.Text = "Meal successfully updated.";
        }
    }
}