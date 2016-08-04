using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Shop : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString;
                string sqlQuery = "SELECT productNum, productName, productDesc, color, price "
                    + " FROM Product; ";
                SqlDataAdapter productRecords = new SqlDataAdapter(sqlQuery, ConnectionString);
                DataSet ds = new DataSet();
                productRecords.Fill(ds);
                DataView source = new DataView(ds.Tables[0]);
                ProductsGrid.DataSource = source;
                ProductsGrid.DataBind();
            }
            catch (Exception exc)
            {
                statusLabel.Text += exc.Message;

            }
        }
    }

    protected void searchButton_OnClick(object sender, EventArgs e)
    {
        try
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString;
            statusLabel.Text = "Searching for " + searchTerm.Text;
            string sqlQuery = "SELECT productNum, productName, productDesc, color, price "
                + " FROM Product "
                + " WHERE 1=2";

            string[] searchTerms = searchTerm.Text.Replace(';', ' ').Replace("'", "").Split(' ');

            foreach (string term in searchTerms)
            {
                sqlQuery += " OR productNum like '%" + term + "%' "
                    + " OR productName like '%" + term + "%' "
                    + " OR color like '%" + term + "%' "
                    + " OR productDesc like '%" + term + "%' "
                    + " OR price like '%" + term + "%' ";
            }
            SqlDataAdapter productRecords = new SqlDataAdapter(sqlQuery, ConnectionString);
            DataSet ds = new DataSet();
            productRecords.Fill(ds);
            DataView source = new DataView(ds.Tables[0]);
            ProductsGrid.DataSource = source;
            ProductsGrid.DataBind();
        }
        catch (Exception exc)
        {
            statusLabel.Text = exc.Message;
        }
    }

    protected void ProductsGrid_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (searchTerm.Text == null) //This triggers if no search terms are entered
        {
            string sortExpression = e.SortExpression;
            string direction = string.Empty;

            if (SortDirection == SortDirection.Ascending)
            {
                SortDirection = SortDirection.Descending;
                direction = " DESC";
            }
            else
            {
                SortDirection = SortDirection.Ascending;
                direction = " ASC";
            }

            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString;
                string sqlQuery = "SELECT productNum, productName, productDesc, color, price "
                    + " FROM Product "
                    + " ORDER BY " + sortExpression + " " + direction;
                SqlDataAdapter productRecords = new SqlDataAdapter(sqlQuery, ConnectionString);
                DataSet ds = new DataSet();
                productRecords.Fill(ds);
                DataView source = new DataView(ds.Tables[0]);
                ProductsGrid.DataSource = source;
                ProductsGrid.DataBind();
            }
            catch (Exception exc)
            {
                statusLabel.Text = exc.Message;
            }
        }
        else  //Keeps search query while allowing sorting
        {
            string sortExpression = e.SortExpression;
            string direction = string.Empty;

            if (SortDirection == SortDirection.Ascending)
            {
                SortDirection = SortDirection.Descending;
                direction = " DESC";
            }
            else
            {
                SortDirection = SortDirection.Ascending;
                direction = " ASC";
            }

            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString;
                string sqlQuery = "SELECT productNum, productName, productDesc, color, price "
                    + " FROM Product "
                    + " WHERE 1=2";

                string[] searchTerms = searchTerm.Text.Replace(';', ' ').Replace("'", "").Split(' ');

                foreach (string term in searchTerms)
                {
                    sqlQuery += " OR productNum like '%" + term + "%' "
                        + " OR productName like '%" + term + "%' "
                        + " OR color like '%" + term + "%' "
                        + " OR productDesc like '%" + term + "%' "
                        + " OR price like '%" + term + "%' ";
                }
                sqlQuery += " ORDER BY " + sortExpression + " " + direction;
                SqlDataAdapter productRecords = new SqlDataAdapter(sqlQuery, ConnectionString);
                DataSet ds = new DataSet();
                productRecords.Fill(ds);
                DataView source = new DataView(ds.Tables[0]);
                ProductsGrid.DataSource = source;
                ProductsGrid.DataBind();
            }
            catch (Exception exc)
            {
                statusLabel.Text = exc.Message;
            }
        }
    }

    public SortDirection SortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
            {
                ViewState["SortDirection"] = SortDirection.Ascending;
            }
            return (SortDirection)ViewState["SortDirection"];
        }
        set
        {
            ViewState["SortDirection"] = value;
        }
    }

    protected void ProductGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShoppingCart curCart;
        if (Session["savedCart"] == null)
        {
            curCart = new ShoppingCart();
        }
        else
        {
            curCart = (ShoppingCart)Session["savedCart"];
        }
        string foo = ProductsGrid.SelectedValue.ToString();
        //bool addResult = 
        curCart.addItem(foo);
        //if (addResult == false)
        //{
            //ProductPage.Text = "Already selected";
        //}
        //else
        //{
            Session["savedCart"] = curCart;
            Response.Redirect("shopping_cart.aspx");
        //}
    }
}