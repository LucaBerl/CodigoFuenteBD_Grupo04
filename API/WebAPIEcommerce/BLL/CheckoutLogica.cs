using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.BLL
{
    public class CheckoutLogica
    {
        private CheckoutDatos _checkoutDatos = new CheckoutDatos();

        public void ProcesarPago(RegistrarPagoRequest request)
        {
            
            if (request.Monto <= 0)
            {
                throw new Exception("El monto del pago debe ser positivo.");
            }

            if (string.IsNullOrEmpty(request.MetodoPago))
            {
                throw new Exception("El método de pago es requerido.");
            }

            // Llamamos a la DAL con el IDDomicilio (que puede ser null)
            _checkoutDatos.RegistrarPago(
                request.IDPedido,
                request.MetodoPago,
                request.Monto,
                request.IDDomicilio 
            );
        }
    }
}