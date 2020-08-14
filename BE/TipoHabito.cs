using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class TipoHabito
    {
        private int _ValorRef;

        public int ValorReferencia
        {
            get { return _ValorRef; }
            set { _ValorRef = value; }
        }


        private string _Nombre;

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        private string _EfeNegativo;

        public string EfectoNegativo
        {
            get { return _EfeNegativo; }
            set { _EfeNegativo = value; }
        }

        private string _EfeAfirmativo;

        public string EfectoAfirmativo
        {
            get { return _EfeAfirmativo; }
            set { _EfeAfirmativo = value; }
        }



    }
}
