using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class TipoServicio
    {

        private string _Descripcion;

        public string Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }


        private string _Nombre;

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }


        private DateTime _TiempoMedio;

        public DateTime TiempoMedio
        {
            get { return _TiempoMedio; }
            set { _TiempoMedio = value; }
        }


    }
}
