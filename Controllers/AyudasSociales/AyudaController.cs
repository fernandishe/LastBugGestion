using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.Data.SqlClient;
using LastBugGestion.Data;
using System;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using LastBugGestion.Models.AyudasSociales;

namespace LastBugGestion.Controllers.AyudasSociales
{
    [ApiController]
    [Route("api/[controller]")]
    public class AyudaController : ControllerBase
    {
        private readonly LastBugGestionContext _context;

        public AyudaController(LastBugGestionContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<ActionResult<AyudaParams>> AsignarAyuda(AyudaParams parametros)
        {
            try
            {
                await _context.Database.ExecuteSqlRawAsync(
                    "exec asignaAyudaRegionComuna @codigoRegion, @codigoComuna, @titulo, @detalle, @usuarioCreacion",
                    new SqlParameter("@codigoRegion", parametros.CodigoRegion),
                    new SqlParameter("@codigoComuna", parametros.CodigoComuna),
                    new SqlParameter("@titulo", parametros.Titulo),
                    new SqlParameter("@detalle", parametros.Detalle),
                    new SqlParameter("@usuarioCreacion", parametros.UsuarioCreacion)
                );
                return Ok("Ayuda asignada correctamente");
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
