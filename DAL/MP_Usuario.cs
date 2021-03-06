﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class MP_Usuario
    {
        Acceso acc = new Acceso();
        public BE.Usuario ObtenerUsuarioID(int id)
        {

            acc.AbrirConexion();

            SqlParameter[] parametro = new SqlParameter[2];
            parametro[0] = acc.ArmarParametro("id", id, System.Data.SqlDbType.VarChar);
            parametro[1] = acc.ArmarParametro("Tabla", "Usuario", System.Data.SqlDbType.VarChar);


            DataTable tabla = acc.Leer("ObtenerEntidadID", parametro);
            acc.CerrarConexion();
            GC.Collect();
            BE.Usuario usu = new BE.Usuario();
            foreach (DataRow linea in tabla.Rows)
            {

                usu.ID = (int)linea["ID"];
                usu.Nombre = (string)linea["Nombre"];
                usu.Apellido = (string)linea["Apellido"];
                usu.Contraseña = (string)linea["Contraseña"];
                usu.DVH = (int)linea["DVH"];
                usu.Direccion = (string)linea["Direccion"];
                usu.FechaNacimiento = DateTime.Parse(linea["FechaDeNacimiento"].ToString());
                usu.DNI = (int)linea["DNI"];
            }
            return usu;
        }

        public BE.Usuario Login(string user, string pass)
        {

            acc.AbrirConexion();

            SqlParameter[] parametro = new SqlParameter[2];
            parametro[0] = acc.ArmarParametro("dni", user, System.Data.SqlDbType.Int);
            parametro[1] = acc.ArmarParametro("pass", pass, System.Data.SqlDbType.VarChar);


            DataTable tabla = acc.Leer("Usuario_Obtener", parametro);
            acc.CerrarConexion();
            GC.Collect();
            BE.Usuario usu = new BE.Usuario();
            foreach (DataRow linea in tabla.Rows)
            {
                if ((int)linea["Borrado"] == 0)
                {
                    usu.ID = (int)linea["ID"];
                    usu.Nombre = (string)linea["Nombre"];
                    usu.Apellido = (string)linea["Apellido"];
                    usu.Contraseña = (string)linea["Contraseña"];
                    usu.DVH = (int)linea[7];
                    usu.Direccion = (string)linea["Direccion"];
                    usu.FechaNacimiento = DateTime.Parse(linea["FechaDeNacimiento"].ToString());
                    usu.DNI = (int)linea["DNI"];
                    if ((int)linea["PrimerInicio"] == 1)
                    {
                        usu.PrimerInicio = true;
                    }
                    else { usu.PrimerInicio = false; }
                }
            }
            return usu;
        }

        public int AgregarUsuario(BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[8];
            parametros[0] = acc.ArmarParametro("nombre", usu.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("apellido", usu.Apellido, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("dni", usu.DNI, System.Data.SqlDbType.Int);
            parametros[3] = acc.ArmarParametro("pass", usu.Contraseña, System.Data.SqlDbType.VarChar);
            parametros[4] = acc.ArmarParametro("borrado", usu.Borrado, System.Data.SqlDbType.Int);
            parametros[5] = acc.ArmarParametro("dvh", usu.DVH, System.Data.SqlDbType.VarChar);
            parametros[6] = acc.ArmarParametro("dir", usu.Direccion, System.Data.SqlDbType.VarChar);
            parametros[7] = acc.ArmarParametro("fechanac", usu.FechaNacimiento, System.Data.SqlDbType.Date);

            fa = acc.Escribir("Usuario_Agregar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }
        
        public List<BE.Usuario> ListarUsuarios()
        {
         
                List<BE.Usuario> ListaUsuario = new List<BE.Usuario>();
                acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "Usuario", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
                acc.CerrarConexion();
                GC.Collect();
                foreach (DataRow linea in Tabla.Rows)
                {
                    BE.Usuario usu = new BE.Usuario();

                usu.ID = (int)linea["ID"];
                usu.Nombre = (string)linea["Nombre"];
                usu.Apellido = (string)linea["Apellido"];
                usu.DNI = (int)linea["DNI"];
                usu.Contraseña = (string)linea["Contraseña"];
                usu.Borrado = (int)linea["Borrado"];
                usu.DVH = (int)linea["DVH"];
                usu.Direccion = (string)linea["Direccion"];
                usu.FechaNacimiento = DateTime.Parse(linea["FechaDeNacimiento"].ToString());
                if ((int)linea["PrimerInicio"] == 1)
                {
                    usu.PrimerInicio = true;
                }
                else { usu.PrimerInicio = false; }


                ListaUsuario.Add(usu);

                }
                return ListaUsuario;
            
        }

        public List<BE.Usuario> ListarUsuariosTodos()
        {

            List<BE.Usuario> ListaUsuario = new List<BE.Usuario>();
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "Usuario", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                if ((int)linea["Borrado"] == 0)
                {
                    BE.Usuario usu = new BE.Usuario();


                    usu.ID = (int)linea["ID"];
                    usu.Nombre = (string)linea["Nombre"];
                    usu.Apellido = (string)linea["Apellido"];
                    usu.DNI = (int)linea["DNI"];
                    usu.Contraseña = (string)linea["Contraseña"];
                    usu.Borrado = (int)linea["Borrado"];
                    usu.DVH = (int)linea["DVH"];
                    usu.Direccion = (string)linea["Direccion"];
                    usu.FechaNacimiento = DateTime.Parse(linea["FechaDeNacimiento"].ToString());
                    if ((int)linea["PrimerInicio"] == 1)
                    {
                        usu.PrimerInicio = true;
                    }
                    else { usu.PrimerInicio = false; }


                    ListaUsuario.Add(usu);

                }
            }
            return ListaUsuario;

        }

        public string ListarDVV()
        {

            string str = "";
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("tabla", "DigitoVerificadorVertical", System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ListarEntidad", parametros);
            acc.CerrarConexion();
            GC.Collect();
            foreach (DataRow linea in Tabla.Rows)
            {
                if ((string)linea["Nombre_Tabla"] == "Usuario") { 
                str = (string)linea["DVV"];
                }
            }
            return str;

        }

        public bool ComprobarDNI(int dni)
        {

           
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[1];
            parametros[0] = acc.ArmarParametro("dni", dni, System.Data.SqlDbType.VarChar);

            DataTable Tabla = acc.Leer("ComprobarDni", parametros);
            acc.CerrarConexion();
            GC.Collect();
           
            if (Tabla.Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }

        public int ModificarUsuario(BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[8];
            parametros[0] = acc.ArmarParametro("nombre", usu.Nombre, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("apellido", usu.Apellido, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("dni", usu.DNI, System.Data.SqlDbType.Int);            
            parametros[3] = acc.ArmarParametro("borrado", usu.Borrado, System.Data.SqlDbType.Int);
            parametros[4] = acc.ArmarParametro("dvh", usu.DVH, System.Data.SqlDbType.VarChar);
            parametros[5] = acc.ArmarParametro("dir", usu.Direccion, System.Data.SqlDbType.VarChar);
            parametros[6] = acc.ArmarParametro("fechanac", usu.FechaNacimiento, System.Data.SqlDbType.Date);
            parametros[7] = acc.ArmarParametro("id", usu.ID, System.Data.SqlDbType.Int);
            fa = acc.Escribir("Usuario_Modificar", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int CambiarContraseña(BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = acc.ArmarParametro("contra", usu.Contraseña, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("dvh", usu.DVH, System.Data.SqlDbType.VarChar);          
            parametros[2] = acc.ArmarParametro("id", usu.ID, System.Data.SqlDbType.Int);
            fa = acc.Escribir("Usuario_CambiarContraseña", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int ReestablecerContraseña(BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[0] = acc.ArmarParametro("contra", usu.Contraseña, System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("dvh", usu.DVH, System.Data.SqlDbType.VarChar);
            parametros[2] = acc.ArmarParametro("id", usu.ID, System.Data.SqlDbType.Int);
            fa = acc.Escribir("Usuario_ReestablecerContraseña", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int BajaUsuario(BE.Usuario usu)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[2];           
            parametros[0] = acc.ArmarParametro("id", usu.ID, System.Data.SqlDbType.Int);
            parametros[1] = acc.ArmarParametro("dvh", usu.DVH, System.Data.SqlDbType.VarChar);
            fa = acc.Escribir("Usuario_Baja", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

        public int ActualizarDVV(int dvv)
        {
            int fa = 0;
            acc.AbrirConexion();
            SqlParameter[] parametros = new SqlParameter[2];
            parametros[0] = acc.ArmarParametro("tabla", "Usuario", System.Data.SqlDbType.VarChar);
            parametros[1] = acc.ArmarParametro("dvv", dvv, System.Data.SqlDbType.Int);          
            fa = acc.Escribir("ActualizarDVV", parametros);
            acc.CerrarConexion();
            GC.Collect();
            return fa;
        }

    }
}
