using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Game : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ShowWinNums_Click(object sender, EventArgs e)
    {
        int match = 0;
        int inARow = 0;

        int user1 = Convert.ToInt16(UserFirstNum.SelectedValue);
        int user2 = Convert.ToInt16(UserSecondNum.SelectedValue);
        int user3 = Convert.ToInt16(UserThirdNum.SelectedValue);

        if (user1 == 0 || user2 == 0 || user3 == 0)
        {
            noValues.Visible = true;
            noValues.Text = "Please enter your numbers!";
        }
        else
        {
            CompsNums.Visible = true;
            noValues.Visible = false;
            winningsLabels.Visible = true;
        }

        Random rdm = new Random();
        int comp1 = rdm.Next(1, 5);
        int comp2 = rdm.Next(1, 5);
        int comp3 = rdm.Next(1, 5);

        CompFirstNum.Visible = true;
        CompSecondNum.Visible = true;
        CompThirdNum.Visible = true;

        CompFirstNum.Text = "Stallman's First Number: " + Convert.ToString(comp1);
        CompSecondNum.Text = "Stallman's Second Number: " + Convert.ToString(comp2);
        CompThirdNum.Text = "Stallman's Third Number: " + Convert.ToString(comp3);

        if (user1 == comp1)
        {
            match++;
            inARow++;
            user1 = 0;
            comp1 = -1;
        }
        if (user1 == comp2)
        {
            match++;
            user1 = 0;
            comp2 = -1;
        }
        if (user1 == comp3)
        {
            match++;
            user1 = 0;
            comp3 = -1;
        }

        //User's second guess
        if (user2 == comp1)
        {
            match++;
            user2 = 0;
            comp1 = -1;
        }
        if (user2 == comp2)
        {
            match++;
            inARow++;
            user2 = 0;
            comp2 = -1;
        }
        if (user2 == comp3)
        {
            match++;
            user2 = 0;
            comp3 = -1;
        }

        //User's third guess
        if (user3 == comp1)
        {
            match++;
            user3 = 0;
            comp1 = -1;
        }
        if (user3 == comp2)
        {
            match++;
            user3 = 0;
            comp2 = -1;
        }
        if (user3 == comp3)
        {
            match++;
            inARow++;
            user3 = 0;
            comp3 = -1;
        }

        /*********************************
         ********** PAYOUTS AND **********
         ********** END OF GAME **********
         *********************************/

        //Check to see if 3 matches are in order or our of order
        if (match == 3)
        {
            if (inARow == 3) //In order
            {
                matches.Text = String.Format("You made {0} matches in order!", match);
                winnings.Text = String.Format("You win a FREE item from our store!");
            }
            else //Out of order
            {
                matches.Text = String.Format("You made {0} matches!!", match);
                winnings.Text = String.Format("You win $5 off your next purchase!");
            }
        }
        else if (match == 2) //2 matches
        {
            matches.Text = String.Format("You made {0} matches!!", match);
            winnings.Text = String.Format("You win $1 off your next purchase!");
        }
        else if (match == 1) //1 match
        {
            matches.Text = String.Format("You made {0} match!!", match);
            winnings.Text = String.Format("You win... 1 cent off your next purchase! Yup, seriously.");
        }
        else //No matches
        {
            matches.Text = String.Format("Sorry, you didn't make any matches!");
            winnings.Text = String.Format("Stallman is not impressed.");
        }
    }
}
