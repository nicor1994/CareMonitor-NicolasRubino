﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Alarma
    {

        private Usuario _usu;

        public Usuario Usuario
        {
            get { return _usu; }
            set { _usu = value; }
        }

        private List<Medicion> _mediciones;

        public List<Medicion> Mediciones
        {
            get { return _mediciones; }
            set { _mediciones = value; }
        }

        private DateTime _fecha;

        public DateTime Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private string _evolucion;

        public string Evolucion
        {
            get { return _evolucion; }
            set { _evolucion = value; }
        }

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

        public override string ToString()
        {
            return Usuario.Apellido + " - " + Fecha.ToString("f");
        }

    }
}
