using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class Calendario
    {

        private List<Evento> _ListaEventos;

        public List<Evento> ListaEventos
        {
            get { return _ListaEventos; }
            set { _ListaEventos = value; }
        }


    }
}
