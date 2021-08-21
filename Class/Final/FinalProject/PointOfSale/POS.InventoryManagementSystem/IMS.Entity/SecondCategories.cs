﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Entity
{
    public class SecondCategories
    {
        public int           SecondCategoryId         { get; set; }
        public string        SecondCategoryName       { get; set; }
        public Nullable<int> MainCategoryId           { get; set; }
        public string        SecondCategoryDescription{ get; set; }
        public byte[]        SecondCategoryImage      { get; set; }

        public virtual MainCategories MainCategory{ get; set; }
        public virtual ICollection<Products_Categories_Map> Products_Categories_Map{ get; set; }
        public virtual ICollection<ThirdCategories> ThirdCategories{ get; set; }

    }
}