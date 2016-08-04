using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string currentUrl = HttpContext.Current.Request.Url.LocalPath;

        if(currentUrl.EndsWith("Game.aspx") || currentUrl.EndsWith("/"))
        {
            Lotto.Attributes["class"] = "active";
        }

        if (currentUrl.EndsWith("Contact.aspx") || currentUrl.EndsWith("/"))
        {
            Contact.Attributes["class"] = "active";
        }

        if (currentUrl.EndsWith("AboutUs.aspx") || currentUrl.EndsWith("/"))
        {
            About.Attributes["class"] = "active";
        }

        if (currentUrl.EndsWith("Shop.aspx") || currentUrl.EndsWith("/"))
        {
            Shop.Attributes["class"] = "active";
        }
    }
}
