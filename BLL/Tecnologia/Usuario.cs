﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Usuario
    {
        DAL.MP_Usuario MapperUsu = new DAL.MP_Usuario();
        Seguridad.DigitoVerificador GestorDigito = new Seguridad.DigitoVerificador();
        Permiso GestorPermiso = new Permiso();
        public BE.Usuario ObtenerUsuarioID(int id){


            BE.Usuario usu = MapperUsu.ObtenerUsuarioID(id);

            return usu;

        }

        public BE.Usuario Login(string usu, string pass)
        {

            BE.Usuario user = MapperUsu.Login(usu, pass);
            user.ListaPermisos = GestorPermiso.ListarPermisosdeUsuarios(user);
            //Aca debo buscar los permisos del usuario antes de retornar

            return user;
        }

        public bool RegistrarUsuario(BE.Usuario usu, BE.Usuario usuEnSesion)
        {
           
            usu.DVH = GestorDigito.GenerarDVH(usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString());
           
            int fa = MapperUsu.AgregarUsuario(usu);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Usuarios";
                bita.Accion = "Se dio de alta el usuario " + usu.Nombre + " " + usu.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public List<BE.Usuario> ListarTodos()
        {
            List<BE.Usuario> ListaUsuarios = MapperUsu.ListarUsuarios();
            return ListaUsuarios;
        }

        public List<BE.Usuario> ListarTodosBorrados()
        {
            List<BE.Usuario> ListaUsuarios = MapperUsu.ListarUsuariosTodos();
            foreach(BE.Usuario usu in ListaUsuarios)
            {
                usu.ListaPermisos = GestorPermiso.ListarPermisosdeUsuarios(usu);
            }

            return ListaUsuarios;
        }

        public int ComprobarIntegridad()
        {
            int RegistrosCorruptos = new int();
            string str = "";
            List<BE.Usuario> ListUsu = ListarTodos();
            foreach(BE.Usuario usu in ListUsu)
            {
                if(GestorDigito.VerificarIntegridadDVH((usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString()), usu.DVH) != true){

                    RegistrosCorruptos++;

                }

                str = str + usu.DVH.ToString();

            }

            str = (GestorDigito.GenerarDVH(str)).ToString(); ;

            string str2 = MapperUsu.ListarDVV();

            if (str != str2)
            {
               RegistrosCorruptos++;
            }
            return RegistrosCorruptos;
        }

        public bool ComprobarUsuarioEnSesion(List<int> ListaIds, BE.Usuario usu)
        {
            
            if (ListaIds.Contains(usu.ID)){
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool ComprobarDNI(int dni)
        {
            return MapperUsu.ComprobarDNI(dni);
        }

        public List<string> ListarNombresUsuario()
        {
            List<string> ListaNombre = new List<string>();

            foreach(BE.Usuario usu in this.ListarTodos())
            {
                ListaNombre.Add(usu.Nombre + " " + usu.Apellido);
            }
            ListaNombre.Add("Usuario no logeado");

            return ListaNombre;
        }

        public bool ModificarUsuario(BE.Usuario usu, BE.Usuario usuEnSesion)
        {

            usu.DVH = GestorDigito.GenerarDVH(usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString());
            int fa = MapperUsu.ModificarUsuario(usu);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Usuarios";
                bita.Accion = "Se modifico el usuario " + usu.Nombre + " " + usu.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public bool CambiarContraseña(BE.Usuario usu, BE.Usuario usuEnSesion)
        {

            usu.DVH = GestorDigito.GenerarDVH(usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString());
            int fa = MapperUsu.CambiarContraseña(usu);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Usuarios";
                bita.Accion = "Se modifico el usuario " + usu.Nombre + " " + usu.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public int BajaUsuario(BE.Usuario usu, BE.Usuario usuEnSesion)
        {
            usu.Borrado = 1;
            usu.DVH = GestorDigito.GenerarDVH(usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString());
            int fa = MapperUsu.BajaUsuario(usu);

            if (fa != -1)
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Usuarios";
                bita.Accion = "Se dio de baja el usuario " + usu.Nombre + " " + usu.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
            }

            return fa;
        }


        public bool ReestablecerContraseña(BE.Usuario usu, BE.Usuario usuEnSesion)
        {

            usu.DVH = GestorDigito.GenerarDVH(usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString());
            int fa = MapperUsu.CambiarContraseña(usu);
            if (fa == -1)
            {
                return false;
            }
            else
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();

                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuEnSesion.Nombre + " " + usuEnSesion.Apellido;
                bita.Tipo = "Gestion Usuarios";
                bita.Accion = "Se reestableció la contraseña del usuario " + usu.Nombre + " " + usu.Apellido;
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
                return true;
            }
        }

        public void RecalcularDVV(BE.Usuario usuario)
        {
            List<BE.Usuario> listausu = this.ListarTodos();
            string str = "";
            int dvv = new int();
            foreach (BE.Usuario usu in listausu)
            {               
                str = str + usu.DVH.ToString();       
            }
            dvv = GestorDigito.GenerarDVH(str);
          int fa =  MapperUsu.ActualizarDVV(dvv);
            if (fa!= -1)
            {
                BLL.Bitacora GestorBitacora = new BLL.Bitacora();
                BE.Bitacora bita = new BE.Bitacora();
                bita.Usuario = usuario.Nombre + " " + usuario.Apellido;
                bita.Tipo = "Dígito Verificador";
                bita.Accion = "Se recalculó el Dígito Verificador Vertical";
                bita.Fecha = DateTime.Now;
                GestorBitacora.RegistrarEnBitacora(bita);
            }
        }
        public void RecalcularDVH(BE.Usuario usuario)
        {
            List<BE.Usuario> listausu = this.ListarTodos();
            string str = "";
            foreach (BE.Usuario usu in listausu)
            {
                usu.DVH = GestorDigito.GenerarDVH(usu.Nombre + usu.Apellido + usu.DNI + usu.Contraseña + usu.Borrado + usu.Direccion + usu.FechaNacimiento.ToShortDateString());
                str = str + usu.DVH.ToString();
                this.ModificarUsuario(usu, usuario);
            }
            BLL.Bitacora GestorBitacora = new BLL.Bitacora();
            BE.Bitacora bita = new BE.Bitacora();
            bita.Usuario = usuario.Nombre + " " + usuario.Apellido;
            bita.Tipo = "Dígito Verificador";
            bita.Accion = "Se recalculó el Dígito Verificador Horizontal";
            bita.Fecha = DateTime.Now;
            GestorBitacora.RegistrarEnBitacora(bita);



        }

    }
}
