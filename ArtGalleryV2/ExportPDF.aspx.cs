using AspNet.Identity.MySQL;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGalleryV2
{
    public partial class ExportPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGVImage();
            }
            
        }

        protected void loadGVImage()
        {
            var image = new MySQLDatabase().Query("getImage", new Dictionary<string, object>(), true);
            var image2 = image.Select(x => new
            {
                Image = x["image"]
            }).ToList();
            gvImage.DataSource = image2;
            gvImage.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            loadGVImage();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=image.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvImage.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A1, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
    }
}