﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.DataAccess;
using IMS.Entity;

namespace IMS.Repository
{
    public class ThirdCategoriesRepo
    {
        private InventoryDBDataAccess iDB{get; set;}

        public ThirdCategoriesRepo()
        {
            this.iDB = new InventoryDBDataAccess();
        }

        //view & search
        public List<ThirdCategories> GetAll(string key)
        {
            List<ThirdCategories> thirdCategoriesList = new List<ThirdCategories>();
            string sql;

            try
            {
                if (key == null)
                    sql =
                        @"SELECT ThirdCategories.ThirdCategoryId AS ThirdCategoryId, ThirdCategories.ThirdCategoryName AS ThirdCategoryName,
                          ThirdCategories.ThirdCategoryImage AS ThirdCategoryImage, SecondCategories.SecondCategoryId AS SecondCategoryId, 
                          SecondCategories.SecondCategoryName AS SecondCategoryName
                          FROM ThirdCategories
				          LEFT JOIN SecondCategories
                          ON ThirdCategories.SecondCategoryId = SecondCategories.SecondCategoryId";
                else
                    sql = @"SELECT ThirdCategories.ThirdCategoryId AS ThirdCategoryId, ThirdCategories.ThirdCategoryName AS ThirdCategoryName,
                          ThirdCategories.ThirdCategoryImage AS ThirdCategoryImage, SecondCategories.SecondCategoryId AS SecondCategoryId, 
                          SecondCategories.SecondCategoryName AS SecondCategoryName
                          FROM ThirdCategories
				          LEFT JOIN SecondCategories
                          ON ThirdCategories.SecondCategoryId = SecondCategories.SecondCategoryId
                          where ThirdCategories.ThirdCategoryName like '%" + key + "%' or SecondCategories.SecondCategoryName like '%" + key + "%' ; ";

                var dt = this.iDB.ExecuteQueryTable(sql);

                int x = 0;
                while (x < dt.Rows.Count)
                {
                    ThirdCategories th = this.ConvertToEntity(dt.Rows[x]);
                    thirdCategoriesList.Add(th);
                    x++;
                }
                return thirdCategoriesList;
            }

            catch (Exception e)
            {
                return null;
                throw;
            }
        }

        private ThirdCategories ConvertToEntity(DataRow row)
        {
            if (row == null)
            {
                return null;
            }

            var thirdCate = new ThirdCategories();
            thirdCate.ThirdCategoryId = Convert.ToInt32(row["ThirdCategoryId"].ToString());
            thirdCate.ThirdCategoryName = row["ThirdCategoryName"].ToString();
            //vendor.VendorImage = Convert.ToDouble(row["VendorImage"].ToString());
            thirdCate.SecondCategoryId = Convert.ToInt32(row["SecondCategoryId"].ToString());
            thirdCate.SecondCategoryName = row["SecondCategoryName"].ToString();

            return thirdCate;
        }


        //LoadComboBox
        public DataTable LoadComboThirdCategoryName()
        {
            string sql;
            try
            {
                sql = @"SELECT ThirdCategoryId , ThirdCategoryName FROM ThirdCategories";
                return this.iDB.ExecuteQueryTable(sql);
            }
            catch (Exception e)
            {
                throw;
            }
        }

        public List<ThirdCategories> GetThirdCategoryList()
        {
            try
            {
                DataTable dt = LoadComboThirdCategoryName();

                List<ThirdCategories> list = new List<ThirdCategories>();

                foreach (DataRow row in dt.Rows)
                {
                    list.Add(ConvertToThirdCateList(row));
                }
                return list;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);

                throw;
            }
        }

        public int GetThirdCateId(string thirdCateName)
        {
            try
            {
                List<ThirdCategories> list = GetThirdCategoryList();

                foreach (ThirdCategories thirdCate in list)
                {
                    if (thirdCate.ThirdCategoryName == thirdCateName)
                    {
                        return thirdCate.ThirdCategoryId;
                    }
                }

                return 0;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);

                throw;
            }
        }

        private ThirdCategories ConvertToThirdCateList(DataRow row)
        {
            try
            {
                if (row == null)
                {
                    return null;
                }

                var thC = new ThirdCategories();

                thC.ThirdCategoryName = row["ThirdCategoryName"].ToString();
                thC.ThirdCategoryId = Convert.ToInt32(row["ThirdCategoryId"].ToString());
                return thC;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);

                throw;
            }
        }
    }

}
