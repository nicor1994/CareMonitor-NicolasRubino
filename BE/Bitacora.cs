using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace BE
{
    public class Bitacora
    {

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

        private string _usu;

        public string Usuario
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

        private string _tipo;

        public string Tipo
        {
            get { return _tipo; }
            set { _tipo = value; }
        }

    }
}
