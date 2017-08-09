using AspNet.Identity.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2.Account
{
    public partial class auction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDropdown();
                divCatagory.Visible = false;
                divprice.Visible = false;
                divrating.Visible = false;
                divArtist.Visible = false;
            }
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {
            double low, high;
            if(ddlSearchBy.SelectedValue == "Catagory")
            {
                var searchres = new MySQLDatabase().Query("searchArt", new Dictionary<string, object>()
                {
                    {"@catagory",ddlCatagory.SelectedValue }
                }, true);
                var res = searchres.Select(x => new
                {
                    Id = x["id"],
                    Image = x["image"]

                }).ToList();

                RepeaterImage.DataSource = res;
                RepeaterImage.DataBind();
            }
            else if(ddlSearchBy.SelectedValue == "Price")
            {
                if(ddlprice.SelectedValue == "1")
                {
                    low = 10;
                    high = 100;
                    var searchres = new MySQLDatabase().Query("searchbyprice", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();

                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                else if (ddlprice.SelectedValue == "2")
                {
                    low = 101;
                    high = 500;
                    var searchres = new MySQLDatabase().Query("searchbyprice", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();

                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                else if (ddlprice.SelectedValue == "3")
                {
                    low = 501;
                    high = 1000;
                    var searchres = new MySQLDatabase().Query("searchbyprice", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();

                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                else if (ddlprice.SelectedValue == "4")
                {
                    low = 1001;
                    high = 1000000;
                    var searchres = new MySQLDatabase().Query("searchbyprice", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();

                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
            }
            else if(ddlSearchBy.SelectedValue == "Rating")
            {
                high = 6;
                if(ddlrating.SelectedValue == "1")
                {
                    low = 1;
                    var searchres = new MySQLDatabase().Query("searchbyrating", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    },true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();
                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                
                else if (ddlrating.SelectedValue == "2")
                {
                    low = 2;
                    var searchres = new MySQLDatabase().Query("searchbyrating", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();
                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                
                else if (ddlrating.SelectedValue == "3")
                {
                    low = 3;
                    var searchres = new MySQLDatabase().Query("searchbyrating", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();
                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                
                else if (ddlrating.SelectedValue == "4")
                {
                    low = 4;
                    var searchres = new MySQLDatabase().Query("searchbyrating", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();
                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
                
                else if (ddlrating.SelectedValue == "5")
                {
                    low = 5;
                    var searchres = new MySQLDatabase().Query("searchbyrating", new Dictionary<string, object>()
                    {
                        {"@low",low },
                        {"@high",high }

                    }, true);
                    var res = searchres.Select(x => new
                    {
                        Id = x["id"],
                        Image = x["image"]
                    }).ToList();
                    RepeaterImage.DataSource = res;
                    RepeaterImage.DataBind();
                }
            }
            if (ddlSearchBy.SelectedValue == "Artist")
            {
                var searchres = new MySQLDatabase().Query("searchbyArtist", new Dictionary<string, object>()
                {
                    {"@uid",ddlArtist.SelectedValue }
                }, true);
                var res = searchres.Select(x => new
                {
                    Id = x["id"],
                    Image = x["image"]

                }).ToList();

                RepeaterImage.DataSource = res;
                RepeaterImage.DataBind();
            }

        }
        
        protected void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            RepeaterItem item = (RepeaterItem)imgBtn.NamingContainer;
            HiddenField hfImgId = (HiddenField)item.FindControl("imgId");
            Response.Redirect("~/ViewImage.aspx?ImgId=" + hfImgId.Value);
        }
        protected void loadDropdown()
        {

                
                var catagory = new MySQLDatabase().Query("getAllCatagory", new Dictionary<string, object>(), true);
                var catagory2 = catagory.Select(x => new
                {
                    catagory = x["catagory"]
                }).ToList();

                ddlCatagory.DataSource = catagory2;
                ddlCatagory.DataTextField = "catagory";
                ddlCatagory.DataValueField = "catagory";
                ddlCatagory.DataBind();
            


        }

        protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSearchBy.SelectedValue == "Catagory")
            {
                divCatagory.Visible = true;
                divprice.Visible = false;
                divrating.Visible = false;
                divArtist.Visible = false;
            }
            else if (ddlSearchBy.SelectedValue == "Price")
            {
                divCatagory.Visible = false;
                divprice.Visible = true;
                divrating.Visible = false;
                divArtist.Visible = false;
            }
            else if (ddlSearchBy.SelectedValue == "Rating")
            {
                divCatagory.Visible = false;
                divprice.Visible = false;
                divrating.Visible = true;
                divArtist.Visible = false;
            }
            else if(ddlSearchBy.SelectedValue == "Artist")
            {
                divCatagory.Visible = false;
                divprice.Visible = false;
                divrating.Visible = false;
                divArtist.Visible = true;
                var UserName = new MySQLDatabase().Query("getAllArtist", new Dictionary<string, object>(), true);
                var artist2 = UserName.Select(x => new
                {
                    UserName = x["UserName"]
                }).ToList();

                ddlArtist.DataSource = artist2;
                ddlArtist.DataTextField = "UserName";
                ddlArtist.DataValueField = "UserName";
                ddlArtist.DataBind();
            }
            else
            {
                divCatagory.Visible = false;
                divprice.Visible = false;
                divrating.Visible = false;
                divArtist.Visible = false;
            }
        }
    }
}