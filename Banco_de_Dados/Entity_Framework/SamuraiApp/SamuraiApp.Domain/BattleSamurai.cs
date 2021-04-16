using System;

namespace SamuraiApp.Domain
{
    public class BattleSamurai
    {
        public int BattleId { get; set; }
        public int SamuraiId { get; set; }

        // Payload for the join table
        public DateTime DateJoined { get; set; }
    }
}