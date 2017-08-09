using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace ArtGalleryV2
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            MySqlConnection con = new MySqlConnection(constr);
            MySqlDataReader reader;
            con.Open();
            MySqlCommand cmd;
            string qstr = "SELECT image FROM art WHERE id=2";
            cmd = new MySqlCommand(qstr, con);
            reader = cmd.ExecuteReader();

            while (reader.Read() && reader.HasRows)
            {
                context.Response.ContentType = "image/jpg";
                context.Response.BinaryWrite((byte[])reader["image"]);
            }

            reader.Close();

            con.Close();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}