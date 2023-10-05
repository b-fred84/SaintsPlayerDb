using DataAccess.Data;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using PlayerDb.Models;
using System.Data.SqlClient;

namespace SaintsPlayerDbSite.Pages
{
    public partial class PlayerTable : ComponentBase
    {
 
        [Inject]
        public PlayerData? PlayerData { get; set; }

        private string _searchString = string.Empty;
        private int _offset = 0;
        private int _limit = 30;
        private bool _isSearch = false;
        private string _sortBy = "LastName"; 
        private string _sortOrder = "ASC";
        private int _totalCount = 1;


        public IEnumerable<Player> Items { get; set; } = new List<Player>();


        protected override async Task OnInitializedAsync()
        {
            await LoadPlayers();
        }

        private async Task LoadPlayers()
        {
            if (string.IsNullOrWhiteSpace(_searchString))
            {
               

                Items = await PlayerData.PlayerSearch("", _offset, _limit, _sortBy, _sortOrder);
                
            }
            else
            {
               
                Items = await PlayerData.PlayerSearch(_searchString, _offset, _limit, _sortBy, _sortOrder);
               
                
            }

            _totalCount += Items.Count();
            if (Items.Count() < 30)
            {
                _totalCount = 1;
                _totalCount += _offset + Items.Count();
            }
            

        }


        private async Task LoadNextPlayers()
        {
            _offset += _limit;
            await LoadPlayers();
        }

        private async Task LoadPreviousPlayers()
        {
            _offset -= _limit;
            if (_offset < 0)
                _offset = 0;
            await LoadPlayers();
            _totalCount += 31;
        }


        private async Task Search()
        {
            _offset = 0;
            _isSearch = true;
            Items = await PlayerData.PlayerSearch(_searchString, _offset, _limit, _sortBy, _sortOrder);
        }

        private async Task SortByColumn(string columnName)
        {
            if (_sortBy == columnName)
            {
                _sortOrder = _sortOrder == "ASC" ? "DESC" : "ASC";
            }
            else
            {
                _sortBy = columnName;
                _sortOrder = "ASC";
            }

             await LoadPlayers(); 
        }



    }
}
