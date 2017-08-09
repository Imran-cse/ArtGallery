using AspNet.Identity.MySQL;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using Microsoft.Ajax.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            //MySqlConnection con = new MySqlConnection(constr);
            //con.Open();
            //MySqlDataReader reader;
            //string qstr = "select id,image from art";
            //MySqlCommand cmd = new MySqlCommand(qstr, con);
            //reader = cmd.ExecuteReader();
            ////string img;
            //List<String> images = new List<string>();
            ////int j = 0;

            //while (reader.Read() && reader.HasRows)
            //{
            //    images.Add(reader.GetString(reader.GetOrdinal("image")));

            //}
            //RepeaterImages.DataSource = images;
            //RepeaterImages.DataBind();

            bindRepeater();
        }

        protected void bindRepeater()
        {
            var res = new MySQLDatabase().Query("getImageId", new Dictionary<string, object>(), true);
            var res2 = res.Select(x => new
            {
                Id = x["id"],
                Image = x["image"]
            }).ToList();

            RepeaterImages.DataSource = res2;
            RepeaterImages.DataBind();
        }

        
        protected void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            RepeaterItem item = (RepeaterItem)imgBtn.NamingContainer;
            HiddenField hfImgId = (HiddenField)item.FindControl("imgId");
            Response.Redirect("~/ViewImage.aspx?ImgId=" + hfImgId.Value);
        }

       

        /*protected void RepeaterImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            HyperLink hypl = (HyperLink)e.Item.FindControl("HyperLink1");
            string val = hypl.ToString();
            hypl.NavigateUrl = "~/ViewImage.aspx?"+val;
        }*/
    }
}