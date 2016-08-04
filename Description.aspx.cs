using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Description : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString;
        SqlConnection dbConnection = new SqlConnection(ConnectionString);
        try
        {
            dbConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("SELECT * "
                + " FROM Product "
                + " WHERE productNum = "
                + " @productNum", dbConnection);
            sqlCommand.Parameters.Add("@productNum", SqlDbType.NVarChar);
            sqlCommand.Parameters["@productNum"].Value = Request.QueryString["pid"].ToString();
            SqlDataReader productInfo = sqlCommand.ExecuteReader();
            if (productInfo.Read())
            {
                double monies = Convert.ToDouble(productInfo["price"]);
                productName.Text = productInfo["productName"].ToString();
                productDescription.Text = productInfo["productDesc"].ToString();
                productPrice.Text = monies.ToString("C");
            }
            else
            {
                statusL.Text += "Something went wrong. Stallman's slackin!";
            }
            productInfo.Close();
        }
        catch (Exception exc)
        {
            statusL.Text += exc.Message;
        }
        dbConnection.Close();
    }
}