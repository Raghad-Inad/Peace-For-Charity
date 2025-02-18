using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;//رهف
using volunteer.App_Code;

namespace volunteer
{
    public partial class volunteer : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["volunteerConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkAboutUs").Visible = false;
            this.Master.FindControl("linkVolunteer").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;

            if (!Page.IsPostBack)
            {
                populateddlNationality();
                populateddlQualification();
                populateddlgender();
            }
        }
        protected void populateddlNationality()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select nationalityId , nationality from nationality";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlNationality.DataValueField = "nationalityId";
            ddlNationality.DataTextField = "nationality";
            ddlNationality.DataSource = dr;
            ddlNationality.DataBind();

        }
        protected void populateddlQualification()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select qualificationId , qualification from qualification";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlQualification.DataValueField = "qualificationId";
            ddlQualification.DataTextField = "qualification";
            ddlQualification.DataSource = dr;
            ddlQualification.DataBind();

        }
        protected void populateddlgender()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select genderId , gender from gender";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlgender.DataValueField = "genderId";
            ddlgender.DataTextField = "gender";
            ddlgender.DataSource = dr;
            ddlgender.DataBind();

        }


        protected void btnAdd_Click(object sender, EventArgs e)

        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('This account already exists!');</script>");
            }

            else
            {
                try
                {
                    if (ValidateEmpty(txtvolName.Text) || ValidateEmpty(txtvolAge.Text) || ValidateEmpty(txtNationalId.Text) || ValidateEmpty(ddlgender.SelectedValue) || ValidateEmpty(ddlNationality.SelectedValue)|| ValidateEmpty(ddlQualification.SelectedValue))
                    {
                        Response.Write("<script>alert('Please fill all the fields correctly!');</script>");
                    }
                    CRUD myCrud = new CRUD();
                    string mySql = @"insert into volunteer (volName , volAge , pastExperience , note , contact
                            ,nationalId, nationalityId , genderId , qualificationId)
                            values (@volName , @volAge , @pastExperience , @note , @contact , @nationalId ,
                            @nationalityId, @genderId , @qualificationId) ";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@volName ", txtvolName.Text);
                    myPara.Add("@volAge", txtvolAge.Text);
                    myPara.Add("@nationalId", txtNationalId.Text);
                    myPara.Add("@genderId", ddlgender.SelectedValue);
                    myPara.Add("@nationalityId", ddlNationality.SelectedValue);
                    myPara.Add("@qualificationId", ddlQualification.SelectedValue);
                    myPara.Add("@pastExperience", txtpastExperience.Text);
                    myPara.Add("@note", txtnote.Text);
                    myPara.Add("@contact", txtcontact.Text);
                     
                    int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
                    if (rtn >= 1)
                    {
                        lblOutput.Text = " ops seccesful ";

                    }
                    else
                    { lblOutput.Text = " ops faild ! "; }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblOutput.Text = "";
            txtvolName.Text = "";
            txtvolAge.Text = "";
            txtNationalId.Text = "";
            ddlgender.SelectedIndex = 0;
            ddlNationality.SelectedIndex = 0;
            ddlQualification.SelectedIndex = 0; 
            txtpastExperience.Text = "";
            txtnote.Text = "";
            txtcontact.Text = "";

            
        }
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("select * from volunteer where nationalId='" + txtNationalId.Text.Trim() + "';", con);
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
    }//cl
}//ns