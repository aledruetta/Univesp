using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace WebAPI.Migrations
{
    public partial class FixEnrollments_01 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Grades_Courses_CourseID",
                table: "Grades");

            migrationBuilder.DropForeignKey(
                name: "FK_Grades_Students_StudentID",
                table: "Grades");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Grades",
                table: "Grades");

            migrationBuilder.RenameTable(
                name: "Grades",
                newName: "Enrollments");

            migrationBuilder.RenameIndex(
                name: "IX_Grades_StudentID",
                table: "Enrollments",
                newName: "IX_Enrollments_StudentID");

            migrationBuilder.RenameIndex(
                name: "IX_Grades_CourseID",
                table: "Enrollments",
                newName: "IX_Enrollments_CourseID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Enrollments",
                table: "Enrollments",
                column: "EnrollmentID");

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollments_Courses_CourseID",
                table: "Enrollments",
                column: "CourseID",
                principalTable: "Courses",
                principalColumn: "CourseID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Enrollments_Students_StudentID",
                table: "Enrollments",
                column: "StudentID",
                principalTable: "Students",
                principalColumn: "StudentID",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Enrollments_Courses_CourseID",
                table: "Enrollments");

            migrationBuilder.DropForeignKey(
                name: "FK_Enrollments_Students_StudentID",
                table: "Enrollments");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Enrollments",
                table: "Enrollments");

            migrationBuilder.RenameTable(
                name: "Enrollments",
                newName: "Grades");

            migrationBuilder.RenameIndex(
                name: "IX_Enrollments_StudentID",
                table: "Grades",
                newName: "IX_Grades_StudentID");

            migrationBuilder.RenameIndex(
                name: "IX_Enrollments_CourseID",
                table: "Grades",
                newName: "IX_Grades_CourseID");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Grades",
                table: "Grades",
                column: "EnrollmentID");

            migrationBuilder.AddForeignKey(
                name: "FK_Grades_Courses_CourseID",
                table: "Grades",
                column: "CourseID",
                principalTable: "Courses",
                principalColumn: "CourseID",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Grades_Students_StudentID",
                table: "Grades",
                column: "StudentID",
                principalTable: "Students",
                principalColumn: "StudentID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
