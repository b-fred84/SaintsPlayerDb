
namespace PlayerDb.Models
{
    public class Player
    {
        public string FullName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Position { get; set; }
        public string PositionFull { get; set; }
        public string Appearances { get; set; }
        public string AppearancesAsSub { get; set; }
        public string Goals { get; set; }
        public string YearsAtClub { get; set; }
        public string Nationality { get; set; }
        public string Link { get; set; }
        public List<YearRange> YearRanges { get; set; }
    }
}
