using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.BLL
{
    public class ReportesLogica
    {
        private ReportesDatos _reportesDatos = new ReportesDatos();

        public List<ReporteVentasView> ObtenerReporteVentas(ReporteVentasRequest request)
        {
            if (request.Desde > request.Hasta)
            {
                throw new Exception("La fecha 'Desde' no puede ser mayor a la fecha 'Hasta'.");
            }
            // Aseguramos que 'Hasta' incluya todo el día
            request.Hasta = request.Hasta.Date.AddDays(1).AddTicks(-1);

            return _reportesDatos.ObtenerReporteVentas(request);
        }

        public List<ReporteMensualView> ObtenerReporteMensual()
        {
            return _reportesDatos.ObtenerReporteMensual();
        }
    }
}