using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using volunteer.App_Code;

namespace volunteer
{
    public partial class SignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["volunteerConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkVolunteer").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;

            if (!Page.IsPostBack)
            {

            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('This account already exists!');</script>");
            }

            else
            {
                try
                {
                    if (ValidateEmpty(txtFName.Text) || ValidateEmpty(txtLName.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtPhone.Text) || ValidateEmpty(txtPassword.Text))
                    {
                        Response.Write("<script>alert('Please fill all the fields correctly!');</script>");
                    }
                    MailMessage ms = new MailMessage();
                    ms.From = new MailAddress("appdev4y@gmail.com");
                    ms.To.Add(txtEmail.Text);
                    ms.Subject = "Welcome to Peace For Charity!";
                    ms.Body = "Welcome, We are excites you have joined Peace For Charity family!";
                    SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                    sc.Port = 587;
                    sc.Credentials = new NetworkCredential("appdev4y@gmail.com", "aowhaqeyqiarghyr");
                    sc.EnableSsl = true;
                    sc.Send(ms);
                    signUpNewMember();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                } 


            } 

        }

        //Check This account already exists
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from SignUp where userEmail='" + txtEmail.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool ValidateEmpty(string empty)
        {
            if (empty == "")
            {
                return true;
            }
            else
            {
                return false;

            }
        }

        void signUpNewMember()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert into SignUp(fName, lName, userPhone, userEmail, userPassword)
                    values(@fName, @lName, @userPhone, @userEmail, @userPassword)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@fName", txtFName.Text);
            myPara.Add("@lName", txtLName.Text);
            myPara.Add("@userPhone", txtPhone.Text);
            myPara.Add("@userEmail", txtEmail.Text);
            myPara.Add("@userPassword", txtPassword.Text);
            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                Session["role"] = "SignUp";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                "alert('Thank you for Signing Up with Peace For Charity family');window.location ='Home.aspx';", true);

            }
           
            else
            {
                Response.Write("<script>alert('Please try again!');</script>");
            }
            
           
        }
        
    }
    }