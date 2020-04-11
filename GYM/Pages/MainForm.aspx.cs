using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GYM.Pages
{   
    public partial class MainForm : System.Web.UI.Page
    {
        LinqDBDataContext db = new LinqDBDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {

                FillListControl(TableNames.PLAN_TYPE, ddlPlanType_Plan, false, "");

                if (ChkDayAmount_Plan.Checked == false)
                    txtDayAmount_Plan.Enabled = false;
                if (ChkMonthAmount_Plan.Checked == false)
                    txtMonthAmount_Plan.Enabled = false;

                FillListControl(TableNames.PLAN, lbxPlan, false, "");
                SwitchFormMode(Mode.Add_Mode);

                mvMain.SetActiveView(vPlan);
            }

        }

        protected void btnCloseAdvanced_Click(object sender, EventArgs e)
        {
            mvMain.SetActiveView(vContract);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FillListControl(TableNames.PLAN_TYPE , ddlPlanType_Plan , false, "");
            FillListControl(TableNames.PLAN, lbxPlan, false, "");
            mvMain.SetActiveView(vPlan);
        }

  # region Functions 
        
        public enum TableNames
        {
            PLAN_TYPE,
            PLAN
        }

        public enum Mode
        {
            Add_Mode,
            Update_Mode
        }

        private void SwitchFormMode(Mode eFORM_MODE)
        {
            if (eFORM_MODE == Mode.Add_Mode)
            {
                hfMode.Value = "A";
            }
            else if (eFORM_MODE == Mode.Update_Mode)
            {
                hfMode.Value = "U";
            }
        }

        public void FillListControl(TableNames eTableName, ListControl lcData, bool bIsEmptyItem, string strEmptyItemText)
        {
            LinqDBDataContext db = new LinqDBDataContext();
            lcData.Items.Clear();

            switch (eTableName)
            {
                case TableNames.PLAN_TYPE:
                    lcData.DataSource = db.tblPlanTypes.Select(P => new { Code = P.PlanTypeID , Name = P.PlanTypeName });
                    break;
                case TableNames.PLAN:

                    lcData.DataSource = db.tblPlans.Where(P => P.PlanTypeID ==  int.Parse(ddlPlanType_Plan.SelectedValue.ToString()) && P.IsActive==true ).Select(P => new { Code = P.PlanID, Name = P.PlanName });
                    break;
                    
            }

            lcData.DataTextField = "Name";
            lcData.DataValueField = "Code";
            lcData.DataBind();
            if (lcData.Items.Count > 0 && bIsEmptyItem == true)
                lcData.Items.Insert(0, new ListItem(strEmptyItemText, "0"));
        }

 # endregion 

        protected void ddlPlanType_Plan_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillListControl(TableNames.PLAN, lbxPlan, false, "");
            if (ddlPlanType_Plan.SelectedValue == "2")
            {
                txtContractLength_Plan.Text = "0";
                txtContractLength_Plan.Enabled = false;
            }
            mvMain.SetActiveView(vPlan);
        }

  

        public void ClearPlanForm()
        {
            ddlPlanType_Plan.ClearSelection();
            txtPlanName_Plan.Text = "";
            txtContractLength_Plan.Text = "0";
            txtTotalFees_Plan.Text = "";
            txtDayAmount_Plan.Text = "";
            txtMonthAmount_Plan.Text = "";
            txtDayAmount_Plan.Enabled  = false ;
            txtMonthAmount_Plan.Enabled  = false ;
            ChkDayAmount_Plan.Checked = false;
            ChkMonthAmount_Plan.Checked = false;
            ddlFromTime_Plan.ClearSelection();
            ddlToTime_Plan.ClearSelection();
            chbMonday.Checked = false;
            chbTuesday.Checked = false;
            chbWednesday.Checked = false;
            chbThursday.Checked = false;
            chbFriday.Checked = false;
            chbSaturday.Checked = false;
            chbSunday.Checked = false;
            chbIsActive_Plan.Checked = true;

        }

        protected void btnSavePlan_Click(object sender, EventArgs e)
        {
            try
            {


                if (hfMode.Value == "A")
                {
                    tblPlan AddPlan = new tblPlan();

                    AddPlan.PlanName = txtPlanName_Plan.Text;
                    AddPlan.PlanTypeID = int.Parse(ddlPlanType_Plan.SelectedValue);
                    AddPlan.ContractLenght = int.Parse(txtContractLength_Plan.Text);
                    if (txtTotalFees_Plan.Text != "")
                        AddPlan.TotalFees = double.Parse(txtTotalFees_Plan.Text);
                    else
                        AddPlan.TotalFees = 0;

                    if (txtDayAmount_Plan.Text != "")
                        AddPlan.PaymentDayAmount = double.Parse(txtDayAmount_Plan.Text);
                    else
                        AddPlan.PaymentDayAmount = 0;

                    if (txtMonthAmount_Plan.Text != "")
                        AddPlan.PaymentMonthAmount = double.Parse(txtMonthAmount_Plan.Text);
                    else
                        AddPlan.PaymentMonthAmount = 0;
                   
                    if (chbLimitEntry.Checked == true)
                        AddPlan.HasLimitedHours = true;

                        AddPlan.FromHour = TimeSpan.Parse(ddlFromTime_Plan.SelectedValue);
                        AddPlan.ToHour = TimeSpan.Parse(ddlToTime_Plan.SelectedValue);


                        if (chbMonday.Checked == true)
                            AddPlan.Mon = true;
                        else
                            AddPlan.Mon = false;

                        if (chbTuesday.Checked == true)
                            AddPlan.Tue = true;
                        else
                            AddPlan.Tue = false;

                        if (chbWednesday.Checked == true)
                            AddPlan.Wed = true;
                        else
                            AddPlan.Wed = false;

                        if (chbThursday.Checked == true)
                            AddPlan.Thu = true;
                        else
                            AddPlan.Thu = false;

                        if (chbFriday.Checked == true)
                            AddPlan.Fri = true;
                        else
                            AddPlan.Fri = false;

                        if (chbSaturday.Checked == true)
                            AddPlan.Sat = true;
                        else
                            AddPlan.Sat = false;

                        if (chbSunday.Checked == true)
                            AddPlan.Sun = true;
                        else
                            AddPlan.Sun = false;

                    
                    AddPlan.IsActive = chbIsActive_Plan.Checked;

                    db.tblPlans.InsertOnSubmit(AddPlan);
                    db.SubmitChanges();


                }
                else if (hfMode.Value == "U") //&& hfCode.Value != ""
                {

                }
            }
            catch (Exception ex)
            {
                //UCMessageBox1.ShowExceptionMessage(ex);

            }
            ClearPlanForm();
        }

        protected void ChkDayAmount_Plan_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkDayAmount_Plan.Checked == false)
                txtDayAmount_Plan.Enabled = false;
            else
                txtDayAmount_Plan.Enabled = true;

     
        }

        protected void ChkMonthAmount_Plan_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkMonthAmount_Plan.Checked == false)
                txtMonthAmount_Plan.Enabled = false;
            else
                txtMonthAmount_Plan.Enabled = true ;
        }

        protected void chbLimitEntry_CheckedChanged(object sender, EventArgs e)
        {
            if (chbLimitEntry.Checked == true)
            {
                pnlAllowedHours.Visible = true;
                pnlAllowedDays.Visible = true;
            }
            else
            {
                pnlAllowedHours.Visible = false ;
                pnlAllowedDays.Visible = false ;
            }
         
        }

        protected void lbxPlan_SelectedIndexChanged(object sender, EventArgs e)
        {
           var vPlan = db.tblPlans.SingleOrDefault(P=>P.PlanID==int.Parse( lbxPlan.SelectedValue));
          
            txtContractLength_Plan.Text=vPlan.ContractLenght.ToString();
               txtTotalFees_Plan.Text= vPlan.TotalFees.ToString();
               txtDayAmount_Plan.Text = vPlan.PaymentDayAmount.ToString();
               txtMonthAmount_Plan.Text=vPlan.PaymentMonthAmount.ToString();
              
            vPlan.FromHour = TimeSpan.Parse(ddlFromTime_Plan.SelectedValue);
             vPlan.ToHour = TimeSpan.Parse(ddlToTime_Plan.SelectedValue);

             if (vPlan.IsActive == true)
             {
                 pnlAllowedDays.Visible = true;
                 pnlAllowedHours.Visible = true;
             }  
            
                 chbMonday.Checked = bool.Parse(vPlan.Mon.ToString());
                 chbTuesday.Checked = bool.Parse(vPlan.Tue.ToString());
                 chbWednesday.Checked = bool.Parse(vPlan.Wed.ToString());
                 chbThursday.Checked = bool.Parse(vPlan.Thu.ToString());
                 chbFriday.Checked = bool.Parse(vPlan.Fri.ToString());
                 chbSaturday.Checked = bool.Parse(vPlan.Sat.ToString());
                 chbSunday.Checked = bool.Parse(vPlan.Sun.ToString());

          
           vPlan.IsActive = chbIsActive_Plan.Checked;
        }

     




    }
}