using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/reportes")]
    public class ReportesController : ApiController
    {
        private ReportesLogica _reportesLogica = new ReportesLogica();

        
        [HttpPost]
        [Route("ventas")]
        public IHttpActionResult GetReporteVentas(ReporteVentasRequest request)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            try
            {
                var reporte = _reportesLogica.ObtenerReporteVentas(request);
                return Ok(reporte);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [Route("mensual")]
        public IHttpActionResult GetReporteMensual()
        {
            try
            {
                var reporte = _reportesLogica.ObtenerReporteMensual();
                return Ok(reporte);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}