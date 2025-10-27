using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/envios")]
    public class EnvioController : ApiController
    {
        private EnvioDatos _envioDatos = new EnvioDatos();

        // Endpoint: PUT /api/envios/123/actualizar
        [HttpPut]
        [Route("{idEnvio:int}/actualizar")]
        public IHttpActionResult ActualizarEstado(int idEnvio, ActualizarEnvioRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            try
            {
                _envioDatos.ActualizarEstadoEnvio(idEnvio, request.IDEstadoEnvio, request.Tracking );
                return Ok(new { message = "Envío actualizado correctamente." });
            }
            catch (Exception ex)
            {
                // Si  se intenta actualizar un envío "Entregado",
                // el trigger trg_Envio_ValidarEstadoFinal lanza un error
                // y es capturado aca...
                return BadRequest(ex.Message);
            }
        }
    }
}