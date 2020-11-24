using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BE
{
    public class Lenguaje
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

        public override string ToString()
        {
            return Nombre;
        }

    }
}
