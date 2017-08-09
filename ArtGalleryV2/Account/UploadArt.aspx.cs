using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2.Account
{
    public partial class UploadArt : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            logInSecurity();
        }

        protected void logInSecurity()
        {
            if (User.IsInRole("Artist"))
            {

            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());

            string filename = FileUpload.FileName.ToString();

            string path = "~/UploadedImages/" + filename;
            FileUpload.SaveAs(Server.MapPath(path));
          
            
            using (Stream fs = FileUpload.PostedFile.InputStream)

            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    new MySQLDatabase().Execute("insertArtByArtistId", new Dictionary<string, object>()
                    {
                        {"@artistid",user.Id },
                        {"@cat",category.Text },
                        {"@name",filename },                        
                        {"@image",path },
                        {"@creationDate",Convert.ToDateTime(creationDate.Text) },
                        {"@creationplace",creationPlace.Text },
                        {"@price",price.Text }

                    }, true);
                    Response.Write("Upload successfully");
                }
            }
            Response.Redirect("~/Default.aspx");
        }
    }
}