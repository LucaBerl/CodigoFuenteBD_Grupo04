using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.Models
{
    
    public class ReporteVentasRequest
    {
        public DateTime Desde { get; set; }
        public DateTime Hasta { get; set; }
        public int? IDMarca { get; set; }
        public int? IDCategoria { get; set; }
    }

    
    public class ReporteVentasView
    {
        public int Anio { get; set; }
        public int Mes { get; set; }
        public string Marca { get; set; }
        public string Categoria { get; set; }
        public int CantPedidos { get; set; }
        public decimal TotalVendido { get; set; }
    }

    
    public class ReporteMensualView
    {
        public int Anio { get; set; }
        public int Mes { get; set; }
        public decimal MontoTotalVentas { get; set; }
        public int CantidadPedidos { get; set; }
    }
}