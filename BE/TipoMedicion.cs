using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{ 
        public class TipoMedicion
        {

            private string _Nombre;

            public string Nombre
            {
                get { return _Nombre; }
                set { _Nombre = value; }
            }

            private float _MinMasc;

            public float MinimoMasculino
            {
                get { return _MinMasc; }
                set { _MinMasc = value; }
            }

            private float _MinFem;

            public float MinimoFemenino
            {
                get { return _MinFem; }
                set { _MinFem = value; }
            }


            private float _MaxMasc;

            public float MaximoMasculino
            {
                get { return _MaxMasc; }
                set { _MaxMasc = value; }
            }

            private float _MaxFem;

            public float MaximoFemenino
            {
                get { return _MaxFem; }
                set { _MaxFem = value; }
            }

            private string Descmin;

            public string DescripcionMinima
            {
                get { return Descmin; }
                set { Descmin = value; }
            }

            private string _DescMax;

            public string DescripcionMaxima
            {
                get { return _DescMax; }
                set { _DescMax = value; }
            }

            private string _Descripcion;

            public string Descripcion
            {
                get { return _Descripcion; }
                set { _Descripcion = value; }
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



