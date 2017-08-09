using ArtGalleryV2.Models;
using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace ArtGalleryV2
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            createRoles();
        }

        private void createRoles()
        {
            ApplicationDbContext context = new ApplicationDbContext();
            var roleStore = new RoleStore<IdentityRole>(context);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            if (!roleManager.RoleExists("Admin"))
            {
                var res = roleManager.Create(new IdentityRole("Admin"));
                if (!res.Succeeded)
                    throw new Exception(res.Errors.FirstOrDefault());
            }
            if (!roleManager.RoleExists("Artist"))
            {
                var res = roleManager.Create(new IdentityRole("Artist"));
                if (!res.Succeeded)
                    throw new Exception(res.Errors.FirstOrDefault());
            }
            if (!roleManager.RoleExists("Client"))
            {
                var res = roleManager.Create(new IdentityRole("Client"));
                if (!res.Succeeded)
                    throw new Exception(res.Errors.FirstOrDefault());
            }

        }
    }
}