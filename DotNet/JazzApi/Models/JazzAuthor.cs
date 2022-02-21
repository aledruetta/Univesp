namespace JazzApi.Models
{
    public class JazzAuthor
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public DateOnly? BirthDate { get; set; }
        public DateOnly? DeathDate { get; set; }
        public CountryEnum? Country { get; set; }
    }

    public class JazzAuthorDto
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? BirthDate { get; set; }
        public string? DeathDate { get; set; }
        public string? Country { get; set; }
    }

    public enum CountryEnum
    {
        USA, Argentina, Brazil, Nigeria
    }
}