using System;
using System.Collections.Generic;
using System.Text;

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

    }
}
