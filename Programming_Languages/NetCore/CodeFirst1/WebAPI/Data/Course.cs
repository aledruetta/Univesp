using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Data
{
    public interface ICourse
    {
        int CourseID { get; set; }
        string Title { get; set; }
        int Credits { get; set; }
    }

    public class Course : ICourse
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CourseID { get; set; }
        public string Title { get; set; } = null!;
        public int Credits { get; set; }

        public ICollection<Enrollment> Enrollments { get; set; } = null!;
    }

    public class CourseDto : ICourse
    {
        public int CourseID { get; set; }
        public string Title { get; set; } = null!;
        public int Credits { get; set; }

        public CourseDto() { }

        public CourseDto(Course course)
        {
            CourseID = course.CourseID;
            Title = course.Title;
            Credits = course.Credits;
        }

        public Course Map()
        {
            return new Course
            {
                CourseID = CourseID,
                Title = Title,
                Credits = Credits
            };
        }
    }
    
    public class CourseDetailsDto : ICourse
    {
        public int CourseID { get; set; }
        public string Title { get; set; } = null!;
        public int Credits { get; set; }

        public ICollection<EnrollmentDetailsDto> Enrollments { get; set; } = null!;

        public CourseDetailsDto(Course course)
        {
            CourseID = course.CourseID;
            Title = course.Title;
            Credits = course.Credits;
            Enrollments = course.Enrollments.Select(e => new EnrollmentDetailsDto(e)).ToList();
        }
    }
}
