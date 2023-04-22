using Microsoft.EntityFrameworkCore;
using WebAPI.Data.Context;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

// EntityFramework
builder.Services.AddDbContext<SchoolContext>(
    options => options.UseSqlServer(builder.Configuration.GetConnectionString("CodeFirstDB1"))
);

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
