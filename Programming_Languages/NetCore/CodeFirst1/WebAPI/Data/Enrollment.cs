using System.ComponentModel.DataAnnotations;
using WebAPI.Data.Context;

namespace WebAPI.Data
{
    public enum Grade
    {
        A, B, C, D, F
    }

    public interface IEnrollment
    {
        int EnrollmentID { get; set; }
        Grade? Grade { get; set; }
        DateTime EnrollmentDate { get; set; }
    }

    public class Enrollment : IEnrollment
    {
        public int EnrollmentID { get; set; }
        public Grade? Grade { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public int CourseID { get; set; }
        public int StudentID { get; set; }

        public Course Course { get; set; } = null!;
        public Student Student { get; set; } = null!;
    }

    public class EnrollmentDto : IEnrollment
    {
        public int EnrollmentID { get; set; }
        public Grade? Grade { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public int CourseID { get; set; }
        public int StudentID { get; set; }

        public Enrollment Map()
        {
            return new Enrollment
            {
                EnrollmentID = EnrollmentID,
                Grade = Grade,
                EnrollmentDate = EnrollmentDate,
                CourseID = CourseID,
                StudentID = StudentID,
            };
        }
    }

    public class EnrollmentDetailsDto : IEnrollment
    {
        public int EnrollmentID { get; set; }
        public Grade? Grade { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public CourseDto Course { get; set; } = null!;
        public StudentDto Student { get; set; } = null!;

        public EnrollmentDetailsDto(Enrollment enrollment)
        {
            EnrollmentID = enrollment.EnrollmentID;
            Grade = enrollment.Grade;
            EnrollmentDate = enrollment.EnrollmentDate;
            Course = new CourseDto(enrollment.Course);
            Student = new StudentDto(enrollment.Student);
        }
    }
}
