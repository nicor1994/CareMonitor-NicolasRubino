using System;

namespace BE
{
    public class Bitacora
    {

        private Usuario _usu;

        public Usuario Usuario
        {
            get { return _usu; }
            set { _usu = value; }
        }

        private DateTime _Fecha;

        public DateTime Fecha
        {
            get { return _Fecha; }
            set { _Fecha = value; }
        }

        private string _accion;

        public string Accion
        {
            get { return _accion; }
            set { _accion = value; }
        }


    }
}
