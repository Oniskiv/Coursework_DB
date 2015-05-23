using lab_rab_5.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lab_rab_5
{
    public partial class InformationEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var query = from t in db.Employee select t;
            //GridView1.DataSource = query.ToList();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridView1.PageIndex = e.NewPageIndex;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //GridView1.DataBind();
        }
    }
}