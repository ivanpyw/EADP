using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eadLab5.DAL
{
    public class Interview
    {
        public Interview()
        {

        }
        public string studentName { get; set; }
        public string studentPic { get; set; }
        public string tripName { get; set; }
        public string tripLocation { get; set; }
        public DateTime tripStart { get; set; }
        public DateTime tripEnd { get; set; }
        public int interviewId { get; set; }
    }
}