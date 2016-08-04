using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shopping_Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShoppingCart curCart;
        try
        {
            if (Session["savedCart"] != null)
            {
                curCart = (ShoppingCart)Session["savedCart"];
                if (Request.QueryString["operation"] == "removeItem")
                {
                    curCart.removeItem(Request.QueryString["productID"]);
                    Response.Redirect("Shopping_Cart.aspx");
                }
                else if (Request.QueryString["operation"] == "emptyCart")
                {
                    curCart.emptyCart(Request.QueryString["productID"]);
                    Response.Redirect("Shopping_Cart.aspx");
                }
                else
                {
                    string retString = curCart.showCart();
                    CartBody.Text = retString;
                }
                //CartBody.Text += curCart.showCart();
            }
            else
            {
                CartBody.Text = "<p>Your shopping cart is empty!</p>";
                //curCart = new ShoppingCart();
                //CartBody.Text += curCart.showCart();
            }
        }
        catch (Exception er)
        {
            CartBody.Text = "<p>Could not instantiate a shopping cart.</p>";
            CartBody.Text += er.Message;
        }
    }
}