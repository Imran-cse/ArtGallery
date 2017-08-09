using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2.Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridbind();
                loginsecurity();
            }
        }
        protected void loginsecurity()
        {
            if(User.IsInRole("Admin"))
            {

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void gridbind()
        {
            var res = new MySQLDatabase().Query("userInfoForGrid", new Dictionary<string, object>(), true);
            var res2 = res.Select(x => new
            {
                UserName = x["UserName"],
                FirstName = x["FirstName"],
                LastName = x["LastName"],
                Email = x["Email"],
                PhoneNumber = x["PhoneNumber"],
                sex = x["sex"],
                Address = x["Address"],
                BirthDate = x["birthdate"]
            }).ToList();

            userGrid.DataSource = res2;
            userGrid.DataBind();
        }

        protected void userGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            userGrid.PageIndex = e.NewPageIndex;
            gridbind();
        }

        protected void userGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)userGrid.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");

            new MySQLDatabase().Execute("deleteUser", new Dictionary<string, object>()
            {
                {"@userName", Convert.ToString(userGrid.DataKeys[e.RowIndex].Value.ToString()) }
            }, true);
            gridbind();
        }
    }

}