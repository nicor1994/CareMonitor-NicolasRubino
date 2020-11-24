using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    public class Etiqueta
    {

        private string _Traduccion;

        public string Traduccion
        {
            get { return _Traduccion; }
            set { _Traduccion = value; }
        }

        private string _NombreControl;

        public string NombreControl
        {
            get { return _NombreControl; }
            set { _NombreControl = value; }
        }

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }


    }
}
