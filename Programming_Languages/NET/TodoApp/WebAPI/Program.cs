using WebAPI.Controllers.Dtos.TodoProfile;
using WebAPI.Extensions;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

builder.Services.AddRepositoriesExtension();

builder.Services.AddCorsExtension(builder.Configuration);

builder.Services.AddDbContextExtension(builder.Configuration);

builder.Services.AddAuthenticationExtension(builder.Configuration);

builder.Services.AddAuthorization();

builder.Services.AddAutoMapper(typeof(TodoProfile));

var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseHttpsRedirection();

app.UseCors();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();
