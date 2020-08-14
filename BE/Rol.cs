using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class Rol
    {

        private List<Permiso> _ListaPermisos;

        public List<Permiso> ListaPermisos
        {
            get { return _ListaPermisos; }
            set { _ListaPermisos = value; }
        }

    }
}
