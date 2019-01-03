using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eadLab5.DAL
{
    public class FeedbackForm
    {
        public FeedbackForm()
        {
        }
        public string Affordability { get; set; }
        public string Enjoyment { get; set; }
        public string Freedom { get; set; }
        public string ReviewPros { get; set; }
        public string ReviewCons { get; set; }
        public string ReviewImprovement { get; set; }
        public int TripId { get; set; }
        public string StudentName { get; set; }
        public string AdminNo { get; set; }
        public string Country { get; set; }
        public int FeedBackId { get; set; }
        public string DateStart { get; set; }
        public string DateEnd { get; set; }

    }

}