using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2.Account
{
    public partial class Auction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Admin"))
            {
                dropdownlist.Visible = true;
                start_txtBox.Visible = true;
                end_txtBox.Visible = true;
                loadDropdown();
            }
            else
            {

            }
        }

        protected void setbtn_Click(object sender, EventArgs e)
        {
            string image_name = dropdownlist.SelectedValue;
            var qstr = new MySQLDatabase().Query("getArtIdByImageName", new Dictionary<string, object>()
            {
                {"@img_name", image_name }
            }, true);


            var qstr2 = qstr.Select(x => new
            {
                art_id = x["id"],
                artist_id = x["artistId"],
                
                price = x["price"]
            }).ToList();

            string art_id = "";
            string artist_id = "";
            
            string price = "";

            foreach (var r in qstr2)
            {
                art_id = r.art_id;
                artist_id = r.artist_id;
                
                price = r.price;
            }

            new MySQLDatabase().Execute("updateArtForAuction", new Dictionary<string, object>()
            {
                {"@artId", art_id },
                {"@price",price },
                {"@userId",artist_id }
            }, true);
        }

        protected void loadDropdown()
        {
            var name = new MySQLDatabase().Query("getArtNameForAuction", new Dictionary<string, object>(), true);
            var name2 = name.Select(x => new
            {
                name = x["name"]
            }).ToList();
            dropdownlist.DataSource = name2;
            dropdownlist.DataTextField = "name";
            dropdownlist.DataValueField = "name";
            dropdownlist.DataBind();
        }

        protected void auctionView()
        {
            var qstr_view = new MySQLDatabase().Query("getAuctionInfo", new Dictionary<string, object>(), true);
            var qstr2_view = qstr_view.Select(x => new
            {
                art_id = x["artId"],
                maxBid = x["maxBid"],
                user_id = x["userId"],
                sTime = x["startTime"].ToString(),
                eTime = x["endTime"]
            }).ToList();

            foreach (var item in qstr2_view)
            {
                textLabel.Text = item.sTime;
            }
        }
    }
}