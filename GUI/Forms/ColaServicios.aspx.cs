using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using iText.IO.Font.Constants;
using iText.Kernel;
using iText.Kernel.Colors;
using iText.Kernel.Events;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Borders;
using iText.Layout.Element;
using iText.Layout.Properties;
using Image = iText.Layout.Element.Image;

namespace GUI.Forms
{
    public partial class ColaServicios : System.Web.UI.Page
    {
        List<BE.Servicio> ListaServicios = new List<BE.Servicio>();
        BLL.Servicio GestorServicio = new BLL.Servicio();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ListaServicios = GestorServicio.ListarServicios();
                Session["ListaServicios"] = ListaServicios;

                listServicios.DataSource = null;
                listServicios.DataSource = ListaServicios;
                listServicios.DataBind();
            }

            ListaServicios = (List<BE.Servicio>)Session["ListaServicios"];
        }

        protected void listServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            BE.Servicio serv = ListaServicios[listServicios.SelectedIndex];

            lblDescripcion.Text = serv.TipoServicio.Descripcion;
            lblNombre.Text = serv.TipoServicio.Nombre;
            lblTiempoMedio.Text = serv.TipoServicio.TiempoMedio.ToString();

        }

        protected void btnEvolucionar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCerrarServicio_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                GestorServicio.CerrarServicio(ListaServicios[listServicios.SelectedIndex], int.Parse(txtTiempo.Text));

            }

        }

        protected void btnGenerarExcel_Click(object sender, EventArgs e)
        {
            ClosedXML.Excel.XLWorkbook wrkbook = new ClosedXML.Excel.XLWorkbook();

            var worksheet = wrkbook.Worksheets.Add("Bitacora");
            var currentRow = 1;
            worksheet.Cell(currentRow, 1).Value = "CareMonitor";

            currentRow = 3;
            worksheet.Cell(currentRow, 1).Value = "Fecha: " + DateTime.Now.ToShortDateString();

            currentRow = 5;
            worksheet.Cell(currentRow, 1).Value = "Servicios Pendientes";

            currentRow = 7;
            worksheet.Cell(currentRow, 1).Value = "Usuario";
            worksheet.Cell(currentRow, 2).Value = "Nombre";
            worksheet.Cell(currentRow, 3).Value = "Descripción";
            worksheet.Cell(currentRow, 4).Value = "Fecha";
            worksheet.Cell(currentRow, 5).Value = "Dirección";


            List<BE.Servicio> listaServicio = (List<BE.Servicio>)Session["ListaServicios"];

            foreach (BE.Servicio bit in listaServicio)
            {
                currentRow++;
                worksheet.Cell(currentRow, 1).Value = bit.Usuario.Nombre + " " + bit.Usuario.Apellido;
                worksheet.Cell(currentRow, 2).Value = bit.TipoServicio.Nombre;
                worksheet.Cell(currentRow, 3).Value = bit.TipoServicio.Descripcion;
                worksheet.Cell(currentRow, 4).Value = bit.FechaServicio.ToShortDateString();
                worksheet.Cell(currentRow, 5).Value = bit.Usuario.Direccion;
            }

            MemoryStream stream = new MemoryStream();

            wrkbook.SaveAs(stream);
            var content = stream.ToArray();




            byte[] bytesStream = stream.ToArray();
            stream = new MemoryStream();
            stream.Write(bytesStream, 0, bytesStream.Length);
            stream.Position = 0;

            Response.AddHeader("content-disposition", "inline;filename=Reporte.xlsx");
            Response.ContentType = "application/octectstream";
            Response.BinaryWrite(bytesStream);
            Response.End();
        }

        protected void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            MemoryStream ms = new MemoryStream();

            PdfWriter pw = new PdfWriter(ms);
            PdfDocument pdf = new PdfDocument(pw);
            Document doc = new Document(pdf, PageSize.A4);
            doc.SetMargins(75, 35, 70, 35);
            string pathLogo = Server.MapPath("../Imagenes/Care Monitor.jpg");
            iText.Layout.Element.Image img = new iText.Layout.Element.Image(iText.IO.Image.ImageDataFactory.Create(pathLogo));

            pdf.AddEventHandler(PdfDocumentEvent.START_PAGE, new HeaderEventHandler(img));


            iText.Layout.Element.Table tabla = new iText.Layout.Element.Table(1).UseAllAvailableWidth();
            Cell cell = new Cell().Add(new Paragraph("Servicios Pendientes").SetFontSize(14)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                .SetBorder(Border.NO_BORDER));
            tabla.AddCell(cell);

            doc.Add(tabla);

            iText.Layout.Style styleCell = new iText.Layout.Style()
                .SetBackgroundColor(ColorConstants.LIGHT_GRAY)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER);

            iText.Layout.Element.Table _tabla = new iText.Layout.Element.Table(5).UseAllAvailableWidth();
            Cell _cell = new Cell().Add(new Paragraph("Usuario"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Nombre"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Descripción"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Fecha"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Dirección"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));



            List<BE.Servicio> listaServicio = (List<BE.Servicio>)Session["ListaServicios"];

            foreach (BE.Servicio bit in listaServicio)
            {
                _cell = new Cell().Add(new Paragraph(bit.Usuario.Nombre + " " + bit.Usuario.Apellido));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.TipoServicio.Nombre));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.TipoServicio.Descripcion));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.FechaServicio.ToShortDateString()));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Usuario.Direccion));
                _tabla.AddCell(_cell);
            }

            doc.Add(_tabla);

            doc.Close();

            byte[] bytesStream = ms.ToArray();
            ms = new MemoryStream();
            ms.Write(bytesStream, 0, bytesStream.Length);
            ms.Position = 0;

            Response.AddHeader("content-disposition", "inline;filename=Reporte.pdf");
            Response.ContentType = "application/octectstream";
            Response.BinaryWrite(bytesStream);
            Response.End();
        }
    }
}