﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
namespace BLL
{
    public class Bitacora
    {
        DAL.MP_Bitacora GestorBitacora = new DAL.MP_Bitacora();
        BLL.Usuario GestorUsuario = new Usuario();
        
        public void RegistrarEnBitacora(BE.Bitacora bitacora)
        {
            GestorBitacora.GuardarBitacora(bitacora);
        }

        public List<BE.Bitacora> ListarBitacora()
        {

            return GestorBitacora.ListarBitacora();


        }
        public DataTable ListarBitacoraReporte()
        {
            return GestorBitacora.ListarBitacoraReporte();
        }

        public List<string> ListarTipos(List<BE.Bitacora> listabit)
        {
            List<string> ListaTipos = new List<string>();

            foreach (BE.Bitacora bit in listabit)
            {
                if (ListaTipos.Contains(bit.Tipo) == false)
                {
                    ListaTipos.Add(bit.Tipo);
                }
            }
            
            return ListaTipos;
        }

    }
}