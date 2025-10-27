using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    public class Pedido
    {
        public int IDPedido { get; set; }
        public int IDCliente { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaUltMovimiento { get; set; }
        public decimal? MontoTotal { get; set; }
        public int IDEstadoPedido { get; set; }
    }
}