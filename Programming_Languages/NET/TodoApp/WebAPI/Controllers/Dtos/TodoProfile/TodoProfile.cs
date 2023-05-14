using AutoMapper;
using WebAPI.Controllers.Mappings;
using WebAPI.Repository.Data;

namespace WebAPI.Controllers.Dtos.TodoProfile
{
    public class TodoProfile : Profile
    {
        public TodoProfile() 
        { 
            CreateMap<User, UserDto>();

            CreateMap<User, UserDetailDto>();

            CreateMap<Todo, TodoDto>();
        }
    }
}
