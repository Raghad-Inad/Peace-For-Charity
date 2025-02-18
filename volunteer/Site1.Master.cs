using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace volunteer
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                if (Session["role"] == null)
                {
                    linkLogIn.Visible = true; // user login link button
                    linkSignup.Visible = true; // sign up link button

                    linkLogout.Visible = false; // logout link button
                   


                    //lbtnAdminLogin.Visible = true; // admin login link button
                }
                else if (Session["role"].Equals("SignUp"))
                {
                    linkLogIn.Visible = false; // user login link button
                    linkSignup.Visible = false; // sign up link button

                    linkVolunteer.Visible = true;


                    linkLogout.Visible = true; // logout link button
                   
                }

                else if (Session["role"].Equals("admin"))
                {
                    linkLogIn.Visible = false; // user login link button
                    linkSignup.Visible = false; // sign up link button

                    linkVolunteer.Visible = false;
                   

                    linkLogout.Visible = true; // logout link button



                    linkManage.Visible = true; // admin management link button
                    linkManagment.Visible = true; 
                }
            }
            catch (Exception ex)
            {
                //
            }
        }
        protected void linkManagement_Click(object sender, EventArgs e)
        {
            Response.Redirect("Managment.aspx");  
        }

        protected void linkLogIn_Click(object sender, EventArgs e)

    
        {
            Response.Redirect("Login.aspx");  
        }


        protected void linkVolunteer_Click(object sender, EventArgs e)


        {
            Response.Redirect("volunteer.aspx");
        }
        protected void linkSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx"); 
        }

        protected void linkLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            //Session["role"] = "";
            Session["role"] = null;
            Session["status"] = "";

            linkManage.Visible = false; // manage link button
            linkLogIn.Visible = true; // user login link button
            linkSignup.Visible = true; // sign up link button

            linkLogout.Visible = false; // logout link button
           
            
            Response.Redirect("Home.aspx");


        }

        protected void linkManage_Click(object sender, EventArgs e)
        {
            linkManagment.Focus(); 
        }


    }
}