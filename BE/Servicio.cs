using System;
using System.Collections.Generic;
using System.Text;

namespace BE
{
    class Servicio
    {

        private BE.Usuario _usu;

        public BE.Usuario Usuario
        {
            get { return _usu; }
            set { _usu = value; }
        }

        private BE.TipoServicio _TipoServ;

        public BE.TipoServicio TipoServicio
        {
            get { return _TipoServ; }
            set { _TipoServ = value; }  
        }

        private DateTime _FechaPedido;

        public DateTime FechaPedido
        {
            get { return _FechaPedido; }
            set { _FechaPedido = value; }
        }

        private DateTime _FechaServicio;

        public DateTime FechaServicio
        {
            get { return _FechaServicio; }
            set { _FechaServicio = value; }
        }

        private BE.Empleado _Emp;

        public BE.Empleado Empleado
        {
            get { return _Emp; }
            set { _Emp = value; }
        }

    }
}
