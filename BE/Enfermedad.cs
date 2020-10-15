using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Enfermedad
    {
        private int _Id;

        public int ID
        {
            get { return _Id; }
            set { _Id = value; }
        }

        private string _Nombre;

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        private List<BE.TipoMedicion> _Sintomas;

        public List<BE.TipoMedicion> Sintomas
        {
            get { return _Sintomas; }
            set { _Sintomas = value; }
        }

        private List<BE.TipoHabito> _MalosHabitos;

        public List<BE.TipoHabito> MalosHabitos
        {
            get { return _MalosHabitos; }
            set { _MalosHabitos = value; }
        }


    }
}
