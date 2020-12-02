using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUI
{
    public class Traductor
    {
        BLL.Traductor GestorIdioma = new BLL.Traductor();
        public void Traducir(Control control, BE.Lenguaje Idioma)
        {
            if (control == null || control.ID == null)
                return;
            if (control is TextBox)
                return;
            if (control is DropDownList)
                return;
            if (control is RequiredFieldValidator)
                return;
            if (control is ListBox)
                return;
            if (control is Calendar)
                return;
            if (control is GridView)
                return;
            if (control is System.Web.UI.DataVisualization.Charting.Chart)
                return;
            if (control is System.Web.UI.DataVisualization.Charting.Series)
                return;
            if (control is System.Web.UI.DataVisualization.Charting.ChartArea)
                return;
            //if (control is Microsoft.Reporting.WebForms.ReportViewer)
            //    return;
            if (control is System.Web.UI.ScriptManager)
                return;
            if (control is System.Web.UI.WebControls.ImageButton)
                return;
            if (control is System.Web.UI.WebControls.HiddenField)
                return;

            
            string tradu = GestorIdioma.Traducir(control.ID, Idioma);
            if (string.IsNullOrWhiteSpace(tradu))
                return;
            if (control is Label _lbl)
                _lbl.Text = tradu;
            if (control is HyperLink _link)
                _link.Text = tradu;
            if (control is LinkButton _link2)
                _link2.Text = tradu;
            if (control is Button _btn)
                _btn.Text = tradu;
        }
    }
}