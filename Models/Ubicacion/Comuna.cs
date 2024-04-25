using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LastBugGestion.Models.Ubicacion
{
    public class Comuna
    {
        [Key]
        public int Codigo { get; set; }
        public string Nombre { get; set; }

        [ForeignKey("CodigoRegion")]
        public int CodigoRegion { get; set; }
        public string usuarioCreacion { get; set; }
        public string usuarioModificacion { get; set; }
    }
}
