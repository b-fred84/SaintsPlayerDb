using DataAccess.DbAccess;
using PlayerDb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading.Tasks.Dataflow;

namespace DataAccess.Data;

public class PlayerData : IPlayerData
{
    private readonly ISqlDataAccess _db;

    public PlayerData(ISqlDataAccess db)
    {
        _db = db;
    }


    public async Task<List<Player>> PlayerSearch(string input, int offset, int limit, string sortBy, string sortOrder)
    {
        var parameters = new
        {
            Search = input,
            Offset = offset,
            Limit = limit,
            SortBy = sortBy, 
            SortOrder = sortOrder
             
        };
        var results = await _db.LoadData<Player, dynamic>("dbo.PlayerSearch", parameters);
        return results.ToList();
    }
     

}
