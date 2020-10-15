using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class TipoHabito
    {
        private int _ValorRef;

        public int ValorPositivo
        {
            get { return _ValorRef; }
            set { _ValorRef = value; }
        }

        private int _ValorNegativo;

        public int ValorNegativo
        {
            get { return _ValorNegativo; }
            set { _ValorNegativo = value; }
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

        public string EfectoPositivo
        {
            get { return _EfeAfirmativo; }
            set { _EfeAfirmativo = value; }
        }

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

        public override string ToString()
        {
            return Nombre;
        }

    }
}
