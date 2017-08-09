using AspNet.Identity.MySQL;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2
{
    public partial class ViewImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            var res = new MySQLDatabase().Query("viewImage", new Dictionary<string, object>()
            {
                {"@imageID",  Request.QueryString["ImgId"]}
            }, true);
            var res2 = res.Select(x => new
            {
                Name = x["name"],
                Catagory = x["catagory"],
                Image = x["image"],
                creationDate = x["creationDate"].ToString(),
                creationPlace = x["creationPlace"],
                price = x["price"],
                avg_rat = x["avg_rat"]
            }).ToList();

            foreach (var r in res2)
            {
                Name.Text = r.Name;
                Catagory.Text = r.Catagory;
                image.ImageUrl = r.Image;
                creationDate.Text = r.creationDate;
                creationPlace.Text = r.creationPlace;
                Price.Text = r.price;
                AvgRating.Text = (r.avg_rat)==null?"0.00": String.Format("{0:F2}", r.avg_rat);
            }


            //saveRating();
        }


        protected void submitRating_Click(object sender, EventArgs e)
        {
            string s = rating.Value;
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var user = manager.FindById(User.Identity.GetUserId());
            string artid = Request.QueryString["ImgId"];

            var res = new MySQLDatabase().QueryValue("countUser", new Dictionary<string, object>()
            {
                {"uid",user.Id},
                {"@aid",artid }
            }, true).ToString();

            int res2 = Convert.ToInt32(res);
            if (res2 < 1)
            {
                new MySQLDatabase().Execute("addrating", new Dictionary<string, object>()
                {
                    {"@artid",artid},
                    {"@userid",user.Id },
                    {"@rat",s }
                }, true);
            }
            else
            {
                new MySQLDatabase().Execute("updateRatingByUId", new Dictionary<string, object>()
                {
                    {"@uid",user.Id },
                    {"@rating",s }
                }, true);
            }

            var avg = new MySQLDatabase().QueryValue("avg_rating", new Dictionary<string, object>()
            {
                {"@artid",  artid}
            }, true).ToString();


            new MySQLDatabase().Execute("UpdateAvg_rating", new Dictionary<string, object>()
            {
                {"@artid",artid },
                {"@avg_rat",avg}

            }, true);

            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}