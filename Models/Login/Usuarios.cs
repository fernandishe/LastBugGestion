using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LastBugGestion.Models.Login
{
    public class Usuarios
    {
        [Key]
        public string Rut { get; set; }
        public string Correo { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Clave { get; set; }
        [ForeignKey("codigoRol")]
        public string CodigoRol { get; set; }
    }
}
