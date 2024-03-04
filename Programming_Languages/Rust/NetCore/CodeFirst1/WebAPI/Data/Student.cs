using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace WebAPI.Data
{
    public interface IStudent
    {
        int StudentID { get; set; }
        string FirstName { get; set; }
        string LastName { get; set; }
    }

    public class Student : IStudent
    {
        [Key]
        public int StudentID { get; set; }
        [Required]
        [MaxLength(100), MinLength(2)]
        public string FirstName { get; set; } = null!;
        [Required]
        [MaxLength(100), MinLength(2)]
        public string LastName { get; set; } = null!;

        public ICollection<Enrollment> Enrollments { get; set; } = null!;
    }

    public class StudentDto : IStudent 
    {
        public int StudentID { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;

        public StudentDto() { }

        public StudentDto(Student student) { 
            StudentID = student.StudentID;
            FirstName = student.FirstName;
            LastName = student.LastName;
        }

        public Student Map()
        {
            return new Student
            {
                StudentID = StudentID,
                FirstName = FirstName,
                LastName = LastName
            };
        }
    }

    public class StudentDetailsDto : IStudent
    {
        public int StudentID { get; set; }
        public string FirstName { get; set; } = null!;
        public string LastName { get; set; } = null!;

        public ICollection<EnrollmentDetailsDto> Enrollments { get; set; } = null!;

        public StudentDetailsDto(Student student)
        {
            StudentID = student.StudentID;
            FirstName = student.FirstName;
            LastName = student.LastName;
            Enrollments = student.Enrollments.Select(e => new EnrollmentDetailsDto(e)).ToList();
        }
    }
}
