using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
    public partial class Bitacora : System.Web.UI.Page
    {
        BLL.Bitacora GestorBitacora = new BLL.Bitacora();
        BLL.Usuario GestorUsuarios = new BLL.Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 10) != null)
            {
                List<BE.Bitacora> ListaBitacora = new List<BE.Bitacora>();
                List<string> ListaNombres = new List<string>();
                List<string> ListaTipos = new List<string>();
                if (!IsPostBack)
                {
                    ListaBitacora = GestorBitacora.ListarBitacora();
                    Session["ListaBitacora"] = ListaBitacora;
                    dropdownUsuarios.DataSource = GestorUsuarios.ListarNombresUsuario();
                    Session["ListaNombres"] = ListaNombres;
                    dropdownUsuarios.DataSource = null;
                    dropdownUsuarios.DataSource = ListaNombres;
                    dropdownUsuarios.DataBind();

                    ListaTipos = GestorBitacora.ListarTipos(ListaBitacora);
                    Session["ListaTipos"] = ListaTipos;
                    dropdownTipos.DataSource = null;
                    dropdownTipos.DataSource = ListaTipos;
                    dropdownTipos.DataBind();
                }
                else
                {
                    ListaBitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
                    ListaNombres = (List<string>)Session["ListaNombres"];
                    ListaTipos = (List<string>)Session["ListaTipos"];
                    if (ListaBitacora.Count == 0)
                    {
                        ListaBitacora = GestorBitacora.ListarBitacora();
                        Session["ListaBitacora"] = ListaBitacora;
                    }
                    if (ListaNombres.Count == 0)
                    {
                        ListaNombres = GestorUsuarios.ListarNombresUsuario();
                        Session["ListaNombres"] = ListaNombres;
                        dropdownUsuarios.DataSource = null;
                        dropdownUsuarios.DataSource = ListaNombres;
                        dropdownUsuarios.DataBind();
                    }
                    if (ListaTipos.Count == 0)
                    {
                        ListaTipos = GestorBitacora.ListarTipos(ListaBitacora);
                        Session["ListaTipos"] = ListaTipos;
                        dropdownTipos.DataSource = null;
                        dropdownTipos.DataSource = ListaTipos;
                        dropdownTipos.DataBind();
                    }

                }

                GridView1.DataSource = null;
                GridView1.DataSource = ListaBitacora;
                GridView1.DataBind();

            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }


            ///////////////////////////////


           
        }

        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            calendario.Visible = true;
            dropdownTipos.Visible = false;
            dropdownUsuarios.Visible = false;
            btnFiltraUsuarios.Visible = false;
            btnFiltrarTipo.Visible = false;
        }

        protected void calendario_SelectionChanged(object sender, EventArgs e)
        {

            List<BE.Bitacora> listabitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
            List<BE.Bitacora> listafiltrada = new List<BE.Bitacora>();
            foreach (BE.Bitacora bit in listabitacora)
            {
                if (bit.Fecha == calendario.SelectedDate){
                    listafiltrada.Add(bit);
                }
            }
            Session["ListaBitacora"] = listafiltrada;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            if((listafiltrada.Count == 0)){
                lblerror.Visible = true;
            }
            GridView1.DataBind();
            btnFecha.Enabled = false;
            calendario.Visible = false;
        }

        protected void btnQuitarfiltro_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bitacora.aspx");
        }

        protected void btnUsuario_Click(object sender, EventArgs e)
        {
            calendario.Visible = false;
            dropdownUsuarios.Visible = true;
            dropdownTipos.Visible = false;
            btnFiltraUsuarios.Visible = true;
            btnFiltrarTipo.Visible = false;
           
        }

        protected void btnTipo_Click(object sender, EventArgs e)
        {
            calendario.Visible = false;
            dropdownTipos.Visible = true;
            dropdownUsuarios.Visible = false;
            btnFiltraUsuarios.Visible = false;
            btnFiltrarTipo.Visible = true;
           
        }

        protected void dropdownUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            

        }

        protected void dropdownUsuarios_TextChanged(object sender, EventArgs e)
        {
          
        }

        protected void btnFiltraUsuarios_Click(object sender, EventArgs e)
        {
            List<BE.Bitacora> listabitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
            List<BE.Bitacora> listafiltrada = new List<BE.Bitacora>();
            List<string> ListaFiltros = (List<string>)Session["ListaFiltros"];

            foreach (BE.Bitacora bit in listabitacora)
            {
                if (bit.Usuario == dropdownUsuarios.SelectedValue.ToString())
                {
                    listafiltrada.Add(bit);
                }
            }
            Session["ListaBitacora"] = listafiltrada;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            if ((listafiltrada.Count == 0)){
                lblerror.Visible = true;
            }
            GridView1.DataBind();
            btnUsuario.Enabled = false;
            btnFiltraUsuarios.Visible = false;
            
        }

        protected void btnFiltrarTipo_Click(object sender, EventArgs e)
        {
            List<BE.Bitacora> listabitacora = (List<BE.Bitacora>)Session["ListaBitacora"];
            List<BE.Bitacora> listafiltrada = new List<BE.Bitacora>();
            List<string> ListaFiltros = (List<string>)Session["ListaFiltros"];

            foreach (BE.Bitacora bit in listabitacora)
            {
                if (bit.Tipo == dropdownTipos.SelectedValue.ToString())
                {
                    listafiltrada.Add(bit);
                }
            }
            Session["ListaBitacora"] = listafiltrada;
            GridView1.DataSource = null;
            GridView1.DataSource = (List<BE.Bitacora>)Session["ListaBitacora"];
            if ((listafiltrada.Count == 0))
            {
                lblerror.Visible = true;
            }
            GridView1.DataBind();
            btnTipo.Enabled = false;
            btnFiltrarTipo.Visible = false;
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
            Cell cell = new Cell().Add(new Paragraph("Reporte de Bitácora").SetFontSize(14)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                .SetBorder(Border.NO_BORDER));
            tabla.AddCell(cell);

            doc.Add(tabla);

            iText.Layout.Style styleCell = new iText.Layout.Style()
                .SetBackgroundColor(ColorConstants.LIGHT_GRAY)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER);

            iText.Layout.Element.Table _tabla = new iText.Layout.Element.Table(4).UseAllAvailableWidth();
            Cell _cell = new Cell().Add(new Paragraph("Fecha"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Usuario"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Tipo"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Acción"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));

            

            List<BE.Bitacora> listaBitacora = (List<BE.Bitacora>)Session["ListaBitacora"];

            foreach (BE.Bitacora bit in listaBitacora)
            {
                _cell = new Cell().Add(new Paragraph(bit.Fecha.ToString("g")));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Usuario));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Tipo));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Accion));
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

        protected void btnGenerarExcel_Click(object sender, EventArgs e)
        {
            ClosedXML.Excel.XLWorkbook wrkbook = new ClosedXML.Excel.XLWorkbook();

            var worksheet = wrkbook.Worksheets.Add("Bitacora");
            var currentRow = 1;
            worksheet.Cell(currentRow, 1).Value = "CareMonitor";

            currentRow = 3;
            worksheet.Cell(currentRow, 1).Value = "Fecha: " + DateTime.Now.ToShortDateString();

            currentRow = 5;
            worksheet.Cell(currentRow, 1).Value = "Reporte de Bitácora";

            currentRow = 7;
            worksheet.Cell(currentRow, 1).Value = "Fecha";
            worksheet.Cell(currentRow, 2).Value = "Usuario";
            worksheet.Cell(currentRow, 3).Value = "Tipo";
            worksheet.Cell(currentRow, 4).Value = "Accion";


            List<BE.Bitacora> listaBitacora = (List<BE.Bitacora>)Session["ListaBitacora"];

            foreach (BE.Bitacora bit in listaBitacora)
            {
                currentRow++;
                worksheet.Cell(currentRow, 1).Value = bit.Fecha.ToShortDateString();
                worksheet.Cell(currentRow, 2).Value = bit.Usuario;
                worksheet.Cell(currentRow, 3).Value = bit.Tipo;
                worksheet.Cell(currentRow, 4).Value = bit.Accion;
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
    }

    public class HeaderEventHandler : IEventHandler
    {
        iText.Layout.Element.Image Img;
        public HeaderEventHandler(iText.Layout.Element.Image img)
        {
            Img = img;
        }
        public void HandleEvent(Event @event)
        {
            PdfDocumentEvent docEvent = (PdfDocumentEvent)@event;
            PdfDocument pdfDoc = docEvent.GetDocument();
            PdfPage page = docEvent.GetPage();

            Rectangle rootArea = new Rectangle(35, page.GetPageSize().GetTop() - 70, page.GetPageSize().GetRight() - 70, 50);
            Canvas canvas = new Canvas(page, rootArea);
            canvas
                .Add(getTable(docEvent))
                .Close();
        }

        public iText.Layout.Element.Table getTable(PdfDocumentEvent docEvent)
        {
            float[] cellWidth = { 20f, 80f };
            iText.Layout.Element.Table tableEvent = new iText.Layout.Element.Table(UnitValue.CreatePercentArray(cellWidth)).UseAllAvailableWidth();

            iText.Layout.Style styleCell = new iText.Layout.Style()
                .SetBorder(Border.NO_BORDER);

            iText.Layout.Style styleText = new iText.Layout.Style()
                .SetTextAlignment(TextAlignment.RIGHT).SetFontSize(10f);

            Cell cell = new Cell().Add(Img.SetAutoScale(true));

            tableEvent.AddCell(cell
                .AddStyle(styleCell)
                .SetTextAlignment(TextAlignment.LEFT));
            PdfFont bold = PdfFontFactory.CreateFont(StandardFonts.TIMES_BOLD);
            cell = new Cell()
                .Add(new Paragraph("CareMonitor")).SetFont(bold)                
                .Add(new Paragraph("Fecha de Emisión: " + DateTime.Now.ToShortDateString()))
                .AddStyle(styleText).AddStyle(styleCell);

            tableEvent.AddCell(cell);
            return tableEvent;
        }

    }

   

}