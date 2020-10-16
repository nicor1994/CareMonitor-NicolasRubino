using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Sintoma
    {

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

        private BE.TipoMedicion _Sintoma;

        public BE.TipoMedicion pSintoma
        {
            get { return _Sintoma; }
            set { _Sintoma = value; }
        }

        private bool Max;

        public bool Maximo
        {
            get { return Max; }
            set { Max = value; }
        }

        private string getMax()
        {
            if (this.Maximo == true)
            {
                return "Maximo";
            }
            else
            {
                return "Minimo";
            }
        }
        public override string ToString()
        {
            return pSintoma.Nombre + " - " + getMax() ;
        }

    }
}
