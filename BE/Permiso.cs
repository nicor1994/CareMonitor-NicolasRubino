using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Permiso
    {

        private int _id;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private string _Nombre;

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }


    }
}
