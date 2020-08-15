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


    }
}
