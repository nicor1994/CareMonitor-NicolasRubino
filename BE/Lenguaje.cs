﻿using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class Lenguaje
    {

        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value; }
        }

        private List<Etiqueta> _ListaEtiquetas;

        public List<Etiqueta> ListaEtiquetas
        {
            get { return _ListaEtiquetas; }
            set { _ListaEtiquetas = value; }
        }

        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }



    }
}
