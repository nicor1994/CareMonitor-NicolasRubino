using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    class Habito
    {

        private int _ValorXSemana;

        public int ValorxSemana
        {
            get { return _ValorXSemana; }
            set { _ValorXSemana = value; }
        }

        private TipoHabito _habito;

        public TipoHabito TipoHabito
        {
            get { return _habito; }
            set { _habito = value; }
        }
        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }


    }
}
