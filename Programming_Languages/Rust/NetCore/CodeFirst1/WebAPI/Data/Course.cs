using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Data
{
    public interface ICourse
    {
        int CourseID { get; set; }
        string Title { get; set; }
        int Credits { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public class Course : ICourse
    {
        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CourseID { get; set; }
        [Required]
        [MaxLength(100), MinLength(3)]
        public string Title { get; set; } = null!;
        [Required]
        public int Credits { get; set; }
        public DateTime CreatedDate { get; set; }

        public ICollection<Enrollment> Enrollments { get; set; } = null!;
    }

    public class CourseDto : ICourse
    {
        public int CourseID { get; set; }
        public string Title { get; set; } = null!;
        public int Credits { get; set; }
        public DateTime CreatedDate { get; set; }

        public CourseDto() { }

        public CourseDto(Course course)
        {
            CourseID = course.CourseID;
            Title = course.Title;
            Credits = course.Credits;
            CreatedDate = course.CreatedDate;
        }

        public Course Map()
        {
            return new Course
            {
                CourseID = CourseID,
                Title = Title,
                Credits = Credits,
                CreatedDate = CreatedDate
            };
        }
    }
    
    public class CourseDetailsDto : ICourse
    {
        public int CourseID { get; set; }
        public string Title { get; set; } = null!;
        public int Credits { get; set; }
        public DateTime CreatedDate { get; set; }

        public ICollection<EnrollmentDetailsDto> Enrollments { get; set; } = null!;

        public CourseDetailsDto(Course course)
        {
            CourseID = course.CourseID;
            Title = course.Title;
            Credits = course.Credits;
            CreatedDate = course.CreatedDate;
            Enrollments = course.Enrollments.Select(e => new EnrollmentDetailsDto(e)).ToList();
        }
    }
}
