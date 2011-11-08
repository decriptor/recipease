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

public partial class Recipes_tags : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = this.AddTagsBTN.UniqueID; // default button when enter is pressed
    }

    protected void AddTagsBTN_Click(object sender, EventArgs e) // adds recipe data to various tables in db
    {
        // loop through items in the TAG list box and insert user-selected values into the TAG table
        foreach (ListItem item in TagsLBX.Items)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["INFO3420_12ConnectionString"].ConnectionString);
            myConnection.Open();

            if (item.Selected)
            {
                SqlCommand insertTAG = new SqlCommand("insert_MORE_TAGS", myConnection);
                insertTAG.CommandType = CommandType.StoredProcedure;
                insertTAG.Parameters.Add("@rec_id", SqlDbType.Int).Value = Request.QueryString["rec_id"];
                insertTAG.Parameters.Add("@tag_id", SqlDbType.Int).Value = 0;
                insertTAG.Parameters.AddWithValue("@tag_name", item.Text);
                insertTAG.ExecuteNonQuery(); //execute the sproc
            }

            myConnection.Close();
        }
        // page refresh to update data sources
        Response.Redirect("~/Recipes/tags.aspx?rec_id=" + Request.QueryString["rec_id"] + "&rec_name=" + Request.QueryString["rec_name"]);
    }

    protected void ResetTagsBTN_Click(object sender, EventArgs e)
    {
        // reset stuff to default values
        TagsLBX.SelectedIndex = -1;
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // page refresh to update data sources
        Response.Redirect("~/Recipes/tags.aspx?rec_id=" + Request.QueryString["rec_id"] + "&rec_name=" + Request.QueryString["rec_name"]);
    }
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        // page refresh to update data sources
        Response.Redirect("~/Recipes/tags.aspx?rec_id=" + Request.QueryString["rec_id"] + "&rec_name=" + Request.QueryString["rec_name"]);
    }
}