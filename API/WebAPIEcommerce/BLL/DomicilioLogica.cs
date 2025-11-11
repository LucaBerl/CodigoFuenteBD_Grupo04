using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;

namespace WebAPIEcommerce.BLL
{
    public class DomicilioLogica
    {
        private DomicilioDatos _domicilioDatos = new DomicilioDatos();

        public void EliminarDomicilio(int idDomicilio, int idCliente)
        {
            if (idDomicilio <= 0 || idCliente <= 0)
            {
                throw new Exception("Los IDs de domicilio y cliente deben ser válidos.");
            }
            _domicilioDatos.EliminarDomicilio(idDomicilio, idCliente);
        }
    }
}