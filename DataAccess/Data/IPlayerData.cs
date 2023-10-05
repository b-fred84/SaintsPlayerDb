using PlayerDb.Models;

namespace DataAccess.Data
{
    public interface IPlayerData
    {
        Task<List<Player>> PlayerSearch(string input, int offset, int limit, string sortBy, string sortOrder);
    }
}