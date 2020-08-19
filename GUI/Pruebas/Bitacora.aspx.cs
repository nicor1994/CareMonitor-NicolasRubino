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
        List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();
        protected void Page_Load(object sender, EventArgs e)
        {

            

            ListaBitacora = GestorBitacora.ListarBitacora();

            GridView1.DataSource = null;
            GridView1.DataSource = ListaBitacora;
            GridView1.DataBind();
            ListBox1.DataSource = null;
            ListBox1.DataSource = ListaBitacora;
            ListBox1.DataBind();
            TextBox1.Text = ListaBitacora[0].Usuario.Nombre + " " + ListaBitacora[0].Usuario.Apellido;
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = ListaBitacora[ListBox1.SelectedIndex].Usuario.Nombre + " " + ListaBitacora[ListBox1.SelectedIndex].Usuario.Apellido;
        }

        protected void ListBox1_Init(object sender, EventArgs e)
        {
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Text = Seguridad.Encriptador.Encrypt(TextBox1.Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label3.Text = Seguridad.Encriptador.Decrypt(TextBox2.Text);
        }
    }
}