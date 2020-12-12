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
    public partial class MedicionesUsuario : System.Web.UI.Page
    {
        BLL.Medicion GestorMedicion = new BLL.Medicion();
        List<BE.Medicion> ListaMediciones = new List<BE.Medicion>();
        List<BE.Alarma> ListaAlarmas = new List<BE.Alarma>();
        BLL.Alarma GestorAlarmas = new BLL.Alarma();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListaMediciones = GestorMedicion.Listar((BE.Usuario)Session["UsuarioEnSesion"]);
                Session["ListaMediciones"] = ListaMediciones;

                ListaAlarmas = GestorAlarmas.ListarAlarmasID((BE.Usuario)Session["UsuarioEnSesion"]);
                Session["ListaAlarmas"] = ListaAlarmas;


                listAlarmas.DataSource = null;
                listAlarmas.DataSource = ListaAlarmas;
                listAlarmas.DataBind();
                gridMediciones.DataSource = null;
                gridMediciones.DataSource = ListaMediciones;
                gridMediciones.DataBind();
            }
            ListaMediciones = (List<BE.Medicion>)Session["ListaMediciones"];
            ListaAlarmas = (List<BE.Alarma>)Session["ListaAlarmas"];
        }

        protected void listMediciones_SelectedIndexChanged(object sender, EventArgs e)
        {
           
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

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            iText.Layout.Element.Table tabla = new iText.Layout.Element.Table(1).UseAllAvailableWidth();
            Cell cell = new Cell().Add(new Paragraph("Mediciones de " + usu.Nombre + " " + usu.Apellido).SetFontSize(14)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER)
                .SetBorder(Border.NO_BORDER));
            tabla.AddCell(cell);

            doc.Add(tabla);

            iText.Layout.Style styleCell = new iText.Layout.Style()
                .SetBackgroundColor(ColorConstants.LIGHT_GRAY)
                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER);

            iText.Layout.Element.Table _tabla = new iText.Layout.Element.Table(5).UseAllAvailableWidth();
            Cell _cell = new Cell().Add(new Paragraph("Fecha"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Tipo"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Valor"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Máximo"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));
            _cell = new Cell().Add(new Paragraph("Mínimo"));
            _tabla.AddHeaderCell(_cell.AddStyle(styleCell));



            

            foreach (BE.Medicion bit in ListaMediciones)
            {
                _cell = new Cell().Add(new Paragraph(bit.Fecha.ToString("g")));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Tipo.Nombre));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Valor.ToString()));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Tipo.MaximoMasculino.ToString()));
                _tabla.AddCell(_cell);
                _cell = new Cell().Add(new Paragraph(bit.Tipo.MinimoMasculino.ToString()));
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

            var worksheet = wrkbook.Worksheets.Add("Mediciones");
            var currentRow = 1;
            worksheet.Cell(currentRow, 1).Value = "CareMonitor";

            currentRow = 3;
            worksheet.Cell(currentRow, 1).Value = "Fecha: " + DateTime.Now.ToShortDateString();

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            currentRow = 5;
            worksheet.Cell(currentRow, 1).Value = "Mediciones de " + usu.Nombre + " " + usu.Apellido;

            currentRow = 7;
            worksheet.Cell(currentRow, 1).Value = "Fecha";
            worksheet.Cell(currentRow, 2).Value = "Tipo";
            worksheet.Cell(currentRow, 3).Value = "Valor";
            worksheet.Cell(currentRow, 4).Value = "Máximo";
            worksheet.Cell(currentRow, 5).Value = "Mínimo";


           

            foreach (BE.Medicion bit in ListaMediciones)
            {
                currentRow++;
                worksheet.Cell(currentRow, 1).Value = bit.Fecha.ToShortDateString();
                worksheet.Cell(currentRow, 2).Value = bit.Tipo.Nombre;
                worksheet.Cell(currentRow, 3).Value = bit.Valor;
                worksheet.Cell(currentRow, 4).Value = bit.Tipo.MaximoMasculino;
                worksheet.Cell(currentRow, 5).Value = bit.Tipo.MinimoMasculino;
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

        protected void gridMediciones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridMediciones.PageIndex = e.NewPageIndex;
            gridMediciones.DataSource = null;
            gridMediciones.DataSource = (List<BE.Medicion>)Session["ListaMediciones"];
            gridMediciones.DataBind();
        }

        protected void gridMediciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            BE.Medicion med = ListaMediciones[gridMediciones.SelectedRow.RowIndex];

            lblNombre.Text = med.Tipo.Nombre;
            lblDescripcion.Text = med.Tipo.Descripcion;
            lblDescripcionMax.Text = med.Tipo.DescripcionMaxima;
            lblDescMin.Text = med.Tipo.DescripcionMinima;
            lblValMaxMasc.Text = med.Tipo.MaximoMasculino.ToString();
            lblValMinMasc.Text = med.Tipo.MinimoMasculino.ToString();

            BE.Usuario usu = (BE.Usuario)Session["UsuarioEnSesion"];

            grafico.Visible = true;
            graficoPromedio.Visible = true;
            lblMedicionHistorica.Visible = true;
            lblMedicionSeleccionada.Visible = true;

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

       
            graficoPromedio.ChartAreas["Area2"].AxisY.Name = "Medición";
            graficoPromedio.ChartAreas["Area2"].AxisY.IsStartedFromZero = false;
           
            int i = 0;
            graficoPromedio.Series.Add("Prueba");
            graficoPromedio.Series.Add("Min");            
            graficoPromedio.Series.Add("Max");
           
            graficoPromedio.Series["Max"].Color = System.Drawing.Color.Red;
            graficoPromedio.Series["Min"].Color = System.Drawing.Color.Aqua;
            graficoPromedio.Series["Max"].BorderWidth = 5;
            graficoPromedio.Series["Min"].BorderWidth = 5;
            graficoPromedio.Series["Prueba"].XValueType = System.Web.UI.DataVisualization.Charting.ChartValueType.Date;
            foreach (BE.Medicion medi in ListaMediciones)
            {
                if (medi.Tipo.ID == med.Tipo.ID)
                {
                    i++;                                     
                    graficoPromedio.Series["Prueba"].Points.AddXY(medi.Fecha, medi.Valor);
                    graficoPromedio.Series["Min"].Points.AddXY(medi.Fecha, med.Tipo.MinimoMasculino);
                    graficoPromedio.Series["Max"].Points.AddXY(medi.Fecha, med.Tipo.MaximoMasculino);

                }
            }
            graficoPromedio.Series["Prueba"].BorderWidth = 5;
            graficoPromedio.Series["Prueba"].Color = System.Drawing.Color.Green;
            graficoPromedio.Series["Prueba"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            graficoPromedio.Series["Max"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;
            graficoPromedio.Series["Min"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Line;

           
        }
    }
}