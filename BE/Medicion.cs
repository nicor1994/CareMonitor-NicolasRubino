using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    class Medicion
    {

        private float _valor;

        public float Valor
        {
            get { return _valor; }
            set { _valor = value; }
        }

        private TipoMedicion _Tipo;

        public TipoMedicion Tipo
        {
            get { return _Tipo; }
            set { _Tipo = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }


    }
}
