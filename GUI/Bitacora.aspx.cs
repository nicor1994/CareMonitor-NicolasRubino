using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public partial class Bitacora : System.Web.UI.Page
    {

        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        protected void Page_Load(object sender, EventArgs e)
        {

            List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();

            ListaBitacora = GestorBitacora.ListarBitacora();

            GridView1.DataSource = null;
            GridView1.DataSource = ListaBitacora;
            GridView1.DataBind();
        }
    }
}