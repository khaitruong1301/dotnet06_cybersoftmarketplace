using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Infrastructure.Repositories;
namespace dotnet06_CybersoftMarketPlace.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {

        private readonly IUserRepository _userRepository;
        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }



        [HttpGet("getAllUser")]
        public async Task<IActionResult> GetAllUser()
        {
            await Task.Delay(100);
            var users = await _userRepository.GetAllAsync();
            return Ok(users);
        }

  
      
    }
}
