using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using volunteer.App_Code;

namespace volunteer
{
    public partial class Managment : System.Web.UI.Page
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
        protected void populategvVolunteer()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"SELECT volunteer.volunteerId, volunteer.nationalId, volunteer.volName, volunteer.volAge,
                         volunteer.pastExperience, volunteer.note, volunteer.contact, gender.gender,
                         nationality.nationality, qualification.qualification
                         FROM gender INNER JOIN
                         volunteer ON gender.genderId = volunteer.genderId INNER JOIN
                         nationality ON volunteer.nationalityId = nationality.nationalityId INNER JOIN
                         qualification ON volunteer.qualificationId = qualification.qualificationId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvVolunteer.DataSource = dr;
            gvVolunteer.DataBind();

        }

        protected void btnGridView_Click(object sender, EventArgs e)
        {
            populategvVolunteer();
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
                    if (ValidateEmpty(txtvolName.Text) || ValidateEmpty(txtvolAge.Text) || ValidateEmpty(txtNationalId.Text) || ValidateEmpty(ddlgender.SelectedValue) || ValidateEmpty(ddlNationality.SelectedValue) || ValidateEmpty(ddlQualification.SelectedValue))
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

        protected void GetvolunteerData(object sender, EventArgs e)
        {
            LinkButton mySender = sender as LinkButton;
            int intvolunteerId = int.Parse(mySender.Text);
            lblOutput.Text = intvolunteerId.ToString();

            CRUD myCrud = new CRUD();
            string mySql = @" select * from volunteer where volunteerId = @volunteerId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@volunteerId ", intvolunteerId);
            myPara.Add("@volName ", txtvolName.Text);
            myPara.Add("@volAge", txtvolAge.Text);
            myPara.Add("@nationalId", txtNationalId.Text);
            myPara.Add("@genderId", ddlgender.SelectedValue);
            myPara.Add("@nationalityId", ddlNationality.SelectedValue);
            myPara.Add("@qualificationId", ddlQualification.SelectedValue);
            myPara.Add("@pastExperience", txtpastExperience.Text);
            myPara.Add("@note", txtnote.Text);
            myPara.Add("@contact", txtcontact.Text); 

            SqlDataReader dr = myCrud.getDrPassSqlDic(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Session["volunteerId"] = int.Parse(dr["volunteerId"].ToString());
                    txtvolName.Text = dr["volName"].ToString();
                    txtvolAge.Text = dr["volAge"].ToString(); 
                    txtNationalId.Text = dr["nationalId"].ToString();
                    ddlgender.SelectedValue = dr["genderId"].ToString();
                    ddlNationality.SelectedValue = dr["nationalityId"].ToString();
                    ddlQualification.SelectedValue = dr["qualificationId"].ToString();
                    txtpastExperience.Text = dr["pastExperience"].ToString();
                    txtnote.Text = dr["note"].ToString();
                    txtcontact.Text = dr["contact"].ToString();

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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @" update volunteer set volName=@volName , volAge=@volAge , pastExperience=@pastExperience ,
                              note=@note,contact=@contact, nationalId=@nationalId , nationalityId=@nationalityId,
                              genderId=@genderId, qualificationId=@qualificationId
                              where volunteerId = @volunteerId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@volunteerId ", Session["volunteerId"]);
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
                populategvVolunteer();

            }
            else
            { lblOutput.Text = " ops faild ! "; }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @" delete from volunteer 
                            where volunteerId = @volunteerId ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@volunteerId ", Session["volunteerId"]);

            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = " ops seccesful ";
                populategvVolunteer();

            }
        
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        //protected void btnExportToPdf_Click(object sender, EventArgs e)
        //{
        //    exportManager.ExportToPdf(gvVolunteer);
        //}
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToExcel(gvVolunteer, "export to Excel");
        }
        protected void btnExportToWord_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToWord(gvVolunteer, "export to word");
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