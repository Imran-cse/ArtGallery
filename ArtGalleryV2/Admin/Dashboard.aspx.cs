using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                loadInfo();
            }
        }


        protected void loadInfo()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            lblName.Text = user.FirstName +" "+ user.LastName;

            var res = new MySQLDatabase().Query("getUserInfoByUId", new Dictionary<string, object>()
            {
                {"@uid",user.Id }
            }, true);

            var res2 = res.Select(x => new
            {
                Email = x["Email"],
                PhoneNo = x["PhoneNumber"],
                sex = x["sex"],
                Address = x["Address"],
                Birthdate = x["birthdate"].ToString()
            }).ToList();

            foreach(var r in res2)
            {
                lblEmail.Text = r.Email;
                lblPhoneNo.Text = r.PhoneNo;
                lblAddress.Text = r.Address;
                lblsex.Text = r.sex;
                lblBirthDate.Text = r.Birthdate;
            }
        }
    }
}