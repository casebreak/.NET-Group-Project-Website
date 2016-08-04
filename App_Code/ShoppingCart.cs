using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    private SqlConnection dbConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["BenNotStallman"].ConnectionString);

    private ArrayList productID = new ArrayList();
    private ArrayList productQuantity = new ArrayList();
    //private ArrayList productTable = new ArrayList();
    public int quantity;

    public void addItem(string prodID)
    {
        foreach (string item in productID)
        {
            //if (item == prodID)
            //{
            //    //productID.Add(prodID);
            //    productQuantity.Add(1);
            //    //quantity = addQty(prodID);     MISTAKES WERE MADE!!!!!!!!
            //}
            //else
            //{
            //    productID.Add(prodID);
            //    productQuantity.Add(1);
            //}
        }
        productID.Add(prodID);
        productQuantity.Add(1);
        
        //productTable.Add(table);

        //return true;
    }

    public string showCart()
    {
        double total = 0;
        //Build table structure
        string retValue = "<Table class='retTable' ID='ProductGrid' runat='server' width='100%'>";
        retValue += "<tr><th class='tHeader'>Remove</th>";
        retValue += "<th class='tHeader'>Product</th><th class='tHeader'>Quantity</th><th class='tHeader'>Price Each</th><th class='tHeader'>Total for Item</th></tr>";
        for (int i = 0; i < productID.Count; i++)
        {
            string sqlString = "SELECT productNum, productName, price "
                + " FROM product "
                + " WHERE productNum = @productID;";
            //return i.ToString() + productID[i].ToString();

            using (SqlCommand prodCommand = new SqlCommand(sqlString, dbConnection))
            {
                if (productID[i] == null)
                {
                    retValue = "I hit a null!!!";
                }
                else
                {
                    prodCommand.Parameters.Add("@productID", SqlDbType.VarChar);
                    prodCommand.Parameters["@productID"].Value = productID[i];
                }
                using (SqlDataReader prodRecords = prodCommand.ExecuteReader())
                {
                    if (prodRecords.Read())
                    {
                        double foo = Convert.ToDouble(productQuantity[i]);
                        double bar = Convert.ToDouble(prodRecords["price"]);
                        //double frustration = Convert.ToDouble(prodRecords["price"]);
                        double totPrice = (foo * bar);
                        //Adds the 'Remove' link to the table
                        retValue += "<tr><td><a class='tableLink' href='Shopping_Cart.aspx?operation=removeItem&productID=" + productID[i] + "'>Remove</a></td>";
                        retValue += "<td>" + prodRecords["productName"] + "</td>"
                            + "<td>" + productQuantity[i] + "</td>"
                            + "<td>" + bar.ToString("C") + "</td>"
                            + "<td>" + totPrice.ToString("C") + "</td>";
                        retValue += "</tr>";
                        total += totPrice;
                    }
                }
            }
        }
        //This section displays the 'order summary' portion including total price
        retValue += "<td><a class='tableLink' href='Shopping_Cart.aspx?operation=emptyCart'>Empty Cart</a></td>";
        retValue += "<tr><td colspan='2'><string>Your shopping cart contains "
            + productQuantity.Count + " product(s)."
            + "</strong></td>"
            + "<td>Total: " + String.Format("{0:c}", total) + "</td>"
            + "</tr>";
        //This section adds the 'Empty Cart' link to the bottom of the table        
        retValue += "</Table>";
        retValue += "&nbsp;<a style='color: #FF9D39;' class='tableLink' href='Shop.aspx'>Back to Shop</a>";     
        return retValue;
    }

    //public int addQty(string ID)
    //{
    //    for (int i = 0; i < productID.Count; i++)
    //    {
    //        quantity = Convert.ToInt16(productQuantity[i]);
    //        quantity++;
    //    }
    //    return quantity;
    //}

    public void removeItem(string prodID)
    {
        for (int i = 0; i < productID.Count; i++)
        {
            if (productID[i].ToString() == prodID)
            {
                productID.RemoveAt(i);
                productQuantity.RemoveAt(i);
                //productTable.RemoveAt(i);
                break;
            }
        }
    }

    public void emptyCart(string prodID)
    {
        productID.Clear();
        productQuantity.Clear();
        //productTable.Clear();
    }

    public ShoppingCart()
    {
        try
        {
            dbConnection.Open();
        }
        catch (Exception)
        {
            throw;
        }
    }

    ~ShoppingCart()
    {
        dbConnection.Close();
    }
}