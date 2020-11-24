using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    public class Evento
    {

        private string _Titulo;

        public string Titulo
        {
            get { return _Titulo; }
            set { _Titulo = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private string _Descripcion;

        public string Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }
        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }


    }
}
