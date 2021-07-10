﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MidExamTask.Employees
{
    internal class ITExecutive : Employee
    {
        private double bonus;

        internal override string EmpId
        {
            set
            {
                this.id = "E-" + value + "-ITE";
            }
        }

        internal ITExecutive(string name, string bloodGroup, double salary, string empPost, EmployeeInfo employeeInfo, double bonus) : base(name, bloodGroup, salary, empPost, employeeInfo)
        {
            this.Bonus = bonus;
            this.Salary = salary;
        }
        internal double Bonus{get; set;}
     
        internal double TotalSalary()
        {
            return (this.bonus + this.Salary);
        }
        internal override void ShowEmployeeInfo() 
        {
            base.ShowEmployeeInfo();
            Console.WriteLine("\tBonus: {0}", this.Bonus);
            Console.WriteLine("\tSalary with bonus: {0}", this.TotalSalary());
        }

        //internal override void M1()
        //{

        //}
    }
}