using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class EstadoDePedidoView
    {
        public int IDPedido { get; set; }
        public int IDCliente { get; set; }
        public string NombreCliente { get; set; }
        public string ApellidoCliente { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string EstadoPedido { get; set; } 
        public decimal? MontoTotal { get; set; }
        public string MetodoPago { get; set; }
        public DateTime? FechaPago { get; set; }
        public string EstadoEnvio { get; set; } 
        public string Tracking { get; set; }
    }
}