using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace volunteer.Account
{
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["volunteerConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkVolunteer").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
         

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from admin where adminEmail='" + txtEmail.Text.Trim() + "' AND adminPassword='" + txtPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["adminEmail"] = dr.GetValue(1).ToString();
                        Session["adminPassword"] = dr.GetValue(2).ToString();
                        Session["role"] = "admin";
                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }
            catch (Exception ex)
            {
                //
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from SignUp where userEmail='" + txtEmail.Text.Trim() + "' AND userPassword='" + txtPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["userEmail"] = dr.GetValue(4).ToString();
                        Session["fName"] = dr.GetValue(1).ToString();
                        Session["userPassword"] = dr.GetValue(3).ToString();
                        Session["role"] = "SignUp";
                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    //
                }
            }
            catch (Exception ex)
            {
                //
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
       
    }//cl

}//ns