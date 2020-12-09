using iText.Kernel.Pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using iText.IO.Font.Constants;
using iText.Kernel;
using iText.Kernel.Colors;
using iText.Kernel.Events;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.Layout;
using iText.Layout.Borders;
using iText.Layout.Element;
using iText.Layout.Properties;
using Image = iText.Layout.Element.Image;


namespace GUI.Forms
{
    public partial class Alarmas : System.Web.UI.Page
    {
        BLL.Alarma GestorAlarma = new BLL.Alarma();
        List<BE.Alarma> ListaAlarma = new List<BE.Alarma>();
        List<BE.Medicion> ListaMediciones = new List<BE.Medicion>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];
            if (usu.ListaPermisos.Find(x => x.ID == 8) != null)
            {
                if (!IsPostBack)
                {



                    ListaAlarma = GestorAlarma.ListarAlarmas();
                    Session["ListaAlarmas"] = ListaAlarma;
                    listAlarmas.DataSource = null;
                    listAlarmas.DataSource = ListaAlarma;
                    listAlarmas.DataBind();




                }
                ListaAlarma = (List<BE.Alarma>)Session["ListaAlarmas"];
            }
            else
            {
                Response.Redirect("SinPermisos.aspx");
            }
        }

        protected void listAlarmas_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListaMediciones = ListaAlarma[listAlarmas.SelectedIndex].Mediciones;

            listMediciones.DataSource = null;
            listMediciones.DataSource = ListaMediciones;
            listMediciones.DataBind();
        }

        protected void listMediciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            BE.Medicion med = ListaAlarma[listAlarmas.SelectedIndex].Mediciones[listMediciones.SelectedIndex];

            lblNombre.Text = med.Tipo.Nombre;
            lblDescripcion.Text = med.Tipo.Descripcion;
            lblDescripcionMax.Text = med.Tipo.DescripcionMaxima;
            lblDescMin.Text = med.Tipo.DescripcionMinima;
            lblValMaxMasc.Text = med.Tipo.MaximoMasculino.ToString();
            lblValMinMasc.Text = med.Tipo.MinimoMasculino.ToString();

            BE.Usuario usu = ListaAlarma[listAlarmas.SelectedIndex].Usuario;

            grafico.Visible = true;

            

            grafico.ChartAreas["Area"].AxisX.Minimum = 0;
            grafico.ChartAreas["Area"].AxisX.Maximum = 100;
            grafico.ChartAreas["Area"].AxisY.Name = "Medición";
            grafico.ChartAreas["Area"].AxisY.IsStartedFromZero = false;
            

            grafico.Series.Add("Min");
            grafico.Series.Add("Max");
            grafico.Series.Add(usu.Apellido + ", " + usu.Nombre);           
         

            grafico.Series["Min"].Points.AddXY(0, med.Tipo.MinimoMasculino);           
            grafico.Series["Min"].Points.AddXY(100, med.Tipo.MinimoMasculino);
            grafico.Series["Min"].Label = "Min";
            grafico.Series["Min"].BorderWidth = 5;
            grafico.Series["Max"].Points.AddXY(0, med.Tipo.MaximoMasculino);
            grafico.Series["Max"].Points.AddXY(100, med.Tipo.MaximoMasculino);
            grafico.Series["Max"].Label = "Max";
            grafico.Series["Max"].BorderWidth = 5;

            grafico.Series["Max"].Color = System.Drawing.Color.Red;
            grafico.Series["Min"].Color = System.Drawing.Color.Aqua;
            grafico.Series[usu.Apellido + ", " + usu.Nombre].Color = System.Drawing.Color.Green;

            grafico.Series[usu.Apellido + ", " + usu.Nombre].Points.AddXY(0, med.Valor);
            grafico.Series[usu.Apellido + ", " + usu.Nombre].Points.AddXY(100, med.Valor);
            grafico.Series[usu.Apellido + ", " + usu.Nombre].Label = "Medición";
            grafico.Series[usu.Apellido + ", " + usu.Nombre].BorderWidth = 5;

            grafico.Series["Min"].YValueMembers = "Min";
            grafico.Series["Max"].YValueMembers = "Max";
            grafico.Series[usu.Apellido + ", " + usu.Nombre].YValueMembers = "Medición";

            grafico.Series["Min"].LegendText = "Min";
            grafico.Series["Max"].LegendText = "Max";
            grafico.Series[usu.Apellido + ", " + usu.Nombre].LegendText = "Medición";

            grafico.Series["Min"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            grafico.Series["Max"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            grafico.Series[usu.Apellido + ", " + usu.Nombre].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;

        }

        protected void btnEvolucionar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BE.Alarma alarma = ListaAlarma[listAlarmas.SelectedIndex];

                alarma.Evolucion = txtEvolucion.Text;
                if (GestorAlarma.Evolucionar(alarma) != -1)
                {
                    lblSuccess.Text = "Alarma Evolucionada!";
                    lblSuccess.Visible = true;
                    lblSuccess.CssClass = "alert alert-success";
                }
                else
                {
                    lblSuccess.Text = "Ocurrio un error al evolucionar!";
                    lblSuccess.Visible = true;
                    lblSuccess.CssClass = "alert alert-danger";
                }

            }
        }

        protected void btnGenerarExcel_Click(object sender, EventArgs e)
        {

            BE.Alarma alarma = ListaAlarma[listAlarmas.SelectedIndex];

            ClosedXML.Excel.XLWorkbook wrkbook = new ClosedXML.Excel.XLWorkbook();

            var worksheet = wrkbook.Worksheets.Add("Reporte");
            var currentRow = 1;
            worksheet.Cell(currentRow, 1).Value = "CareMonitor";

            currentRow = 3;
            worksheet.Cell(currentRow, 1).Value = "Fecha: " + DateTime.Now.ToShortDateString();

            currentRow = 5;
            worksheet.Cell(currentRow, 1).Value = "Medición de " + alarma.Usuario.Nombre + " " + alarma.Usuario.Apellido + " del " + alarma.Fecha;

            currentRow = 7;
            worksheet.Cell(currentRow, 1).Value = "Medición";
            worksheet.Cell(currentRow, 2).Value = "Valor";
            worksheet.Cell(currentRow, 3).Value = "Máximo";
            worksheet.Cell(currentRow, 4).Value = "Mínimo";


            List<BE.Medicion> ListaMediciones = ListaAlarma[listAlarmas.SelectedIndex].Mediciones;

            foreach (BE.Medicion bit in ListaMediciones)
            {
                currentRow++;
                worksheet.Cell(currentRow, 1).Value = bit.Tipo.Nombre;
                worksheet.Cell(currentRow, 2).Value = bit.Valor;
                worksheet.Cell(currentRow, 3).Value = bit.Tipo.MaximoMasculino;               
                worksheet.Cell(currentRow, 4).Value = bit.Tipo.MinimoMasculino;
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
            BE.Alarma alarma = ListaAlarma[listAlarmas.SelectedIndex];
         

            MemoryStream ms = new MemoryStream();
            PdfWriter pw = new PdfWriter(ms);
            PdfDocument pdf = new PdfDocument(pw);
            Document doc = new Document(pdf, PageSize.A4);
            doc.SetMargins(75, 35, 70, 35);
            string pathLogo = Server.MapPath("../Imagenes/Care Monitor.jpg");
            iText.Layout.Element.Image img = new iText.Layout.Element.Image(iText.IO.Image.ImageDataFactory.Create(pathLogo));

            pdf.AddEventHandler(PdfDocumentEvent.START_PAGE, new HeaderEventHandler(img));


            iText.Layout.Element.Table tabla = new iText.Layout.Element.Table(1).UseAllAvailableWidth();
            Cell cell = new Cell().Add(new Paragraph("Medición de " + alarma.Usuario.Nombre + " "+ alarma.Usuario.Apellido + " del " + alarma.Fecha).SetFontSize(14)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                .SetBorder(Border.NO_BORDER));
            tabla.AddCell(cell);

            doc.Add(tabla);

            iText.Layout.Style styleCell = new iText.Layout.Style()
                .SetBackgroundColor(ColorConstants.LIGHT_GRAY)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER);

            iText.Layout.Element.Table _tabla = new iText.Layout.Element.Table(4).UseAllAvailableWidth();
            Cell _cell = new Cell().Add(new Paragraph("Medición"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
          
            _cell = new Cell().Add(new Paragraph("Valor"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Máximo"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Mínimo"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));



            
            List<BE.Medicion> ListaMediciones = ListaAlarma[listAlarmas.SelectedIndex].Mediciones;

            foreach (BE.Medicion med in ListaMediciones)
            {
                _cell = new Cell().Add(new Paragraph(med.Tipo.Nombre));
                _tabla.AddCell(_cell); 
                
                if(med.Valor < med.Tipo.MinimoMasculino || med.Valor > med.Tipo.MaximoMasculino)
                {
                    _cell = new Cell().Add(new Paragraph(med.Valor.ToString()));
                    _tabla.AddCell(_cell.SetBackgroundColor(ColorConstants.RED));
                }
                else
                {
                _cell = new Cell().Add(new Paragraph(med.Valor.ToString()));
                _tabla.AddCell(_cell);
                }
            

                _cell = new Cell().Add(new Paragraph(med.Tipo.MaximoMasculino.ToString()));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(med.Tipo.MinimoMasculino.ToString()));
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