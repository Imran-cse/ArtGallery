using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using ArtGalleryV2.Models;
using AspNet.Identity.MySQL;
using System.Collections.Generic;

namespace ArtGalleryV2.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {

            if (RegisterAs.SelectedValue == "Admin")
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                var user = new ApplicationUser()
                {
                    UserName = UserName.Text,
                    FirstName = FirstName.Text,
                    LastName = LastName.Text,
                    Email = Email.Text,
                    PhoneNumber = PhoneNo.Text,
                    Sex = Sex.SelectedValue,
                    Address = Address.Text,
                    Birthdate = DateTime.Parse(Birthdate.Text)
                };
                IdentityResult result = manager.Create(user, Password.Text);
                if (result.Succeeded)
                {
                    var res = manager.AddToRole(user.Id, "Admin");


                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
            else if (RegisterAs.SelectedValue == "Artist")
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                var user = new ApplicationUser()
                {
                    UserName = UserName.Text,
                    FirstName = FirstName.Text,
                    LastName = LastName.Text,
                    Email = Email.Text,
                    PhoneNumber = PhoneNo.Text,
                    Sex = Sex.SelectedValue,
                    Address = Address.Text,
                    Birthdate = DateTime.Parse(Birthdate.Text)
                };
                IdentityResult result = manager.Create(user, Password.Text);
                if (result.Succeeded)
                {
                    var res = manager.AddToRole(user.Id, "Artist");
                    new MySQLDatabase().Execute("insertArtist", new Dictionary<string, object>()
                    {
                        {"@uid", user.Id}

                    }, true);
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
            else if (RegisterAs.SelectedValue == "Client")
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                var user = new ApplicationUser()
                {
                    UserName = UserName.Text,
                    FirstName = FirstName.Text,
                    LastName = LastName.Text,
                    Email = Email.Text,
                    PhoneNumber = PhoneNo.Text,
                    Sex = Sex.SelectedValue,
                    Address = Address.Text,
                    Birthdate = DateTime.Parse(Birthdate.Text)
                };
                IdentityResult result = manager.Create(user, Password.Text);
                if (result.Succeeded)
                {
                    var res = manager.AddToRole(user.Id, "Client");
                    new MySQLDatabase().Execute("insertClient", new Dictionary<string, object>()
                    {
                         {"@uid",user.Id }

                    }, true);

                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }

            Response.Redirect("Default.aspx");
        }

        
    }
}