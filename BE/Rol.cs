using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        private int _ID;

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

    }
}
