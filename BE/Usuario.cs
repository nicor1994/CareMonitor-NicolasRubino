using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Usuario
    {

        private string _Nombre;

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        private string _Apellido;

        public string Apellido
        {
            get { return _Apellido; }
            set { _Apellido = value; }
        }


        private string _Sexo;

        public string Sexo
        {
            get { return _Sexo; }
            set { _Sexo = value; }
        }

        private string _Direccion;

        public string Direccion
        {
            get { return _Direccion; }
            set { _Direccion = value; }
        }

        private int _DNI;

        public int DNI
        {
            get { return _DNI; }
            set { _DNI = value; }
        }

        private List<BE.Permiso> _ListaPermisos;

        public List<BE.Permiso> ListaPermisos
        {
            get { return _ListaPermisos; }
            set { _ListaPermisos = value; }
        }

        private string _Lenguaje;

        public string Lenguaje
        {
            get { return _Lenguaje; }
            set { _Lenguaje = value; }
        }

        private int _id;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        private int _dvh;

        public int DVH
        {
            get { return _dvh; }
            set { _dvh = value; }
        }

        private string _Contraseña;

        public string Contraseña
        {
            get { return _Contraseña; }
            set { _Contraseña = value; }
        }

        private int _Borrado;

        public int Borrado
        {
            get { return _Borrado; }
            set { _Borrado = value; }
        }


        public override string ToString()
        {
            return Nombre + " " + Apellido;
        }

    }
}
