using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    class Etiqueta
    {

        private string _Traduccion;

        public string Traduccion
        {
            get { return _Traduccion; }
            set { _Traduccion = value; }
        }

        private string _texto;

        public string Texto
        {
            get { return _texto; }
            set { _texto = value; }
        }

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }


    }
}
